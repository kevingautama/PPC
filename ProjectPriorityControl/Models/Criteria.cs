using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Models
{
    public class Criteria : Audit
    {
        [Key]
        public Guid Id { get; set; }
        public Guid? ProjectId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string Weight { get; set; }
        public bool IsDefault { get; set; }
        public ICollection<Rating> Rating { get; set; }
        public virtual Project Project { get; set; }
    }
}
