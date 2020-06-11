using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectPriorityControl.Data;
using ProjectPriorityControl.Models;
using ProjectPriorityControl.ViewModels;

namespace ProjectPriorityControl.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public HomeController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            DashboardViewModel data = new DashboardViewModel
            {
                Users = _userManager.GetUsersInRoleAsync("Staff").Result.Count().ToString(),
                ProjectList = new List<ProjectViewModel>(),
                TaskList = new List<TaskViewModel>()
            };

            List<Project> projects = new List<Project>();

            if (User.IsInRole("Manager"))
            {
                projects = _context.Project.Where(a => a.DeletedDate == null && a.ManagerId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id && a.Status != "Finish" && a.Status != "Cancel").ToList();
            }
            else if(User.IsInRole("Staff"))
            {
                projects = _context.Project.Include(a => a.Member).Where(a => a.DeletedDate == null && a.Member.Any(b => b.UserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id) && a.Status != "Finish" && a.Status != "Cancel").ToList();
            }

            data.Projects = projects.Count().ToString();
            var pendingTask = 0;
            var completedTask = 0;
            var inProgressTask = 0;
            foreach(var project in projects)
            {
                var tasks = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).ToList();

                if (User.IsInRole("Manager"))
                {
                    pendingTask = pendingTask + tasks.Where(a => a.Status == "Pending").Count();
                    completedTask = completedTask + tasks.Where(a => a.Status == "Finish").Count();
                    inProgressTask = inProgressTask + tasks.Where(a => a.Status == "Progress").Count();
                }
                else if (User.IsInRole("Staff"))
                {
                    pendingTask = pendingTask + tasks.Where(a => a.Status == "Pending" && a.AssignUserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id).Count();
                    completedTask = completedTask + tasks.Where(a => a.Status == "Finish" && a.AssignUserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id).Count();
                    inProgressTask = inProgressTask + tasks.Where(a => a.Status == "Progress" && a.AssignUserId == _userManager.FindByNameAsync(User.Identity.Name).Result.Id).Count();
                }

                data.ProjectList.Add(new ProjectViewModel
                {
                    Code = project.Code,
                    Name = project.Name,
                    Progress = tasks.Count() > 0 ? Math.Round((Convert.ToDecimal(tasks.Where(a => a.Status == "Finish").Count()) / Convert.ToDecimal(tasks.Count())) * 100, 0).ToString() : "0",
                    MembersCount = _context.Member.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).ToList().Count().ToString(),
                    Status = project.Status
                });

            }

            data.PendingTasks = pendingTask.ToString();
            data.CompletedTasks = completedTask.ToString();
            data.InProgressTasks = inProgressTask.ToString();
            return View(data);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
