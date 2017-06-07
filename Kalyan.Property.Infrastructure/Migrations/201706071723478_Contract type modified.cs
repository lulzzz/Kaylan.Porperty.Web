namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Contracttypemodified : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ContractType", "Name", c => c.String(maxLength: 50));
            AddColumn("dbo.ContractType", "IsActive", c => c.Boolean(nullable: false));
            DropColumn("dbo.ContractType", "Conmmertial");
            DropColumn("dbo.ContractType", "Date");
            DropColumn("dbo.ContractType", "Rent");
            DropColumn("dbo.ContractType", "Sale");
        }
        
        public override void Down()
        {
            AddColumn("dbo.ContractType", "Sale", c => c.String(maxLength: 50));
            AddColumn("dbo.ContractType", "Rent", c => c.String(maxLength: 50));
            AddColumn("dbo.ContractType", "Date", c => c.DateTime());
            AddColumn("dbo.ContractType", "Conmmertial", c => c.String(maxLength: 50));
            DropColumn("dbo.ContractType", "IsActive");
            DropColumn("dbo.ContractType", "Name");
        }
    }
}
