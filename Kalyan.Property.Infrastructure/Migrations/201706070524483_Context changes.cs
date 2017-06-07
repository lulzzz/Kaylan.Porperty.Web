namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Contextchanges : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.PropertyDetail", "agent", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.PropertyDetail", "agent", c => c.Boolean());
        }
    }
}
