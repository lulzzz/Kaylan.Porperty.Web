namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class IsAgreeAddedforrequestProperty : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.PropertyRequest", "IsAgree", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.PropertyRequest", "IsAgree");
        }
    }
}
