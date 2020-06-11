using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjectPriorityControl.Migrations
{
    public partial class ChangeTanknull : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Rank",
                table: "Task",
                nullable: true,
                oldClrType: typeof(int));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Rank",
                table: "Task",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);
        }
    }
}
