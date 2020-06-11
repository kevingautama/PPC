using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjectPriorityControl.Migrations
{
    public partial class AddStartFinishDateTask : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "FinishDate",
                table: "Task",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "StartDate",
                table: "Task",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FinishDate",
                table: "Task");

            migrationBuilder.DropColumn(
                name: "StartDate",
                table: "Task");
        }
    }
}
