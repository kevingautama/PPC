using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Models
{
    public class Note:Audit
    {
        [Key]
        public Guid Id { get; set; }
        public string Type { get; set; }
        public string Content { get; set; }
        public Guid TaskId { get; set; }
        public virtual Task Task { get; set; }
    }
}
