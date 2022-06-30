using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyFundi.Web.Migrations
{
    public partial class FundiClientContractJobTables : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "AgreedCost",
                table: "ClientFundiContracts",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "NumberOfDaysToComplete",
                table: "ClientFundiContracts",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.CreateTable(
                name: "Jobs",
                columns: table => new
                {
                    JobId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    JobDescription = table.Column<string>(nullable: true),
                    LocationId = table.Column<int>(nullable: false),
                    ClientProfileId = table.Column<int>(nullable: false),
                    ClientUserId = table.Column<Guid>(nullable: false),
                    DateCreated = table.Column<DateTime>(nullable: false),
                    DateUpdated = table.Column<DateTime>(nullable: false),
                    HasCompleted = table.Column<bool>(nullable: false),
                    ClientFundiContractId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Jobs", x => x.JobId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Jobs");

            migrationBuilder.DropColumn(
                name: "AgreedCost",
                table: "ClientFundiContracts");

            migrationBuilder.DropColumn(
                name: "NumberOfDaysToComplete",
                table: "ClientFundiContracts");
        }
    }
}
