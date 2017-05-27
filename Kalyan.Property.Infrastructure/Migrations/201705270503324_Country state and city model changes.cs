namespace Kalyan.Property.Infrastructure.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Countrystateandcitymodelchanges : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.City", "StateId", "dbo.State");
            DropPrimaryKey("dbo.State");
            AlterColumn("dbo.City", "IsActive", c => c.Boolean(nullable: false));
            AlterColumn("dbo.State", "Id", c => c.Int(nullable: false, identity: true));
            AlterColumn("dbo.State", "IsActive", c => c.Boolean(nullable: false));
            AddPrimaryKey("dbo.State", "Id");
            AddForeignKey("dbo.City", "StateId", "dbo.State", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.City", "StateId", "dbo.State");
            DropPrimaryKey("dbo.State");
            AlterColumn("dbo.State", "IsActive", c => c.Boolean());
            AlterColumn("dbo.State", "Id", c => c.Int(nullable: false));
            AlterColumn("dbo.City", "IsActive", c => c.String(maxLength: 50));
            AddPrimaryKey("dbo.State", "Id");
            AddForeignKey("dbo.City", "StateId", "dbo.State", "Id");
        }
    }
}
