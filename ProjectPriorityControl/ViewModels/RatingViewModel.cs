using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class RatingViewModel
    {
        public Guid Id { get; set; }
        public Guid CriteriaId { get; set; }
        public string CriteriaName { get; set; }
        public string CriteriaDescription { get; set; }
        public string TaskName { get; set; }
        public string TaskDescription { get; set; }
        public double Value { get; set; }
        public string Changes { get; set; }
    }
}
