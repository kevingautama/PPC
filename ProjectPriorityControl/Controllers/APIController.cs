using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ProjectPriorityControl.Data;
using ProjectPriorityControl.Models;
using ProjectPriorityControl.ViewModels;

namespace ProjectPriorityControl.Controllers
{
    [Route("api")]
    [ApiController]
    public class APIController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public APIController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        [HttpGet]
        [Route("Staffs")]
        public IActionResult GetStaff([FromQuery(Name = "search")]string search)
        {
            var projectId = HttpContext.Session.GetString("ProjectId");

            var members = _context.Member.Where(a => a.DeletedDate == null && a.ProjectId == new Guid(projectId)).ToList();

            var staffs = _userManager.GetUsersInRoleAsync("Staff").Result.Where(m => m.IsActive == true && (m.Name.Contains(search) || m.Email.Contains(search)) && !(members.Select(a => a.UserId).Contains(m.Id)));

            List < MemberViewModel > data = new List<MemberViewModel>();

            foreach (var staff in staffs)
            {
                data.Add(new MemberViewModel
                {
                    UserId = staff.Id,
                    Name = staff.Name,
                    Email = staff.Email
                });
            }

            return Ok(data);
        }

        [HttpGet]
        [Route("Members")]
        public async Task<IActionResult> GetMembers()
        {
            var projectId = HttpContext.Session.GetString("ProjectId");

            List<MemberViewModel> data = new List<MemberViewModel>();

            if (!String.IsNullOrWhiteSpace(projectId))
            {
                var members = _context.Member.Where(a => a.DeletedDate == null && a.ProjectId == new Guid(projectId)).ToList();
                foreach (var item in members)
                {
                    var user = await _userManager.FindByIdAsync(item.UserId);
                    data.Add(new MemberViewModel
                    {
                        Id = item.Id,
                        Name = user.Name,
                        Email = user.Email,
                        JoinedOn = item.CreatedDate
                    });
                }
            }

            return Ok(data);
        }

        [HttpPost]
        [Route("Members")]
        public IActionResult AddMember(MemberViewModel data)
        {
            var projectId = HttpContext.Session.GetString("ProjectId");

            _context.Member.Add(new Models.Member
            {
                UserId = data.UserId,
                ProjectId = new Guid(projectId),
                CreatedDate = DateTime.Now,
                CreatedBy = User.Identity.Name
            });

            if (_context.SaveChanges() > 0)
            {
                return Ok();
            }

            return NotFound();
        }

        [HttpDelete]
        [Route("Members")]
        public IActionResult RemoveMember(MemberViewModel data)
        {

            var member = _context.Member.Find(data.Id);
            member.DeletedDate = DateTime.Now;
            member.DeletedBy = User.Identity.Name;

            _context.Member.Update(member);

            if (_context.SaveChanges() > 0)
            {
                return Ok();
            }

            return NotFound();
        }

