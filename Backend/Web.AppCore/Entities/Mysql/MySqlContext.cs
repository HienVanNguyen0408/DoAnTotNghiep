using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.AppCore.Entities
{
    public class MySqlContext : DbContext
    {
        public DbSet<TypeQuestion> TypeQuestion { get; set; }
        public DbSet<LevelQuestion> LevelQuestion { get; set; }

        public DbSet<Grammar> Grammar { get; set; }
        public DbSet<TypeGrammar> TypeGrammar { get; set; }

        public DbSet<Vocabulary> Vocabulary { get; set; }
        public DbSet<Synonyms> Synonyms { get; set; }
        public DbSet<Example> Example { get; set; }

        public DbSet<UserInfo> User { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder
                .EnableSensitiveDataLogging()
                .UseMySQL("Host =localhost;Port = 3306;Database= englishtestdb;User Id = nvhien;Password= Hien0408;Convert Zero Datetime=true;");
        }
        public override int SaveChanges()
        {
            var AddedEntities = ChangeTracker.Entries().Where(E => E.State == EntityState.Added).ToList();
            AddedEntities.ForEach(E =>
            {
                E.Property("CreatedDate").CurrentValue = DateTime.Now;
                E.Property("ModifiedDate").CurrentValue = DateTime.Now;
            });

            var EditedEntities = ChangeTracker.Entries().Where(E => E.State == EntityState.Modified).ToList();
            EditedEntities.ForEach(E =>
            {
                E.Property("ModifiedDate").CurrentValue = DateTime.Now;
            });
            return base.SaveChanges();
        }
    }
}
