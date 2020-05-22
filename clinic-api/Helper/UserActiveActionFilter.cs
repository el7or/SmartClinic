using clinic_api.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Helper
{
    public class UserActiveActionFilter : IAsyncActionFilter
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;
        public UserActiveActionFilter(UserManager<ApplicationUser> userManager, ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var resultContext = await next();
            if (resultContext.HttpContext.User.Identity.IsAuthenticated)
            {
                string userId = resultContext.HttpContext.User.FindFirst(JwtRegisteredClaimNames.Jti).Value;
                var user = await _userManager.FindByIdAsync(userId);
                user.LastActive = DateTime.Now;
                await _userManager.UpdateAsync(user);
            }
        }
    }
}
