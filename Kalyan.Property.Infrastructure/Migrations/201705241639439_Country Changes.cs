namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CountryChanges : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Country", "Name", c => c.String());
            AlterColumn("dbo.Country", "IsActive", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Country", "IsActive", c => c.Boolean());
            AlterColumn("dbo.Country", "Name", c => c.Int(nullable: false));
        }
    }
}
