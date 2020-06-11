using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class DashboardViewModel
    {
        public string PendingTasks { get; set; }
        public string CompletedTasks { get; set; }
        public string Projects { get; set; }
        public string Users { get; set; }
        public string InProgressTasks { get; set; }
        public List<ProjectViewModel> ProjectList { get; set; }
        public List<TaskViewModel> TaskList { get; set; }
    }
}
