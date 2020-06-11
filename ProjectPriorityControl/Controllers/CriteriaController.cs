using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjectPriorityControl.Data;
using ProjectPriorityControl.Models;
using ProjectPriorityControl.ViewModels;

namespace ProjectPriorityControl.Controllers
{
    [Authorize]
    public class CriteriaController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CriteriaController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Criteria
        public async Task<IActionResult> Index()
        {
            List<Criteria> criterias = new List<Criteria>();

            if (!String.IsNullOrWhiteSpace(HttpContext.Session.GetString("ProjectId")))
            {
                criterias = await _context.Criteria.Where(m => m.DeletedBy == null && m.DeletedDate == null && m.IsDefault == false && m.ProjectId == new Guid(HttpContext.Session.GetString("ProjectId"))).ToListAsync();
            }
            else
            {
                criterias = await _context.Criteria.Where(m => m.DeletedBy == null && m.DeletedDate == null && m.ProjectId == null && m.IsDefault == true).ToListAsync();
            }

            List<CriteriaViewModel> model = new List<CriteriaViewModel>();

            foreach(var item in criterias)
            {
                model.Add(new CriteriaViewModel
                {
                    Id = item.Id,
                    Name = item.Name,
                    Type = item.Type,
                    Weight = item.Weight,
                    Description = item.Description,
                    ChangeType = "Edit"
                });
            }

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Index(List<CriteriaViewModel> model)
        {
            List<Criteria> criterias = new List<Criteria>();
            string projectId = HttpContext.Session.GetString("ProjectId");
            bool isDefault = false;
            if (!String.IsNullOrWhiteSpace(projectId))
            {
                isDefault = false;
                criterias = await _context.Criteria.Where(m => m.DeletedBy == null && m.DeletedDate == null && m.IsDefault == false && m.ProjectId == new Guid(projectId)).ToListAsync();
            }
            else
            {
                isDefault = true;
                criterias = await _context.Criteria.Where(m => m.DeletedBy == null && m.DeletedDate == null && m.ProjectId == null && m.IsDefault == true).ToListAsync();
            }

            var deletedCriterias = (from a in criterias
                                    where !(from b in model select b.Id).Contains(a.Id)
                                    select a).ToList();

            foreach(var item in deletedCriterias)
            {
                item.DeletedDate = DateTime.Now;
                item.DeletedBy = User.Identity.Name;
                _context.Update(item);
            }

            if(model != null)
            {
                foreach(var item in model)
                {
                    if(item.ChangeType == "Add")
                    {
                        Criteria criteria = new Criteria();
                        criteria.Name = item.Name;
                        criteria.Description = item.Description;
                        criteria.Type = item.Type;
                        criteria.Weight = item.Weight;

                        //criteria.CreatedBy = User.Identity.Name,
                        criteria.CreatedDate = DateTime.Now;
                        criteria.IsDefault = isDefault;
                        if (!String.IsNullOrWhiteSpace(projectId))
                        {
                            criteria.ProjectId = new Guid(projectId);
                        }
                        await _context.Criteria.AddAsync(criteria);
                    }
                    else if(item.ChangeType == "Edit")
                    {
                        Criteria criteria = criterias.First(m => m.Id == item.Id);
                        if(criteria != null)
                        {
                            criteria.Name = item.Name;
                            criteria.Description = item.Description;
                            criteria.Type = item.Type;
                            criteria.Weight = item.Weight;
                            //criteria.UpdatedBy = User.Identity.Name;
                            criteria.UpdatedDate = DateTime.Now;
                            _context.Update(criteria);
                        }
                    }
                }

                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        // GET: Criteria/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var criteria = await _context.Criteria
                .Include(c => c.Project)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (criteria == null)
            {
                return NotFound();
            }

            return View(criteria);
        }

        // GET: Criteria/Create
        public IActionResult Create()
        {
            ViewData["ProjectId"] = new SelectList(_context.Project, "Id", "ManagerId");
            return View();
        }

        // POST: Criteria/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,ProjectId,Name,Description,Type,Weight,IsDefault,CreatedDate,CreatedBy,DeletedDate,DeletedBy,UpdatedDate,UpdatedBy")] Criteria criteria)
        {
            if (ModelState.IsValid)
            {
                criteria.Id = Guid.NewGuid();
                _context.Add(criteria);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProjectId"] = new SelectList(_context.Project, "Id", "ManagerId", criteria.ProjectId);
            return View(criteria);
        }

        // GET: Criteria/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var criteria = await _context.Criteria.FindAsync(id);
            if (criteria == null)
            {
                return NotFound();
            }
            ViewData["ProjectId"] = new SelectList(_context.Project, "Id", "ManagerId", criteria.ProjectId);
            return View(criteria);
        }

        // POST: Criteria/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,ProjectId,Name,Description,Type,Weight,IsDefault,CreatedDate,CreatedBy,DeletedDate,DeletedBy,UpdatedDate,UpdatedBy")] Criteria criteria)
        {
            if (id != criteria.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(criteria);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CriteriaExists(criteria.Id))
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
            ViewData["ProjectId"] = new SelectList(_context.Project, "Id", "ManagerId", criteria.ProjectId);
            return View(criteria);
        }

        // GET: Criteria/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var criteria = await _context.Criteria
                .Include(c => c.Project)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (criteria == null)
            {
                return NotFound();
            }

            return View(criteria);
        }

        // POST: Criteria/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var criteria = await _context.Criteria.FindAsync(id);
            _context.Criteria.Remove(criteria);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CriteriaExists(Guid id)
        {
            return _context.Criteria.Any(e => e.Id == id);
        }
    }
}
