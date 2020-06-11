using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ProjectPriorityControl.Data;
using ProjectPriorityControl.ViewModels;

namespace ProjectPriorityControl.Controllers
{
    public class ReportController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ReportController(ApplicationDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            var data = _context.Task.ToList();

            List<Report> list = new List<Report>();
            foreach(var item in data)
            {
                list.Add(new Report
                {
                    Name = item.Name,
                    Status = item.Status
                });
            }
            return View(list);
        }
    }
}