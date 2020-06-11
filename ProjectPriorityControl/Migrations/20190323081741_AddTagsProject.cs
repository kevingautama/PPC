using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjectPriorityControl.Migrations
{
    public partial class AddTagsProject : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Tags",
                table: "Project",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Tags",
                table: "Project");
        }
    }
}
