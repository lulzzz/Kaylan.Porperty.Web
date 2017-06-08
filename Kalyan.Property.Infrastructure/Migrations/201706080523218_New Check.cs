namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NewCheck : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.PropertyAmenityMapping");
            AlterColumn("dbo.PropertyAmenityMapping", "Id", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.PropertyAmenityMapping", "Id");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.PropertyAmenityMapping");
            AlterColumn("dbo.PropertyAmenityMapping", "Id", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.PropertyAmenityMapping", "Id");
        }
    }
}
