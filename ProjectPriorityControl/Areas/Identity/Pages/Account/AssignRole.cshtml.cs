using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProjectPriorityControl.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Areas.Identity.Pages.Account
{
    public class AssignRoleModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AssignRoleModel(UserManager<ApplicationUser> userManager,RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        [BindProperty]
        public InputModel Input { get; set; }

        public SelectList Roles { get; set; }

        public class InputModel
        {
            public string Id { get; set; }
            public string Username { get; set; }
            public string Role { get; set; }
        }

        public async Task<IActionResult> OnGetAsync(string id)
        {
            if (String.IsNullOrWhiteSpace(id))
            {
                return BadRequest("An id must be supplied for assign role.");
            }

            var user = await _userManager.FindByIdAsync(id);

            if(user != null)
            {
                Input = new InputModel
                {
                    Id = user.Id,
                    Username = user.UserName
                };
                
                Roles = new SelectList(_roleManager.Roles.Where(m => m.Name != "Admin").ToList(), "Name", "Name", _userManager.GetRolesAsync(user).Result.FirstOrDefault());
                return Page();
            }

            return NotFound();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var user = await _userManager.FindByIdAsync(Input.Id);

            if (user != null)
            {
                var result = await _userManager.RemoveFromRoleAsync(user, _userManager.GetRolesAsync(user).Result.FirstOrDefault());

                if (result.Succeeded)
                {
                    result = await _userManager.AddToRoleAsync(user, Input.Role);
                    if (result.Succeeded)
                    {
                        return LocalRedirect("~/Identity/Account/Edit?id=" + user.Id);
                    }
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }

                Roles = new SelectList(_roleManager.Roles.Where(m => m.Name != "Admin").ToList(), "Name", "Name",Input.Role);
                return Page();
            }

            return NotFound();
        }
    }
}
