using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyFundi.Web.Migrations
{
    public partial class fundiclientRelationshipsUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_FundiProfiles_AssignedFundiProfileId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Users_AssignedFundiUserId",
                table: "Jobs");

            migrationBuilder.AlterColumn<int>(
                name: "ClientFundiContractId",
                table: "Jobs",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<Guid>(
                name: "AssignedFundiUserId",
                table: "Jobs",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AlterColumn<int>(
                name: "AssignedFundiProfileId",
                table: "Jobs",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<bool>(
                name: "HasBeenAssignedFundi",
                table: "Jobs",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_FundiProfiles_AssignedFundiProfileId",
                table: "Jobs",
                column: "AssignedFundiProfileId",
                principalTable: "FundiProfiles",
                principalColumn: "FundiProfileId",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Users_AssignedFundiUserId",
                table: "Jobs",
                column: "AssignedFundiUserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_FundiProfiles_AssignedFundiProfileId",
                table: "Jobs");

            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Users_AssignedFundiUserId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "HasBeenAssignedFundi",
                table: "Jobs");

            migrationBuilder.AlterColumn<int>(
                name: "ClientFundiContractId",
                table: "Jobs",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "AssignedFundiUserId",
                table: "Jobs",
                type: "uniqueidentifier",
                nullable: false,
                oldClrType: typeof(Guid),
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AssignedFundiProfileId",
                table: "Jobs",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

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
        }
    }
}