        [HttpGet]
        [Route("Rating/{id}")]
        public IActionResult GetRating(Guid id)
        {
            var task = _context.Task.Find(id);

            if(task != null)
            {
                List<RatingViewModel> model = new List<RatingViewModel>();
                var criterias = _context.Criteria.Where(a => a.DeletedDate == null && a.ProjectId == task.ProjectId);
                foreach (var criteria in criterias)
                {
                    var rating = _context.Rating.Where(a => a.DeletedDate == null && a.TaskId == task.Id && a.CriteriaId == criteria.Id).FirstOrDefault();

                    if(rating != null)
                    {
                        model.Add(new RatingViewModel
                        {
                            Id = rating.Id,
                            CriteriaId = criteria.Id,
                            CriteriaName = criteria.Name + " (" + criteria.Type + ")",
                            Value = rating.Value,
                            Changes = "Edit"
                        });
                    }
                    else
                    {
                        model.Add(new RatingViewModel
                        {
                            CriteriaId = criteria.Id,
                            CriteriaName = criteria.Name + " (" + criteria.Type + ")",
                            CriteriaDescription = String.IsNullOrWhiteSpace(criteria.Description) ? "No Description" : criteria.Description,
                            Value = 0.5,
                            Changes = "Add"
                        });
                    }
                }

                return Ok(model.OrderBy(a => a.CriteriaName));
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("Rating/{id}")]
        public IActionResult SetRating(Guid id,List<RatingViewModel> data)
        {
            var task = _context.Task.Find(id);

            if (task != null)
            {
                foreach(var item in data)
                {
                    if(item.Changes == "Add")
                    {
                        _context.Rating.Add(new Models.Rating
                        {
                            Id = Guid.NewGuid(),
                            CriteriaId = item.CriteriaId,
                            TaskId = task.Id,
                            Value = item.Value,
                            CreatedDate = DateTime.Now,
                            CreatedBy = User.Identity.Name
                        });
                    }
                    else if(item.Changes == "Edit")
                    {
                        var rating = _context.Rating.Find(item.Id);

                        rating.Value = item.Value;
                        rating.UpdatedBy = User.Identity.Name;
                        rating.UpdatedDate = DateTime.Now;
                        _context.Rating.Update(rating);
                    }
                }

                task.UpdatedDate = DateTime.Now;
                task.UpdatedBy = User.Identity.Name;
                task.Score = 0;
                task.Rank = null;
                _context.Task.Update(task);

                _context.SaveChanges();

                return Ok();
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("Task/Assign")]
        public IActionResult AssignTask(AssignTaskViewModel data)
        {
            var task = _context.Task.Find(data.TaskId);

            var userId = _context.Member.Find(data.MemberId).UserId;

            task.AssignUserId = userId;
            task.UpdatedBy = User.Identity.Name;
            task.UpdatedDate = DateTime.Now;
            _context.Task.Update(task);
            _context.SaveChanges();

            return RedirectToAction("Edit", "Task", new { id = data.TaskId });
        }

        [HttpPost]
        [Route("Task/Start/{id}")]
        public IActionResult StartTask(Guid id)
        {
            var task = _context.Task.Find(id);

            if(task != null)
            {
                task.StartDate = DateTime.Now;
                task.UpdatedBy = User.Identity.Name;
                task.UpdatedDate = DateTime.Now;
                task.Status = "Progress";
                _context.Task.Update(task);
                _context.SaveChanges();

                return RedirectToAction("Edit", "Task", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Task/Finish/{id}")]
        public IActionResult FinishTask(Guid id)
        {
            var task = _context.Task.Find(id);

            if (task != null)
            {
                task.FinishDate = DateTime.Now;
                task.UpdatedBy = User.Identity.Name;
                task.UpdatedDate = DateTime.Now;
                task.Status = "Finish";
                _context.Task.Update(task);
                _context.SaveChanges();

                return RedirectToAction("Edit", "Task", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Project/Start/{id}")]
        public IActionResult StartProject(Guid id)
        {
            var project = _context.Project.Find(id);

            if (project != null)
            {
                project.UpdatedBy = User.Identity.Name;
                project.UpdatedDate = DateTime.Now;
                project.StartDate = DateTime.Now;
                project.Status = "Progress";
                _context.Project.Update(project);
                _context.SaveChanges();

                return RedirectToAction("Summary", "Project", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Project/Pause/{id}")]
        public IActionResult PauseProject(Guid id)
        {
            var project = _context.Project.Find(id);

            if (project != null)
            {
                project.UpdatedBy = User.Identity.Name;
                project.UpdatedDate = DateTime.Now;
                project.Status = "Pause";
                _context.Project.Update(project);
                _context.SaveChanges();

                return RedirectToAction("Summary", "Project", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Project/Finish/{id}")]
        public IActionResult FinishProject(Guid id)
        {
            var project = _context.Project.Find(id);

            if (project != null)
            {
                project.UpdatedBy = User.Identity.Name;
                project.UpdatedDate = DateTime.Now;
                project.Status = "Finish";
                _context.Project.Update(project);
                _context.SaveChanges();

                return RedirectToAction("Summary", "Project", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Project/Cancel/{id}")]
        public IActionResult CancelProject(Guid id)
        {
            var project = _context.Project.Find(id);

            if (project != null)
            {
                project.UpdatedBy = User.Identity.Name;
                project.UpdatedDate = DateTime.Now;
                project.Status = "Cancel";
                _context.Project.Update(project);
                _context.SaveChanges();

                return RedirectToAction("Summary", "Project", new { id });
            }

            return NotFound();
        }

        [HttpPost]
        [Route("Project/Calculate/{id}")]
        public IActionResult Calculate(Guid id)
        {
            var project = _context.Project.Find(id);
            if(project != null)
            {
                var tasks = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == project.Id && a.Status == "Pending");

                var criterias = _context.Criteria.Where(a => a.DeletedDate == null && a.ProjectId == project.Id).ToList();

                List<List<Rating>> ratingCollection = new List<List<Rating>>();

                foreach(var task in tasks)
                {
                    List<Rating> rating = _context.Rating.Where(a => a.DeletedDate == null && a.TaskId == task.Id && criterias.Select(c => c.Id).Contains(a.CriteriaId)).ToList();
                    ratingCollection.Add(rating);
                }

                foreach(var ratings in ratingCollection)
                {
                    double score = 0;
                    foreach (var taskRating in ratings)
                    {
                        var criteria = criterias.Where(a => a.Id == taskRating.CriteriaId).First();
                        
                        if (criteria != null)
                        {
                            double normalizedValue = 0;
                            if (criteria.Type == "Benefit")
                            {
                                normalizedValue = taskRating.Value / ratingCollection.Select(a => a.Where(b => b.DeletedDate == null && b.CriteriaId == criteria.Id).Select(b => b.Value).First()).Max();
                            }
                            else
                            {
                                normalizedValue = ratingCollection.Select(a => a.Where(b => b.DeletedDate == null && b.CriteriaId == criteria.Id).Select(b => b.Value).First()).Min() / taskRating.Value;
                            }

                            score = score + (normalizedValue * (Convert.ToDouble(criteria.Weight)/100));
                        }
                        else
                        {
                            return NotFound();
                        }
                    }

                    var task = tasks.Where(a => a.Id == ratings.First().TaskId).First();
                    task.Score = score;
                    task.UpdatedBy = User.Identity.Name;
                    task.UpdatedDate = DateTime.Now;
                    _context.SaveChanges();
                }

                var pendingTaskList = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == project.Id && a.Status == "Pending").OrderByDescending(a => a.Prioritize.HasValue).ThenBy(a => a.Prioritize).ThenByDescending(a => a.Score).ToList();
                var tempTask = new List<Models.Task>();
                foreach (var item in pendingTaskList)
                {
                    if (tempTask.Where(a => a.Id == item.Id).FirstOrDefault() == null)
                    {
                        var depedencyList = GetAllTaskMasterId(item.Id);
                        //if (depedencyList.Count() > 0)
                        //{
                        //    var taskDepedencyList = pendingTaskList.Where(a => depedency.Contains(a.Id)).OrderByDescending(a => a.Score).ToList();

                        //    foreach (var taskDepedency in taskDepedencyList)
                        //    {
                        //        if (tempTask.Where(a => a.Id == item.Id).FirstOrDefault() == null)
                        //        {
                        //            tempTask.Add(taskDepedency);
                        //        }
                        //    }

                        //}

                        foreach(var depedency in depedencyList)
                        {
                            var depedencyTask = pendingTaskList.Where(a => a.Id == depedency).FirstOrDefault();
                            if (depedencyTask != null && tempTask.Where(a => a.Id == depedencyTask.Id).FirstOrDefault() == null)
                            {
                                tempTask.Add(depedencyTask);
                            }
                            
                        }
                        tempTask.Add(item);
                    }
                }

                for (var t = 0; t < tempTask.Count(); t++)
                {
                    var rank = t + 1;
                    if (t > 0)
                    {
                        if (Math.Round(tempTask[t - 1].Score,3) == Math.Round(tempTask[t].Score,3))
                        {
                            rank = tempTask[t - 1].Rank.Value;
                        }
                    }

                    tempTask[t].Rank = rank;
                    _context.Task.Update(tempTask[t]);

                }
                _context.SaveChanges();
               
                return RedirectToAction("Summary","Project",new { id });

            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet]
        [Route("Tasks")]
        public IActionResult GetTasks([FromQuery(Name = "search")]string search, [FromQuery(Name = "taskId")]Guid taskId)
        {
            List<TaskViewModel> data = new List<TaskViewModel>();

            var task = _context.Task.Find(taskId);

            if(task != null)
            {
                var projectId = task.ProjectId;

                var dependency = _context.Dependency.Where(a => a.DeletedDate == null && a.TaskId == task.Id);

                var tasks = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == projectId && a.Status == "Pending" && a.Id != task.Id && (a.Name.Contains(search)) && !(dependency.Select(m => m.MasterTaskId).Contains(a.Id))).ToList();

                foreach (var item in tasks)
                {
                    data.Add(new TaskViewModel
                    {
                        Id = item.Id,
                        Name = item.Name,
                        Description = String.IsNullOrWhiteSpace(item.Description) ? String.Empty : item.Description
                    });
                }
            }
            
            return Ok(data);
        }

        [HttpGet]
        [Route("TaskDepedency/{id}")]
        public IActionResult GetTaskDepedency(Guid id)
        {
            List<TaskViewModel> data = new List<TaskViewModel>();

            var task = _context.Task.Find(id);

            if (task != null)
            {
                var dependency = _context.Dependency.Where(a => a.DeletedDate == null && a.TaskId == task.Id);

                foreach (var item in dependency)
                {
                    var tasks = _context.Task.Find(item.MasterTaskId);
                    data.Add(new TaskViewModel
                    {
                        Id = item.Id,
                        Name = tasks.Name,
                        Description = tasks.Description
                    });
                }
            }

            return Ok(data);
        }

        [HttpPost]
        [Route("TaskDepedency")]
        public IActionResult AddTaskDepedency(TaskViewModel data)
        {
            List<Guid> guidList = GetAllTaskMasterId(data.MasterTaskId);

            if (!guidList.Contains(data.Id))
            {
                _context.Dependency.Add(new Models.Dependency
                {
                    TaskId = data.Id,
                    MasterTaskId = data.MasterTaskId,
                    CreatedDate = DateTime.Now,
                    CreatedBy = User.Identity.Name
                });

                if (_context.SaveChanges() > 0)
                {
                    return Ok();
                }
            }

            return NotFound();
        }

        [HttpDelete]
        [Route("TaskDepedency")]
        public IActionResult RemoveTaskDepedency(TaskViewModel data)
        {

            var depedency = _context.Dependency.Find(data.Id);
            depedency.DeletedDate = DateTime.Now;
            depedency.DeletedBy = User.Identity.Name;

            _context.Dependency.Update(depedency);

            if (_context.SaveChanges() > 0)
            {
                return Ok();
            }

            return NotFound();
        }

        [HttpPost]
        [Route("TaskPrioritize/{id}")]
        public IActionResult TaskPrioritize(Guid id)
        {
            
            var task = _context.Task.Find(id);
            
            if (task != null)
            {
                if(task.Prioritize == null)
                {
                    var lastPrioritizeNumber = _context.Task.Where(a => a.DeletedDate == null && a.ProjectId == task.ProjectId).Select(x => x.Prioritize).Max() ?? 0;

                    task.Prioritize = lastPrioritizeNumber + 1;
                }
                else
                {
                    task.Prioritize = null;
                    var taskList = _context.Task.Where(a => a.DeletedDate == null && a.Status == "Pending" && a.Id != task.Id && a.ProjectId == task.ProjectId && a.Prioritize.HasValue).OrderBy(a => a.Prioritize).ToList();
                    for (var i = 0; i < taskList.Count(); i++)
                    {
                        taskList[i].Prioritize = i + 1;
                        taskList[i].UpdatedDate = DateTime.Now;
                        taskList[i].UpdatedBy = User.Identity.Name;
                    }
                    _context.Task.UpdateRange(taskList);
                    
                }
                task.UpdatedBy = User.Identity.Name;
                task.UpdatedDate = DateTime.Now;
                _context.Task.Update(task);

                if(_context.SaveChanges() > 0)
                {
                    return Ok(task.Prioritize);
                }
            }

            return NotFound();
        }

        private List<Guid> GetAllTaskMasterId(Guid id)
        {
            List<Guid> guidList = new List<Guid>();

            List<Guid> checkTaskGuid = new List<Guid>();

            checkTaskGuid.Add(id);

            while (checkTaskGuid.Count() > 0)
            {
                var taskList = _context.Task.Where(a => checkTaskGuid.Contains(a.Id)).OrderByDescending(a => a.Score).ToList();
                checkTaskGuid = new List<Guid>();
                foreach (var task in taskList)
                {
                    var depedencyIdList = _context.Dependency.Where(a => a.DeletedDate == null && a.TaskId == task.Id).Select(a => a.MasterTaskId).ToList();

                    if(depedencyIdList.Any())
                    {
                        var depedencyOrderedByScore = _context.Task.Where(a => a.DeletedDate == null && depedencyIdList.Contains(a.Id)).OrderByDescending(a => a.Score).Select(a => a.Id);

                        bool childExist = guidList.Contains(task.Id);

                        foreach(var item in depedencyOrderedByScore)
                        {
                            if (!guidList.Contains(item))
                            {
                                if (childExist)
                                {
                                    guidList.Insert(guidList.FindIndex(x => x == task.Id), item);
                                }
                                else
                                {
                                    guidList.Add(item);
                                }
                            }
                        }
                        
                        checkTaskGuid.AddRange(depedencyOrderedByScore);
                    }
                }

                //var depedencyIdList = _context.Dependency.Where(a => a.DeletedDate == null && checkTaskGuid.Contains(a.TaskId)).Select(a => a.MasterTaskId).ToList();

                //if(depedencyIdList.Count() > 0)
                //{
                //    checkTaskGuid = depedencyIdList;
                //    guidList.AddRange(depedencyIdList);
                //}
                //else
                //{
                //    check = false;
                //}
            }

            return guidList;
        }
    }
}