using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyFundi.Web.Migrations
{
    public partial class deletingJobWorkCategoryEntity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "JobWorkCategories");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "JobWorkCategories",
                columns: table => new
                {
                    JobWorkCategoryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DateCreated = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateUpdated = table.Column<DateTime>(type: "datetime2", nullable: false),
                    JobId = table.Column<int>(type: "int", nullable: false),
                    WorkCategoryId = table.Column<int>(type: "int", nullable: false)
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
                name: "IX_JobWorkCategories_JobId",
                table: "JobWorkCategories",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_JobWorkCategories_WorkCategoryId",
                table: "JobWorkCategories",
                column: "WorkCategoryId");
        }
    }
}
