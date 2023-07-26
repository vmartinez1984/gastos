using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Gastos.Backup.Repositories.Migrations
{
    /// <inheritdoc />
    public partial class MigrationFirst : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Categoria",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categoria", x => x.Guid);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Compra",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Nota = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MesesSinIntereses = table.Column<int>(type: "int", nullable: false),
                    Cantidad = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    TdcId = table.Column<int>(type: "int", nullable: false),
                    FechaDeRegistro = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Compra", x => x.Guid);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "DetalleDeApartado",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    ApartadoId = table.Column<int>(type: "int", nullable: false),
                    Cantidad = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    Nota = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    FechaDeRegistro = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DetalleDeApartado", x => x.Guid);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Periodo",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    FechaInicial = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    FechaFinal = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Periodo", x => x.Guid);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "TipoDeApartado",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoDeApartado", x => x.Guid);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Subcategoria",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CategoriaGuid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    Cantidad = table.Column<decimal>(type: "decimal(65,30)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subcategoria", x => x.Guid);
                    table.ForeignKey(
                        name: "FK_Subcategoria_Categoria_CategoriaGuid",
                        column: x => x.CategoriaGuid,
                        principalTable: "Categoria",
                        principalColumn: "Guid",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Pago",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CompraId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    NumeroDePago = table.Column<int>(type: "int", nullable: false),
                    CantidadEsperada = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    FechaDePago = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CantidadDepositada = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    FechaDeDeposito = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pago", x => x.Guid);
                    table.ForeignKey(
                        name: "FK_Pago_Compra_CompraId",
                        column: x => x.CompraId,
                        principalTable: "Compra",
                        principalColumn: "Guid",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Apartado",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    PeriodoGuid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    TipoDeApartadoGuid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    SubcategoriaGuid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Intereses = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    CantidadInicial = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    CantidadFinal = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    FechaInicial = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    FechaFinal = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    FechaDeRegistro = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Apartado", x => x.Guid);
                    table.ForeignKey(
                        name: "FK_Apartado_Subcategoria_SubcategoriaGuid",
                        column: x => x.SubcategoriaGuid,
                        principalTable: "Subcategoria",
                        principalColumn: "Guid",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Apartado_TipoDeApartado_TipoDeApartadoGuid",
                        column: x => x.TipoDeApartadoGuid,
                        principalTable: "TipoDeApartado",
                        principalColumn: "Guid",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Gasto",
                columns: table => new
                {
                    Guid = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Nombre = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Cantidad = table.Column<decimal>(type: "decimal(65,30)", nullable: false),
                    SubcategoriaId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    EstaActivo = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    PeriodoId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    FechaDeRegistro = table.Column<DateTime>(type: "datetime(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Gasto", x => x.Guid);
                    table.ForeignKey(
                        name: "FK_Gasto_Subcategoria_SubcategoriaId",
                        column: x => x.SubcategoriaId,
                        principalTable: "Subcategoria",
                        principalColumn: "Guid",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Apartado_SubcategoriaGuid",
                table: "Apartado",
                column: "SubcategoriaGuid");

            migrationBuilder.CreateIndex(
                name: "IX_Apartado_TipoDeApartadoGuid",
                table: "Apartado",
                column: "TipoDeApartadoGuid");

            migrationBuilder.CreateIndex(
                name: "IX_Gasto_SubcategoriaId",
                table: "Gasto",
                column: "SubcategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Pago_CompraId",
                table: "Pago",
                column: "CompraId");

            migrationBuilder.CreateIndex(
                name: "IX_Subcategoria_CategoriaGuid",
                table: "Subcategoria",
                column: "CategoriaGuid");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Apartado");

            migrationBuilder.DropTable(
                name: "DetalleDeApartado");

            migrationBuilder.DropTable(
                name: "Gasto");

            migrationBuilder.DropTable(
                name: "Pago");

            migrationBuilder.DropTable(
                name: "Periodo");

            migrationBuilder.DropTable(
                name: "TipoDeApartado");

            migrationBuilder.DropTable(
                name: "Subcategoria");

            migrationBuilder.DropTable(
                name: "Compra");

            migrationBuilder.DropTable(
                name: "Categoria");
        }
    }
}
