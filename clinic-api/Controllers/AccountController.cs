﻿using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using clinic_api.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration config, ApplicationDbContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
            _context = context;
        }

        // POST: api/Account/Login
        [AllowAnonymous]
        [HttpPost("Login")]
        public async Task<IActionResult> Login(AccountLoginDTO userDTO)
        {
            var user = await _userManager.FindByNameAsync(userDTO.UserName);
            if (user == null || user.IsActive == false || user.IsDeleted == true) return Unauthorized();
            var result = await _signInManager.CheckPasswordSignInAsync(user, userDTO.Password, lockoutOnFailure: false);
            //var result = await _signInManager.PasswordSignInAsync(userDTO.UserName, userDTO.Password, isPersistent: false, lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var loginUser = await _userManager.Users.Where(u => u.NormalizedUserName == userDTO.UserName.ToUpper())
                    .Include(c => c.ClinicUsers).Include("ClinicUsers.Clinic").Include("ClinicUsers.Clinic.DoctorClinics")
                    .Include(p => p.Pharmacies)
                    .FirstOrDefaultAsync();
                // check if subscription valid
                var userSubscription = _context.Subscriptions.Where(s => s.SubscriberId == loginUser.Id).OrderByDescending(c => c.CreatedOn).FirstOrDefault();
                if (userSubscription != null && userSubscription.EndDate < DateTime.Now)
                {
                    return Unauthorized();
                }
                else
                {
                    return Ok(new
                    {
                        token = GenerateJWToken(loginUser).Result,
                        nickName = loginUser.FullName
                    });
                }
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
                claims.Add(new Claim(JwtRegisteredClaimNames.Prn, role));
            }

            // if user is doctor or employee
            var clinicUser = user.ClinicUsers.FirstOrDefault();
            if (clinicUser != null)
            {
                var clinic = clinicUser.Clinic;
                claims.Add(new Claim(JwtRegisteredClaimNames.Sid, clinic.Id.ToString()));
                claims.Add(new Claim(JwtRegisteredClaimNames.Nbf, clinic.DoctorClinics.FirstOrDefault().DoctorId.ToString()));
            }

            // if user is pharmacy
            var pharmacyUser = user.Pharmacies.FirstOrDefault();
            if (pharmacyUser != null)
            {
                claims.Add(new Claim(JwtRegisteredClaimNames.Acr, pharmacyUser.Id.ToString()));
            }

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Tokens:Issuer"],
            _config["Tokens:Issuer"],
            claims,
            expires: DateTime.Now.ToEgyptTime().AddDays(1),
            signingCredentials: creds);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        // POST: api/Account/Register
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
                CreatedOn = DateTime.Now.ToEgyptTime(),
                EditedBy = Guid.Parse(id),
                EditedOn = DateTime.Now.ToEgyptTime()
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