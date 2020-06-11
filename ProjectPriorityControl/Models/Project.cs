using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Models
{
    public class Project : Audit
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Code { get; set; }
        public DateTime? StartDate { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        public string Tags { get; set; }
        [Required]
        public string ManagerId { get; set; }
        public ICollection<Task> Task { get; set; }
        public ICollection<Criteria> Criteria { get; set; }
        public ICollection<Member> Member { get; set; }
    }
}
