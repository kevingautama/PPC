using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProjectPriorityControl.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Areas.Identity.Pages.Account
{
    //[Authorize]
    public class IndexModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public IndexModel(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        public List<UserModel> Users { get; set; }

        public class UserModel
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string Gender { get; set; }
            public bool IsActive { get; set; }
            public string Role { get; set; }
        }

        public async Task<IActionResult> OnGetAsync(string returnUrl = null)
        {
            var user = await _userManager.Users.ToListAsync();
            Users = new List<UserModel>();
            foreach (var item in user)
            {
                Users.Add(new UserModel
                {
                    Id = item.Id,
                    Name = item.Name,
                    Gender = item.Gender,
                    Role = _userManager.GetRolesAsync(item).Result.First(),
                    IsActive = item.IsActive
                });
            }
            return Page();
        }

        
    }
}
