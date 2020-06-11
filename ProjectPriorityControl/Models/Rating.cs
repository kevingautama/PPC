using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Models
{
    public class Rating : Audit
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public Guid CriteriaId { get; set; }
        [Required]
        public Guid TaskId { get; set; }
        public string Notes { get; set; }
        public double Value { get; set; }
        public virtual Criteria Criteria { get; set; }
        public virtual Task Task { get; set; }
    }
}
