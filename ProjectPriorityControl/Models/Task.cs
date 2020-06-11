using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Models
{
    public class Task : Audit
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string AssignUserId { get; set; }
        public int? Rank { get; set; }
        public double Score { get; set; }
        public int? Prioritize { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? FinishDate { get; set; }
        [Required]
        public Guid ProjectId { get; set; }
        public virtual Project Project { get; set; }
        public ICollection<Rating> Rating { get; set; }
        public ICollection<Note> Note { get; set; }
    }
}
