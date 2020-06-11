using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectPriorityControl.Data;
using ProjectPriorityControl.Models;
using ProjectPriorityControl.ViewModels;

namespace ProjectPriorityControl.Controllers
{
    [Authorize]
    public class ProjectController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public ProjectController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Projects
        public async Task<IActionResult> Index()
        {
            List<ProjectViewModel> data = new List<ProjectViewModel>();

            List<Project> projects = new List<Project>();

            if (User.IsInRole("Staff"))
            {
                projects = await _context.Project.Include(a => a.Member).Where(a => a.DeletedDate == null).ToListAsync();
                projects = projects.Where(a => a.Member.Any(b => b.UserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id)).ToList();
            }
            else
            {
                projects = await _context.Project.Where(a => a.DeletedDate == null).ToListAsync();
            }

            foreach(var project in projects)
            {
                var manager = await _userManager.FindByIdAsync(project.ManagerId);
                var member = await _context.Member.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).ToListAsync();
                data.Add(new ProjectViewModel
                {
                    Id = project.Id,
                    Name = project.Name,
                    Code = project.Code,
                    Status = project.Status,
                    MembersCount = member.Count().ToString(),
                    Manager = manager != null ? manager.Name : "-"
                });
            }
            return View(data);
        }

        // GET: Projects/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Project
                .FirstOrDefaultAsync(m => m.Id == id);
            if (project == null)
            {
                return NotFound();
            }

            return View(project);
        }

        public async Task<IActionResult> Summary(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            
            var project = await _context.Project
                .FirstOrDefaultAsync(m => m.Id == id);
            if (project != null)
            {

                SummaryViewModel data = new SummaryViewModel
                {
                    Id = project.Id,
                    Name = project.Name,
                    Description = project.Description,
                    StartDate = project.StartDate != null ? project.StartDate.Value.ToShortDateString() : "-",
                    Manager = new MemberViewModel(),
                    Status = project.Status,
                    Tags = project.Tags,
                    TaskProgress = "0",
                    Members = new List<MemberViewModel>(),
                    Tasks = new List<TaskViewModel>()
                };

                var manager = await _userManager.FindByIdAsync(project.ManagerId);
                if(manager != null)
                {
                    data.Manager.UserId = manager.Id;
                    data.Manager.Name = manager.Name;
                    data.Manager.Email = manager.Email;
                }

                var members = _context.Member.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).ToList();
                foreach(var member in members)
                {
                    var memberDetail = await _userManager.FindByIdAsync(member.UserId);
                    data.Members.Add(new MemberViewModel
                    {
                        Id = member.Id,
                        UserId = member.UserId,
                        Name = memberDetail != null ? memberDetail.Name : "-",
                        Email = memberDetail != null ? memberDetail.Email : "-",
                        JoinedOn = member.CreatedDate
                    });
                }

                var tasks = _context.Task.Where(a => a.DeletedDate == null && a.Status == "Pending" && a.ProjectId == project.Id).ToList();
                data.IssueTasks = new Tuple<string, string>("0","0");
                data.BugTasks = new Tuple<string, string>("0", "0");
                data.FeatureTasks = new Tuple<string, string>("0", "0");
                data.AssignTasks = new Tuple<string, string>("0", "0");
                if (tasks.Count() > 0)
                {
                    data.IssueTasks = new Tuple<string, string>( tasks.Where(a => a.Status != "Finish" && a.Type == "Issue").Count().ToString(), tasks.Where(a => a.Status != "Finish" && a.Type != "Issue").Count().ToString());
                    data.BugTasks = new Tuple<string, string>( tasks.Where(a => a.Status != "Finish" && a.Type == "Bug").Count().ToString(), tasks.Where(a => a.Status != "Finish" && a.Type != "Bug").Count().ToString());
                    data.FeatureTasks = new Tuple<string, string>( tasks.Where(a => a.Status != "Finish" && a.Type == "Feature").Count().ToString(), tasks.Where(a => a.Status != "Finish" && a.Type != "Feature").Count().ToString());
                    data.AssignTasks = new Tuple<string, string>( tasks.Where(a => a.Status != "Finish" && a.AssignUserId != null).Count().ToString(), tasks.Where(a => a.Status != "Finish" && a.AssignUserId == null).Count().ToString());
                    foreach (var task in tasks.Where(a => a.Status != "Finish").OrderBy(a => a.Rank))
                    {
                        var assignee = await _userManager.FindByIdAsync(task.AssignUserId);
                        data.Tasks.Add(new TaskViewModel
                        {
                            Id = task.Id,
                            Name = task.Name,
                            Type = task.Type,
                            AssignedTo = assignee != null ? assignee.Name : "-",
                            Rank = task.Rank,
                            Score = Math.Round(task.Score,3),
                            Status = task.Status
                        });
                    }
                }

                data.TaskProgress = Math.Round((Convert.ToDecimal(_context.Task.Where(a => a.DeletedDate == null && a.Status == "Finish" && a.ProjectId == project.Id).Count()) / Convert.ToDecimal(_context.Task.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).Count())) * 100, 0).ToString();
                return View(data);

            }

            return NotFound();

        }

        public IActionResult _ChangeProject()
        {
            List<Project> projects = new List<Project>();
            if (User.IsInRole("Manager"))
            {
                projects = _context.Project.Where(a => a.DeletedDate == null && a.ManagerId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id && a.Status != "Finish" && a.Status != "Cancel").ToList();
            }
            else if(User.IsInRole("Staff"))
            {
                projects = _context.Project.Where(a => a.DeletedDate == null && a.Member.Any(b => b.UserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id) && a.Status != "Finish" && a.Status != "Cancel").ToList();
            }

            var project = new SelectList(projects, "Id", "Name");
            if (!String.IsNullOrWhiteSpace(HttpContext.Session.GetString("ProjectId")))
            {
                project = new SelectList(projects, "Id", "Name", HttpContext.Session.GetString("ProjectId"));
            }
            ViewBag.Projects = project;
            return PartialView("_ChangeProject");
        }

        [HttpPost]
        public async Task<IActionResult> _ChangeProject(ChangeProjectViewModel model)
        {
            var project = await _context.Project.FindAsync(model.ProjectId);

            if(project != null)
            {
                HttpContext.Session.SetString("ProjectId", project.Id.ToString());
                HttpContext.Session.SetString("ProjectName", project.Name);
                return RedirectToAction("Summary", "Project", new { id = project.Id });
                
            }
            else
            {
                if(!String.IsNullOrWhiteSpace(HttpContext.Session.GetString("ProjectId")) && !String.IsNullOrWhiteSpace(HttpContext.Session.GetString("ProjectName")))
                {
                    HttpContext.Session.Remove("ProjectId");
                    HttpContext.Session.Remove("ProjectName");
                }
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: Projects/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Projects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,Code,Description,Tags")] CreateProjectViewModel model)
        {
            if (ModelState.IsValid)
            {
                if(_context.Project.Where(a => a.Code == model.Code && a.DeletedDate == null).FirstOrDefault() == null)
                {
                    Project project = new Project
                    {
                        Id = Guid.NewGuid(),
                        Name = model.Name,
                        Code = model.Code.ToUpper(),
                        Status = "Pending",
                        Description = model.Description,
                        CreatedDate = DateTime.Now,
                        CreatedBy = User.Identity.Name,
                        Tags = model.Tags
                    };
                    var user = _context.Users.Where(m => m.UserName == User.Identity.Name).FirstOrDefault();
                    project.ManagerId = user.Id;
                    _context.Add(project);

                    foreach (Criteria criteria in _context.Criteria.Where(m => m.IsDefault && m.DeletedDate == null).ToList())
                    {
                        _context.Criteria.Add(new Criteria
                        {
                            Name = criteria.Name,
                            Description = criteria.Description,
                            Type = criteria.Type,
                            Weight = criteria.Weight,
                            CreatedBy = User.Identity.Name,
                            CreatedDate = DateTime.Now,
                            IsDefault = false,
                            ProjectId = project.Id
                        });
                    }

                    await _context.SaveChangesAsync();
                }
                else
                {
                    ModelState.AddModelError(string.Empty, String.Format("Code '{0}' has been taken.", model.Code));
                    return View(model);
                }
            }

            return RedirectToAction("Index", "Project");
        }

        // GET: Projects/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Project.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }
            CreateProjectViewModel data = new CreateProjectViewModel
            {
                Id = project.Id,
                Name = project.Name,
                Description = project.Description,
                Tags = project.Tags,
                Code = project.Code
            };
            return View(data);
        }

        // POST: Projects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Name,Description,Tags,Code")] CreateProjectViewModel project)
        {
            if (id != project.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var data = _context.Project.Find(id);
                    data.Name = project.Name;
                    data.Description = project.Description;
                    data.Tags = project.Tags;
                    data.Code = project.Code;
                    data.UpdatedBy = User.Identity.Name;
                    data.UpdatedDate = DateTime.Now;
                    _context.Update(data);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProjectExists(project.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(project);
        }

        // GET: Projects/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project = await _context.Project
                .FirstOrDefaultAsync(m => m.Id == id);
            if (project == null)
            {
                return NotFound();
            }

            return View(project);
        }

        // POST: Projects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var project = await _context.Project.FindAsync(id);
            _context.Project.Remove(project);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProjectExists(Guid id)
        {
            return _context.Project.Any(e => e.Id == id);
        }
    }
}
