using Microsoft.EntityFrameworkCore;
using SpendwiseApp.Models;

namespace SpendwiseApp.DAL
{
    public class AppDbContext : DbContext
    {
      public AppDbContext(DbContextOptions options) : base(options) { }
        
      public DbSet<billTable> BillTable { get; set; }

      public DbSet<mainList> MainList { get; set; }

      public DbSet<itemsList> ItemsList { get; set; }

    }
}
