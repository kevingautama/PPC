using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class SummaryViewModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string StartDate { get; set; }
        public MemberViewModel Manager { get; set; }
        public string Status { get; set; }
        public string TaskProgress { get; set; }
        public string Tags { get; set; }
        public Tuple<string,string> IssueTasks { get; set; }
        public Tuple<string, string> BugTasks { get; set; }
        public Tuple<string, string> FeatureTasks { get; set; }
        public Tuple<string, string> AssignTasks { get; set; }
        public List<MemberViewModel> Members { get; set; }
        public List<TaskViewModel> Tasks { get; set; }
    }
}
