namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Contactmodelchanges : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Contact", "ContactTypeId", "dbo.ContractType");
            DropIndex("dbo.Contact", new[] { "ContactTypeId" });
            DropPrimaryKey("dbo.Contact");
            AlterColumn("dbo.Contact", "Id", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.Contact", "Id");
            DropColumn("dbo.Contact", "ContactTypeId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Contact", "ContactTypeId", c => c.Int(nullable: false));
            DropPrimaryKey("dbo.Contact");
            AlterColumn("dbo.Contact", "Id", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.Contact", "Id");
            CreateIndex("dbo.Contact", "ContactTypeId");
            AddForeignKey("dbo.Contact", "ContactTypeId", "dbo.ContractType", "Id");
        }
    }
}
