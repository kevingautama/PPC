using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ProjectPriorityControl.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectPriorityControl.Areas.Identity.Pages.Account
{
    public class EditModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public EditModel(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        [BindProperty]
        public InputModel Input { get; set; }

        public class InputModel
        {
            [Required]
            [HiddenInput]
            public string Id { get; set; }

            [Required]
            [Display(Name = "Username")]
            [HiddenInput]
            public string Username { get; set; }

            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }

            [Required]
            [HiddenInput]
            public string Role { get; set; }

            [Required]
            public string Name { get; set; }

            [Required]
            public string Gender { get; set; }

            public string Address { get; set; }

            public bool IsActive { get; set; }

            public String Status { get; set; }
        }

        public async Task<IActionResult> OnGet(string id = null)
        {
            if (String.IsNullOrWhiteSpace(id))
            {
                return NotFound();
            }

            var user = await _userManager.FindByIdAsync(id);

            if (user != null)
            {
                Input = new InputModel
                {
                    Id = user.Id,
                    Username = user.UserName,
                    Name = user.Name,
                    Email = user.Email,
                    Role = _userManager.GetRolesAsync(user).Result.First(),
                    Gender = user.Gender,
                    Address = user.Address,
                    IsActive = user.IsActive
                };

                return Page();
            }
            else
            {
                return NotFound();
            }
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (String.IsNullOrWhiteSpace(Input.Id))
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return Page();
            }

            var user = await _userManager.FindByIdAsync(Input.Id);
            if (user == null)
            {
                return NotFound();
            }

            user.Name = Input.Name;
            user.Gender = Input.Gender;
            user.Address = Input.Address;
            user.Email = Input.Email;
            user.IsActive = Input.IsActive;
            
            var result = await _userManager.UpdateAsync(user);
            Input.Status = user.IsActive == true ? "Active" : "Not Active";
            if (result.Succeeded)
            {
                return Page();
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
            return Page();
        }

        public async Task<IActionResult> OnPostDeleteAsync(string id)
        {
            if (String.IsNullOrWhiteSpace(id))
            {
                return NotFound();
            }

            var user = await _userManager.FindByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            user.IsActive = !user.IsActive;

            var result = await _userManager.DeleteAsync(user);
            if (result.Succeeded)
            {
                return LocalRedirect("~/Identity/Account/");
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
            return Page();
        }
    }
}
