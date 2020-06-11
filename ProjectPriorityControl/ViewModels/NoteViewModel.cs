using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.ViewModels
{
    public class NoteViewModel
    {
        public Guid Id { get; set; }
        public String Content { get; set; }
        public string Type { get; set; }
    }
}
