using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjectPriorityControl.Migrations
{
    public partial class UpdateAppDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "AssignUserId",
                table: "Task",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Task",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "Task",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsDone",
                table: "Project",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "ProjectCode",
                table: "Project",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<DateTime>(
                name: "StartDate",
                table: "Project",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Project",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AssignUserId",
                table: "Task");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Task");

            migrationBuilder.DropColumn(
                name: "Type",
                table: "Task");

            migrationBuilder.DropColumn(
                name: "IsDone",
                table: "Project");

            migrationBuilder.DropColumn(
                name: "ProjectCode",
                table: "Project");

            migrationBuilder.DropColumn(
                name: "StartDate",
                table: "Project");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Project");
        }
    }
}
