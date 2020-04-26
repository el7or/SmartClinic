using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace clinic_api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _config;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration config)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
        }

        [AllowAnonymous]
        [HttpPost("Login")]
        public async Task<IActionResult> Login(AccountLoginDTO userDTO)
        {
            var user = await _userManager.FindByNameAsync(userDTO.UserName);
            if (user == null) return Unauthorized();
            var result = await _signInManager.CheckPasswordSignInAsync(user, userDTO.Password, lockoutOnFailure: false);
            //var result = await _signInManager.PasswordSignInAsync(userDTO.UserName, userDTO.Password, isPersistent: false, lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var loginUser = await _userManager.Users.Include(c => c.ClinicUsers).FirstOrDefaultAsync(u => u.NormalizedUserName == userDTO.UserName.ToUpper());
                return Ok(new
                {
                    token = GenerateJWToken(loginUser).Result
                });
            }
            else return Unauthorized();
        }

        private async Task<string> GenerateJWToken(ApplicationUser user)
        {
            var claims = new List<Claim>
                    {
                        new Claim(JwtRegisteredClaimNames.Sub, user.FullName),
                        new Claim(JwtRegisteredClaimNames.Jti, user.Id.ToString()),
                    };

            var roles = await _userManager.GetRolesAsync(user);
            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var clinic = user.ClinicUsers.FirstOrDefault();
            if (clinic != null)
            {
                claims.Add(new Claim(ClaimTypes.Sid, clinic.ClinicId.ToString()));
            }

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Tokens:Issuer"],
            _config["Tokens:Issuer"],
            claims,
            expires: DateTime.Now.AddDays(1),
            signingCredentials: creds);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [HttpPost("Register")]
        public async Task<IActionResult> Register(string id, AccountRegisterDTO model)
        {
            if (id != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var user = new ApplicationUser
            {
                UserName = model.UserName,
                Email = model.UserName,
                FullName = model.FullName,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = Guid.Parse(id),
                CreatedOn = DateTime.Now,
                EditedBy = Guid.Parse(id),
                EditedOn = DateTime.Now
            };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                var roleResult = await _userManager.AddToRoleAsync(user, model.RoleName);
                if (roleResult.Succeeded)
                {
                    return Ok(user.Id);
                }
                else return BadRequest(result.Errors);
            }
            else return BadRequest(result.Errors);
        }

        [HttpPost("ResetPassword")]
        public async Task<IActionResult> ResetPassword(string id, AccountResetPasswordDTO model)
        {
            if (id != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var user = await _userManager.Users.FirstOrDefaultAsync(u => u.Id == model.Id);
            var remove = await _userManager.RemovePasswordAsync(user);
            var result = await _userManager.AddPasswordAsync(user, model.Password);
            if (result.Succeeded)
            {
                    return Ok();
            }
            else return BadRequest(result.Errors);
        }
    }
}