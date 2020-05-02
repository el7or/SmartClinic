using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using clinic_api.Data;
using clinic_api.Models;
using clinic_api.DTOs;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SocialStatusController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public SocialStatusController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/SocialStatus
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SocialStatusDTO>>> GetSocialStatus()
        {
            var socialStatus = _context.SysSocialStatusValues.Select(s => new SocialStatusDTO
            {
                Id = s.Id,
                TextEN = s.Value,
                TextAR = s.Text
            });
            return await socialStatus.ToListAsync();
        }

        // GET: api/SocialStatus/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SysSocialStatusValue>> GetSocialStatus(int id)
        {
            var sysSocialStatusValue = await _context.SysSocialStatusValues.FindAsync(id);

            if (sysSocialStatusValue == null)
            {
                return NotFound();
            }

            return sysSocialStatusValue;
        }

        // PUT: api/SocialStatus/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSocialStatus(int id, SysSocialStatusValue sysSocialStatusValue)
        {
            if (id != sysSocialStatusValue.Id)
            {
                return BadRequest();
            }

            _context.Entry(sysSocialStatusValue).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SocialStatusExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/SocialStatus
        [HttpPost]
        public async Task<ActionResult<SysSocialStatusValue>> PostSocialStatus(SysSocialStatusValue sysSocialStatusValue)
        {
            _context.SysSocialStatusValues.Add(sysSocialStatusValue);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSysSocialStatusValue", new { id = sysSocialStatusValue.Id }, sysSocialStatusValue);
        }

        // DELETE: api/SocialStatus/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<SysSocialStatusValue>> DeleteSocialStatus(int id)
        {
            var sysSocialStatusValue = await _context.SysSocialStatusValues.FindAsync(id);
            if (sysSocialStatusValue == null)
            {
                return NotFound();
            }

            _context.SysSocialStatusValues.Remove(sysSocialStatusValue);
            await _context.SaveChangesAsync();

            return sysSocialStatusValue;
        }

        private bool SocialStatusExists(int id)
        {
            return _context.SysSocialStatusValues.Any(e => e.Id == id);
        }
    }
}
