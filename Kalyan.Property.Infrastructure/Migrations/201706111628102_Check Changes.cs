namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CheckChanges : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.PropertyDetail", "Approved", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PropertyDetail", "Approved", c => c.Boolean());
        }
    }
}
