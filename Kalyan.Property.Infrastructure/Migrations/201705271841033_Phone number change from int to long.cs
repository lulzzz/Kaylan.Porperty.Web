namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Phonenumberchangefrominttolong : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Contact", "Phone", c => c.Long(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Contact", "Phone", c => c.Int(nullable: false));
        }
    }
}
