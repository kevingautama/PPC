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
using Task = ProjectPriorityControl.Models.Task;

namespace ProjectPriorityControl.Controllers
{
    [Authorize]
    public class TaskController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public TaskController(ApplicationDbContext context,UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Task
        public IActionResult Index()
        {
            var projectId = HttpContext.Session.GetString("ProjectId");
            List<TaskViewModel> data = new List<TaskViewModel>();
            if (!String.IsNullOrWhiteSpace(projectId))
            {
                var tasks = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == new Guid(projectId)).ToList();

                foreach(var task in tasks)
                {
                    var user = "-";
                    if (!String.IsNullOrWhiteSpace(task.AssignUserId))
                    {
                        user = _userManager.FindByIdAsync(task.AssignUserId).Result.Name;
                    }
                    data.Add(new TaskViewModel
                    {
                        Id = task.Id,
                        Name = task.Name,
                        Type = task.Type,
                        AssignedTo = user,
                        Rank = task.Rank,
                        Status = task.Status
                    });
                }

                return View(data);
            }
            else
            {
                return NotFound();
            }
        }

        // GET: Task/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var task = await _context.Task
                .Include(t => t.Project)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (task == null)
            {
                return NotFound();
            }

            return View(task);
        }

        // GET: Task/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Task/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,Description,Type")] TaskViewModel task)
        {
            if (ModelState.IsValid)
            {
                Task data = new Task
                {
                    Id = Guid.NewGuid(),
                    Name = task.Name,
                    Type = task.Type,
                    Status = "Pending",
                    AssignUserId = null,
                    Rank = null,
                    Score = 0,
                    Prioritize = null,
                    Description = task.Description,
                    CreatedDate = DateTime.Now,
                    CreatedBy = User.Identity.Name,
                    ProjectId = new Guid(HttpContext.Session.GetString("ProjectId"))
                };
                _context.Add(data);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(task);
        }

        // GET: Task/Edit/5
        public IActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var task = _context.Task.Find(id);
            if (task == null)
            {
                return NotFound();
            }

            var assignee = _userManager.FindByIdAsync(task.AssignUserId).Result;

            List<NoteViewModel> dataNotes = new List<NoteViewModel>();
            List<RatingViewModel> dataRating = new List<RatingViewModel>();

            var notes = _context.Note.Where(a => a.DeletedDate == null && a.TaskId == task.Id);

            foreach(var note in notes)
            {
                dataNotes.Add(new NoteViewModel
                {
                    Id = note.Id,
                    Type = note.Type,
                    Content = note.Content
                });
            }

            var ratings = _context.Rating.Where(a => a.DeletedDate == null && a.TaskId == task.Id).ToList();

            foreach(var rating in ratings)
            {
                var criteria = _context.Criteria.Where(a => a.DeletedDate == null && a.Id == rating.CriteriaId).FirstOrDefault();
                if(criteria != null)
                {
                    dataRating.Add(new RatingViewModel
                    {
                        Id = rating.Id,
                        CriteriaName = criteria.Name + " (" + criteria.Type + ")",
                        CriteriaDescription = String.IsNullOrWhiteSpace(criteria.Description) ? "No description" : criteria.Description,
                        Value = rating.Value
                    });
                }
            }

            TaskViewModel data = new TaskViewModel
            {
                Id = task.Id,
                Name = task.Name,
                Type = task.Type,
                Description = task.Description,
                AssignedTo = assignee != null ? assignee.Name : "-" , 
                Rank = task.Rank,
                Score = Math.Round(task.Score,3),
                StartDate = task.StartDate,
                FinishDate = task.FinishDate,
                LastUpdated = task.UpdatedDate,
                Status = task.Status,
                Ratings = dataRating.OrderBy(a => a.CriteriaName).ToList(),
                Notes = dataNotes,
                IsPrioritize = task.Prioritize == null ? "No" : "Yes ("+task.Prioritize.Value +")"
            };

            return View(data);
        }

        // POST: Task/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Name,Description,Type,Status,Rank,Score,LastUpdated,Notes,Ratings")] TaskViewModel task)
        {
            if (id != task.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var model = _context.Task.Find(id);
                    model.Name = task.Name;
                    model.Type = task.Type;
                    model.Description = task.Description;
                    _context.Update(model);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaskExists(task.Id))
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

            List<NoteViewModel> dataNotes = new List<NoteViewModel>();
            List<RatingViewModel> dataRating = new List<RatingViewModel>();

            var notes = _context.Note.Where(a => a.DeletedDate == null && a.TaskId == task.Id);

            foreach (var note in notes)
            {
                dataNotes.Add(new NoteViewModel
                {
                    Id = note.Id,
                    Type = note.Type,
                    Content = note.Content
                });
            }

            var ratings = _context.Rating.Where(a => a.DeletedDate == null && a.TaskId == task.Id).ToList();

            foreach (var rating in ratings)
            {

                dataRating.Add(new RatingViewModel
                {
                    Id = rating.Id,
                    CriteriaName = _context.Criteria.Find(rating.CriteriaId).Name,
                    Value = rating.Value
                });
            }

            task.Ratings = dataRating;
            task.Notes = dataNotes;

            return View(task);
        }

        // GET: Task/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var task = await _context.Task
                .Include(t => t.Project)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (task == null)
            {
                return NotFound();
            }

            return View(task);
        }

        // POST: Task/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (id == null)
            {
                return NotFound();
            }

            try
            {
                var task = await _context.Task.FindAsync(id);
                if (task == null)
                {
                    return NotFound();
                }

                task.DeletedDate = DateTime.Now;
                task.DeletedBy = User.Identity.Name;

                _context.Task.Update(task);

                foreach(var ratingCollection in _context.Rating.Where(a => a.TaskId == task.Id))
                {
                    ratingCollection.DeletedBy = User.Identity.Name;
                    task.DeletedDate = DateTime.Now;
                    _context.Rating.Update(ratingCollection);
                }

                _context.SaveChanges();
                return RedirectToAction("Index", "Task");
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TaskExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        private bool TaskExists(Guid id)
        {
            return _context.Task.Any(e => e.Id == id);
        }

        [HttpPost]
        public IActionResult AddNotes(NoteViewModel data)
        {
            var note = new Note
            {
                Id = Guid.NewGuid(),
                Type = data.Type,
                TaskId = data.Id,
                Content = data.Content,
                CreatedBy = User.Identity.Name,
                CreatedDate = DateTime.Now
            };

            _context.Note.Add(note);
            _context.SaveChanges();

            return RedirectToAction("Edit", "Task", new { id = data.Id });
        }

        public IActionResult AddDepedency(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }


            var task = _context.Task.Find(id);

            return View(task);
        }

    }
}
