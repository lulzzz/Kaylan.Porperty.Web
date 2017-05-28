using Kalyan.Property.Infrastructure.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Kalyan.Property.Infrastructure
{
    public class CustomeDbContext : IdentityDbContext<Users, Roles, int, UserLogin, UserRole, UserClaim>
    {
        public CustomeDbContext()
             : base("DefaultConnection")
        {
        }

        public virtual DbSet<AgentInfo> AgentInfoes { get; set; }
        public virtual DbSet<Amenity> Amenities { get; set; }
        public virtual DbSet<Area> Areas { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContractType> ContractTypes { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<District> Districts { get; set; }
        public virtual DbSet<Feature> Features { get; set; }
        public virtual DbSet<LoginPl> LoginPls { get; set; }
        public virtual DbSet<PropertyDetail> PropertyDetails { get; set; }
        public virtual DbSet<PropertyImage> PropertyImages { get; set; }
        public virtual DbSet<PropertyRequest> PropertyRequests { get; set; }
        public virtual DbSet<PropertyType> PropertyTypes { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<PropertyRequestContractType> PropertyRequestContractType { get; set; }
        public virtual DbSet<PropertyRequestPrice> PropertyRequestPrice { get; set; }
        public virtual DbSet<PropertyRequestType> PropertyRequestType { get; set; }
        public virtual DbSet<PropertyRequestArea> PropertyRequestArea { get; set; }

        public CustomeDbContext(string nameOrConnectionString) : base("DefaultConnection")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            modelBuilder.Entity<Users>().ToTable("Users");
            modelBuilder.Entity<Roles>().ToTable("Roles");
            modelBuilder.Entity<UserRole>().ToTable("UserRoles");
            modelBuilder.Entity<UserLogin>().ToTable("UserLogins");
            modelBuilder.Entity<UserClaim>().ToTable("UserClaims");

            modelBuilder.Entity<AgentInfo>()
               .Property(e => e.Phone)
               .IsFixedLength();

            modelBuilder.Entity<AgentInfo>()
                .Property(e => e.City)
                .IsFixedLength();

            modelBuilder.Entity<AgentInfo>()
                .Property(e => e.State)
                .IsFixedLength();

            modelBuilder.Entity<Amenity>()
                .HasMany(e => e.PropertyDetails)
                .WithOptional(e => e.Amenity)
                .HasForeignKey(e => e.AmenitiesID);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.CreatedBy)
                .IsFixedLength();

            modelBuilder.Entity<Country>()
                .HasMany(e => e.States)
                .WithRequired(e => e.Country)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Feature>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.Feature)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.Approved)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.Featured)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.country)
                .IsFixedLength();

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.city)
                .IsFixedLength();

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.DistrictId)
                .IsFixedLength();

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.AgentInfoes)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.PropertyImages)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyType>()
                .HasMany(e => e.PropertyImages)
                .WithRequired(e => e.PropertyType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Service>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.Service)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<State>()
                .HasMany(e => e.Cities)
                .WithRequired(e => e.State)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyRequestPrice>()
               .Property(e => e.Price)
               .IsUnicode(false);

            modelBuilder.Entity<PropertyRequestPrice>()
                .HasMany(e => e.PropertyRequests)
                .WithRequired(e => e.PropertyRequestPriceMax)
                .HasForeignKey(e => e.FromPrice)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyRequestPrice>()
                .HasMany(e => e.PropertyRequests1)
                .WithRequired(e => e.PropertyRequestPriceMin)
                .HasForeignKey(e => e.ToPrice)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyRequestContractType>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyRequestContractType>()
                .HasMany(e => e.PropertyRequests)
                .WithRequired(e => e.PropertyRequestContractType)
                .HasForeignKey(x => x.PropertyRequestContractTypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyRequestType>()
                .HasMany(e => e.PropertyRequests)
                .WithRequired(e => e.PropertyRequestType)
                .HasForeignKey(x => x.PropertyRequestTypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyRequestArea>()
               .HasMany(e => e.PropertyRequests)
               .WithRequired(e => e.PropertyRequestArea)
               .HasForeignKey(x => x.PropertyRequestAreaId)
               .WillCascadeOnDelete(false);
        }

        public static CustomeDbContext Create()
        {
            return new CustomeDbContext();
        }
    }
}