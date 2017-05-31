namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCommit : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AgentInfo",
                c => new
                    {
                        id = c.Int(nullable: false),
                        PropertyDetailId = c.Int(nullable: false),
                        FirstName = c.String(maxLength: 50),
                        LastName = c.String(maxLength: 50),
                        Phone = c.String(maxLength: 10, fixedLength: true),
                        IsActive = c.Boolean(),
                        Address1 = c.String(maxLength: 50),
                        Address2 = c.String(maxLength: 50),
                        City = c.String(maxLength: 10, fixedLength: true),
                        State = c.String(maxLength: 10, fixedLength: true),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.PropertyDetail", t => t.PropertyDetailId)
                .Index(t => t.PropertyDetailId);
            
            CreateTable(
                "dbo.PropertyDetail",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ContractType = c.String(maxLength: 50),
                        FromPrice = c.String(maxLength: 50),
                        Bedroom = c.Int(),
                        Bathroom = c.Int(),
                        Parking = c.Int(),
                        AmenitiesID = c.Int(),
                        Date = c.DateTime(),
                        PropertyName = c.String(maxLength: 50),
                        Address = c.String(maxLength: 50),
                        PropertyDescription = c.String(maxLength: 50),
                        FullName = c.String(maxLength: 50),
                        Email = c.String(maxLength: 50),
                        Phone = c.String(maxLength: 50),
                        Comments = c.String(maxLength: 50),
                        Images = c.String(maxLength: 50),
                        Approved = c.String(maxLength: 1, unicode: false),
                        Featured = c.String(maxLength: 1, unicode: false),
                        Area = c.String(maxLength: 50),
                        country = c.String(maxLength: 10, fixedLength: true),
                        State = c.String(maxLength: 50),
                        agent = c.Boolean(),
                        city = c.String(maxLength: 10, fixedLength: true),
                        DistrictId = c.String(maxLength: 10, fixedLength: true),
                        ToPrice = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Amenity", t => t.AmenitiesID)
                .Index(t => t.AmenitiesID);
            
            CreateTable(
                "dbo.Amenity",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        ServiceId = c.Int(nullable: false),
                        FeatureId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Feature", t => t.FeatureId)
                .ForeignKey("dbo.Service", t => t.ServiceId)
                .Index(t => t.ServiceId)
                .Index(t => t.FeatureId);
            
            CreateTable(
                "dbo.Feature",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Name = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Service",
                c => new
                    {
                        Id = c.Int(nullable: false),
                        Name = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PropertyImage",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PropertyTypeId = c.Int(nullable: false),
                        PropertyDetailId = c.Int(nullable: false),
                        PropertyImage = c.Binary(nullable: false),
                        Date = c.DateTime(nullable: false),
                        ImagePath = c.String(maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.PropertyType", t => t.PropertyTypeId)
                .ForeignKey("dbo.PropertyDetail", t => t.PropertyDetailId)
                .Index(t => t.PropertyTypeId)
                .Index(t => t.PropertyDetailId);
            
            CreateTable(
                "dbo.PropertyType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Area",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                        CityId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.City", t => t.CityId)
                .Index(t => t.CityId);
            
            CreateTable(
                "dbo.City",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50, unicode: false),
                        IsActive = c.Boolean(nullable: false),
                        StateId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.State", t => t.StateId)
                .Index(t => t.StateId);
            
            CreateTable(
                "dbo.State",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                        CountryId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Country", t => t.CountryId)
                .Index(t => t.CountryId);
            
            CreateTable(
                "dbo.Country",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Contact",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 100, unicode: false),
                        Email = c.String(nullable: false, maxLength: 50, unicode: false),
                        Phone = c.Long(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(maxLength: 10, fixedLength: true),
                        Message = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ContractType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Conmmertial = c.String(maxLength: 50),
                        Date = c.DateTime(),
                        Rent = c.String(maxLength: 50),
                        Sale = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.District",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                        CityId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.LoginPl",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Password = c.String(nullable: false, maxLength: 50),
                        Email = c.String(nullable: false, maxLength: 50),
                        Date = c.DateTime(nullable: false),
                        LoginId = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PropertyRequestArea",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PropertyRequest",
                c => new
                    {
                        PropertyRequestId = c.Int(nullable: false, identity: true),
                        FullName = c.String(maxLength: 50),
                        Email = c.String(maxLength: 50),
                        PhoneNumber = c.String(maxLength: 50),
                        FromPrice = c.Int(nullable: false),
                        ContactType = c.String(maxLength: 50),
                        PropertyRequestContractTypeId = c.Int(nullable: false),
                        PropertyDescription = c.String(maxLength: 50),
                        ToPrice = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        IsAgree = c.Boolean(nullable: false),
                        PropertyRequestTypeId = c.Int(nullable: false),
                        PropertyRequestAreaId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.PropertyRequestId)
                .ForeignKey("dbo.PropertyRequestContractType", t => t.PropertyRequestContractTypeId)
                .ForeignKey("dbo.PropertyRequestPrice", t => t.FromPrice)
                .ForeignKey("dbo.PropertyRequestPrice", t => t.ToPrice)
                .ForeignKey("dbo.PropertyRequestType", t => t.PropertyRequestTypeId)
                .ForeignKey("dbo.PropertyRequestArea", t => t.PropertyRequestAreaId)
                .Index(t => t.FromPrice)
                .Index(t => t.PropertyRequestContractTypeId)
                .Index(t => t.ToPrice)
                .Index(t => t.PropertyRequestTypeId)
                .Index(t => t.PropertyRequestAreaId);
            
            CreateTable(
                "dbo.PropertyRequestContractType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50, unicode: false),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PropertyRequestPrice",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Price = c.String(maxLength: 50, unicode: false),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PropertyRequestType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "dbo.UserRoles",
                c => new
                    {
                        UserId = c.Int(nullable: false),
                        RoleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.Roles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(),
                        LastName = c.String(),
                        Phone = c.String(),
                        DateOfBirth = c.DateTime(nullable: false),
                        Email = c.String(maxLength: 256),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.UserName, unique: true, name: "UserNameIndex");
            
            CreateTable(
                "dbo.UserClaims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.UserLogins",
                c => new
                    {
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                        UserId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.UserRoles", "UserId", "dbo.Users");
            DropForeignKey("dbo.UserLogins", "UserId", "dbo.Users");
            DropForeignKey("dbo.UserClaims", "UserId", "dbo.Users");
            DropForeignKey("dbo.UserRoles", "RoleId", "dbo.Roles");
            DropForeignKey("dbo.PropertyRequest", "PropertyRequestAreaId", "dbo.PropertyRequestArea");
            DropForeignKey("dbo.PropertyRequest", "PropertyRequestTypeId", "dbo.PropertyRequestType");
            DropForeignKey("dbo.PropertyRequest", "ToPrice", "dbo.PropertyRequestPrice");
            DropForeignKey("dbo.PropertyRequest", "FromPrice", "dbo.PropertyRequestPrice");
            DropForeignKey("dbo.PropertyRequest", "PropertyRequestContractTypeId", "dbo.PropertyRequestContractType");
            DropForeignKey("dbo.State", "CountryId", "dbo.Country");
            DropForeignKey("dbo.City", "StateId", "dbo.State");
            DropForeignKey("dbo.Area", "CityId", "dbo.City");
            DropForeignKey("dbo.PropertyImage", "PropertyDetailId", "dbo.PropertyDetail");
            DropForeignKey("dbo.PropertyImage", "PropertyTypeId", "dbo.PropertyType");
            DropForeignKey("dbo.Amenity", "ServiceId", "dbo.Service");
            DropForeignKey("dbo.PropertyDetail", "AmenitiesID", "dbo.Amenity");
            DropForeignKey("dbo.Amenity", "FeatureId", "dbo.Feature");
            DropForeignKey("dbo.AgentInfo", "PropertyDetailId", "dbo.PropertyDetail");
            DropIndex("dbo.UserLogins", new[] { "UserId" });
            DropIndex("dbo.UserClaims", new[] { "UserId" });
            DropIndex("dbo.Users", "UserNameIndex");
            DropIndex("dbo.UserRoles", new[] { "RoleId" });
            DropIndex("dbo.UserRoles", new[] { "UserId" });
            DropIndex("dbo.Roles", "RoleNameIndex");
            DropIndex("dbo.PropertyRequest", new[] { "PropertyRequestAreaId" });
            DropIndex("dbo.PropertyRequest", new[] { "PropertyRequestTypeId" });
            DropIndex("dbo.PropertyRequest", new[] { "ToPrice" });
            DropIndex("dbo.PropertyRequest", new[] { "PropertyRequestContractTypeId" });
            DropIndex("dbo.PropertyRequest", new[] { "FromPrice" });
            DropIndex("dbo.State", new[] { "CountryId" });
            DropIndex("dbo.City", new[] { "StateId" });
            DropIndex("dbo.Area", new[] { "CityId" });
            DropIndex("dbo.PropertyImage", new[] { "PropertyDetailId" });
            DropIndex("dbo.PropertyImage", new[] { "PropertyTypeId" });
            DropIndex("dbo.Amenity", new[] { "FeatureId" });
            DropIndex("dbo.Amenity", new[] { "ServiceId" });
            DropIndex("dbo.PropertyDetail", new[] { "AmenitiesID" });
            DropIndex("dbo.AgentInfo", new[] { "PropertyDetailId" });
            DropTable("dbo.UserLogins");
            DropTable("dbo.UserClaims");
            DropTable("dbo.Users");
            DropTable("dbo.UserRoles");
            DropTable("dbo.Roles");
            DropTable("dbo.PropertyRequestType");
            DropTable("dbo.PropertyRequestPrice");
            DropTable("dbo.PropertyRequestContractType");
            DropTable("dbo.PropertyRequest");
            DropTable("dbo.PropertyRequestArea");
            DropTable("dbo.LoginPl");
            DropTable("dbo.District");
            DropTable("dbo.ContractType");
            DropTable("dbo.Contact");
            DropTable("dbo.Country");
            DropTable("dbo.State");
            DropTable("dbo.City");
            DropTable("dbo.Area");
            DropTable("dbo.PropertyType");
            DropTable("dbo.PropertyImage");
            DropTable("dbo.Service");
            DropTable("dbo.Feature");
            DropTable("dbo.Amenity");
            DropTable("dbo.PropertyDetail");
            DropTable("dbo.AgentInfo");
        }
    }
}
