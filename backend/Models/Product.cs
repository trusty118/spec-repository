namespace SpecPrototype.Models;

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public int? ManufacturerId { get; set; }
    public Manufacturer? Manufacturer { get; set; } 
    public string? Status { get; set; }
    public DateTime? ExpiryDate { get; set; }  
    public string? Limitations { get; set; }
    public string? ImageUrl { get; set; }   
}

