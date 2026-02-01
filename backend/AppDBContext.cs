using Microsoft.EntityFrameworkCore;
using SpecPrototype.Models;

namespace SpecPrototype;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Manufacturer> Manufacturers { get; set; }
    public DbSet<Product> Products { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Product>()
            .Property(p => p.Status)
            .HasColumnName("Status");

        modelBuilder.Entity<Product>()
            .Property(p => p.ExpiryDate)
            .HasColumnName("Expiry_Date");

        modelBuilder.Entity<Product>()
            .Property(p => p.ImageUrl)
            .HasColumnName("Image_URL");

        modelBuilder.Entity<Manufacturer>()
            .Property(p => p.WebsiteUrl)
            .HasColumnName("Website_URL");

    }
}