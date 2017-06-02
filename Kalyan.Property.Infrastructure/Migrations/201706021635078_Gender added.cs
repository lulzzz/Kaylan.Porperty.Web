namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Genderadded : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Users", "Gender", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Users", "Gender");
        }
    }
}
