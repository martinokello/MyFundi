using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyFundi.Web.Migrations
{
    public partial class alterTableJob : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AssignedFundiProfileId",
                table: "Jobs",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<Guid>(
                name: "AssignedFundiUserId",
                table: "Jobs",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_AssignedFundiProfileId",
                table: "Jobs",
                column: "AssignedFundiProfileId");

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_AssignedFundiUserId",
                table: "Jobs",
                column: "AssignedFundiUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_ClientProfileId",
                table: "Jobs",
                column: "ClientProfileId");

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_ClientUserId",
                table: "Jobs",
                column: "ClientUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_LocationId",
                table: "Jobs",
                column: "LocationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_FundiProfiles_AssignedFundiProfileId",
                table: "Jobs",
                column: "AssignedFundiProfileId",
                principalTable: "FundiProfiles",
                principalColumn: "FundiProfileId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Users_AssignedFundiUserId",
                table: "Jobs",
                column: "AssignedFundiUserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_ClientProfiles_ClientProfileId",
                table: "Jobs",
                column: "ClientProfileId",
                principalTable: "ClientProfiles",
                principalColumn: "ClientProfileId",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Users_ClientUserId",
                table: "Jobs",
                column: "ClientUserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Locations_LocationId",
                table: "Jobs",
                column: "LocationId",
                principalTable: "Locations",
                principalColumn: "LocationId",
                onDelete: ReferentialAction.NoAction);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_FundiProfiles_AssignedFundiProfileId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Users_AssignedFundiUserId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_ClientProfiles_ClientProfileId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Users_ClientUserId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Locations_LocationId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_AssignedFundiProfileId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_AssignedFundiUserId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_ClientProfileId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_ClientUserId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_LocationId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "AssignedFundiProfileId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "AssignedFundiUserId",
                table: "Jobs");
        }
    }
}
