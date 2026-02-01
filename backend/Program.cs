using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using SpecPrototype;

var builder = WebApplication.CreateBuilder();

// Register the database connection
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Enable CORS so the Next.js frontend can talk to this API
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
        policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

builder.Services.AddOpenApi();
builder.Services.AddControllers();

var app = builder.Build();

app.UseCors("AllowAll");
app.MapOpenApi();
app.MapControllers();

// Health check - useful to confirm the API is running
app.MapGet("/api/health", () => "OK");

app.Run();