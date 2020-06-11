using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class TaskViewModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string AssignedTo { get; set; }
        public int? Rank { get; set; }
        public double? Score { get; set; }
        public string Status { get; set; }
        public string Reporter { get; set; }
        public string IsPrioritize { get; set; }
        public DateTime? LastUpdated { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? FinishDate { get; set; }
        public List<NoteViewModel> Notes { get; set; }
        public List<RatingViewModel> Ratings { get; set; }
        public Guid MasterTaskId { get; set; }
    }
}
