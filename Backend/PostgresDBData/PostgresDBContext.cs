using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Web.Models.Entities;
using Microsoft.Extensions.Options;
using System.Threading;

namespace PostgresDBData
{
    public class PostgreSqlContext : DbContext
    {
        private readonly PostgresSettings _postgresSettings;
        public PostgreSqlContext(DbContextOptions<PostgreSqlContext> options) : base(options)
        {
        }

        public DbSet<User> users { get; set; }
        public DbSet<Product> products { get; set; }
        public DbSet<ProductCategory> productCategories { get; set; }
        public DbSet<Size> sizes { get; set; }
        public DbSet<Color> colors { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }

        public override int SaveChanges()
        {
            ChangeTracker.DetectChanges();
            return base.SaveChanges();
        }

        public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess = true, CancellationToken cancellationToken = default(CancellationToken))
        {
            var entries = ChangeTracker.Entries().Where(E => E.State == EntityState.Added || E.State == EntityState.Modified).ToList();

            foreach (var entityEntry in entries)
            {
                entityEntry.Property("id").CurrentValue = $"{Guid.NewGuid()}";
                if (entityEntry.State == EntityState.Modified)
                {
                    entityEntry.Property("modified_date").CurrentValue = DateTime.UtcNow;
                }
                else if (entityEntry.State == EntityState.Added)
                {
                    entityEntry.Property("created_date").CurrentValue = DateTime.Now;
                    entityEntry.Property("modified_date").CurrentValue = DateTime.Now;
                }
            }

            return base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken);
        }
    }
}
