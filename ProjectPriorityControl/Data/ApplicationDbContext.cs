using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ProjectPriorityControl.Models;

namespace ProjectPriorityControl.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Project> Project { get; set; }
        public DbSet<Criteria> Criteria { get; set; }
        public DbSet<Rating> Rating { get; set; }
        public DbSet<Task> Task { get; set; }
        public DbSet<Member> Member { get; set; }
        public DbSet<Note> Note { get; set; }
        public DbSet<Dependency> Dependency { get;set; }
    }
}
