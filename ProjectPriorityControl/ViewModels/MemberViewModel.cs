using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class MemberViewModel
    {
        public Guid Id { get; set; }
        public string UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime JoinedOn { get; set; }
    }
}
