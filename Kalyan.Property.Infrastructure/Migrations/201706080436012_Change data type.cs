namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Changedatatype : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.PropertyDetail", "Bedroom", c => c.String(maxLength: 50));
            AlterColumn("dbo.PropertyDetail", "Bathroom", c => c.String(maxLength: 50));
            AlterColumn("dbo.PropertyDetail", "Parking", c => c.String(maxLength: 50));
            AlterColumn("dbo.PropertyDetail", "Date", c => c.DateTime(nullable: false));
            DropColumn("dbo.PropertyDetail", "AmenitiesID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.PropertyDetail", "AmenitiesID", c => c.Int());
            AlterColumn("dbo.PropertyDetail", "Date", c => c.DateTime());
            AlterColumn("dbo.PropertyDetail", "Parking", c => c.Int());
            AlterColumn("dbo.PropertyDetail", "Bathroom", c => c.Int());
            AlterColumn("dbo.PropertyDetail", "Bedroom", c => c.Int());
        }
    }
}
