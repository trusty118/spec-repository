using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpecPrototype.Models;
using SpecPrototype;

namespace SpecPrototype.Controllers;

[ApiController]
[Route("api")]
public class SearchController : ControllerBase
{
    private readonly AppDbContext _db;

    // Constructor injection - .NET automatically passes in the DbContext we registered in Program.cs
    public SearchController(AppDbContext db)
    {
        _db = db;
    }

    // GET /api/products?query=pipe
    [HttpGet("products")]
    public async Task<IActionResult> SearchProducts([FromQuery] string? query = null)
    {
        IQueryable<Product> products = _db.Products
            .Include(p => p.Manufacturer);

        if (!string.IsNullOrWhiteSpace(query))
        {
            query = query.ToLower();
            products = products.Where(p =>
                p.Name.ToLower().Contains(query) ||
                p.Limitations != null && p.Limitations.ToLower().Contains(query) ||
                p.Manufacturer != null && p.Manufacturer.Name.ToLower().Contains(query)
            );
        }

        var results = await products.ToListAsync();
        return Ok(results);
    }

    // GET /api/manufacturers
    [HttpGet("manufacturers")]
    public async Task<IActionResult> GetManufacturers()
    {
        var manufacturers = await _db.Manufacturers.ToListAsync();
        return Ok(manufacturers);
    }
}