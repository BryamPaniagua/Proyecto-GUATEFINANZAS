namespace GF.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    
    using GF.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<GF.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(GF.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
            if(!context.Users.Any(u => u.UserName == "admin@guatefinanzas.com"))
            {
                var UStore = new UserStore<ApplicationUser>();
                var UManager = new UserManager<ApplicationUser>(UStore);
                var AppUser = new ApplicationUser
                {
                    UserName = "admin@guatefinanzas.com"
                };

                UManager.Create(AppUser, "4dmin$");

                var URole = new RoleStore<IdentityRole>(context);
                var RManager = new RoleManager<IdentityRole>(URole);

                RManager.
            }
        }
    }
}
