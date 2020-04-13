using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using clinic_api.Data;
using clinic_api.Models;
using Microsoft.AspNetCore.Authorization;

namespace clinic_api.Controllers
{
    [AllowAnonymous]
    [Route("api/[controller]")]
    [ApiController]
    public class GovernoratesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public GovernoratesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Governorates
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SysGovernoratesValue>>> GetSysGovernoratesValues()
        {
            return await _context.SysGovernoratesValues.ToListAsync();
        }

        // GET: api/Governorates/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SysGovernoratesValue>> GetSysGovernoratesValue(int id)
        {
            var sysGovernoratesValue = await _context.SysGovernoratesValues.FindAsync(id);

            if (sysGovernoratesValue == null)
            {
                return NotFound();
            }

            return sysGovernoratesValue;
        }

        // PUT: api/Governorates/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSysGovernoratesValue(int id, SysGovernoratesValue sysGovernoratesValue)
        {
            if (id != sysGovernoratesValue.Id)
            {
                return BadRequest();
            }

            _context.Entry(sysGovernoratesValue).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SysGovernoratesValueExists(id))
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

        // POST: api/Governorates
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<SysGovernoratesValue>> PostSysGovernoratesValue(SysGovernoratesValue sysGovernoratesValue)
        {
            _context.SysGovernoratesValues.Add(sysGovernoratesValue);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSysGovernoratesValue", new { id = sysGovernoratesValue.Id }, sysGovernoratesValue);
        }

        // DELETE: api/Governorates/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<SysGovernoratesValue>> DeleteSysGovernoratesValue(int id)
        {
            var sysGovernoratesValue = await _context.SysGovernoratesValues.FindAsync(id);
            if (sysGovernoratesValue == null)
            {
                return NotFound();
            }

            _context.SysGovernoratesValues.Remove(sysGovernoratesValue);
            await _context.SaveChangesAsync();

            return sysGovernoratesValue;
        }

        private bool SysGovernoratesValueExists(int id)
        {
            return _context.SysGovernoratesValues.Any(e => e.Id == id);
        }
    }
}
