namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ContactchangePrimaryAdded : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.ContractType");
            AlterColumn("dbo.ContractType", "Id", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.ContractType", "Id");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.ContractType");
            AlterColumn("dbo.ContractType", "Id", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.ContractType", "Id");
        }
    }
}
