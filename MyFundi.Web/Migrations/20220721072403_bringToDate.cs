using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyFundi.Web.Migrations
{
    public partial class bringToDate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "WorkCategoryIds",
                table: "Jobs");

            migrationBuilder.AddColumn<int>(
                name: "JobId",
                table: "WorkCategories",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "JobWorkCategories",
                columns: table => new
                {
                    JobWorkCategoryId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkCategoryId = table.Column<int>(nullable: false),
                    JobId = table.Column<int>(nullable: false),
                    DateCreated = table.Column<DateTime>(nullable: false),
                    DateUpdated = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JobWorkCategories", x => x.JobWorkCategoryId);
                    table.ForeignKey(
                        name: "FK_JobWorkCategories_Jobs_JobId",
                        column: x => x.JobId,
                        principalTable: "Jobs",
                        principalColumn: "JobId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_JobWorkCategories_WorkCategories_WorkCategoryId",
                        column: x => x.WorkCategoryId,
                        principalTable: "WorkCategories",
                        principalColumn: "WorkCategoryId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_WorkCategories_JobId",
                table: "WorkCategories",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_JobWorkCategories_JobId",
                table: "JobWorkCategories",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_JobWorkCategories_WorkCategoryId",
                table: "JobWorkCategories",
                column: "WorkCategoryId");

            migrationBuilder.AddForeignKey(
                name: "FK_WorkCategories_Jobs_JobId",
                table: "WorkCategories",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "JobId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_WorkCategories_Jobs_JobId",
                table: "WorkCategories");

            migrationBuilder.DropTable(
                name: "JobWorkCategories");

            migrationBuilder.DropIndex(
                name: "IX_WorkCategories_JobId",
                table: "WorkCategories");

            migrationBuilder.DropColumn(
                name: "JobId",
                table: "WorkCategories");

            migrationBuilder.AddColumn<string>(
                name: "WorkCategoryIds",
                table: "Jobs",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
