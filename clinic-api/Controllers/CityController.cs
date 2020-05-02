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
    public class CityController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CityController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/City
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CityDTO>>> GetCity()
        {
            var cities = _context.SysGovernoratesValues.OrderBy(a => a.TextAR).Select(g => new CityDTO
            {
                Id = g.Id,
                TextAR = g.TextAR,
                TextEN = g.TextEN,
                Cities = g.SysCitiesValues.OrderBy(a => a.TextAR).Select(c => new City
                {
                    Id = c.Id,
                    TextAR = c.TextAR,
                    TextEN = c.TextEN
                }).ToList()
            });
            return await cities.ToListAsync();
        }

        // GET: api/City/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SysGovernoratesValue>> GetCity(int id)
        {
            var sysGovernoratesValue = await _context.SysGovernoratesValues.FindAsync(id);

            if (sysGovernoratesValue == null)
            {
                return NotFound();
            }

            return sysGovernoratesValue;
        }

        // PUT: api/City/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCity(int id, SysGovernoratesValue sysGovernoratesValue)
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
                if (!CityExists(id))
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

        // POST: api/City
        [HttpPost]
        public async Task<ActionResult<SysGovernoratesValue>> PostCity(SysGovernoratesValue sysGovernoratesValue)
        {
            _context.SysGovernoratesValues.Add(sysGovernoratesValue);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSysGovernoratesValue", new { id = sysGovernoratesValue.Id }, sysGovernoratesValue);
        }

        // DELETE: api/City/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<SysGovernoratesValue>> DeleteCity(int id)
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

        private bool CityExists(int id)
        {
            return _context.SysGovernoratesValues.Any(e => e.Id == id);
        }
    }
}
