ALTER DATABASE CHARACTER SET utf8mb4;


CREATE TABLE `Categoria` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Categoria` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `Compra` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `Nota` longtext CHARACTER SET utf8mb4 NULL,
    `MesesSinIntereses` int NOT NULL,
    `Cantidad` decimal(65,30) NOT NULL,
    `TdcId` int NOT NULL,
    `FechaDeRegistro` datetime(6) NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_Compra` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `Destino` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `Presupuesto` decimal(65,30) NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Destino` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `DetalleDeApartado` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ApartadoId` int NOT NULL,
    `Cantidad` decimal(65,30) NOT NULL,
    `Nota` longtext CHARACTER SET utf8mb4 NULL,
    `FechaDeRegistro` datetime(6) NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_DetalleDeApartado` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `Periodo` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `FechaInicial` datetime(6) NOT NULL,
    `FechaFinal` datetime(6) NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_Periodo` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `TipoDeApartado` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    CONSTRAINT `PK_TipoDeApartado` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;


CREATE TABLE `Subcategoria` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `CategoriaId` int NOT NULL,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `Cantidad` decimal(65,30) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_Subcategoria` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Subcategoria_Categoria_CategoriaId` FOREIGN KEY (`CategoriaId`) REFERENCES `Categoria` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;


CREATE TABLE `Apartado` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `PeriodoId` int NOT NULL,
    `TipoDeApartadoId` int NOT NULL,
    `SubcategoriaId` int NOT NULL,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `Intereses` decimal(65,30) NOT NULL,
    `CantidadInicial` decimal(65,30) NOT NULL,
    `CantidadFinal` decimal(65,30) NOT NULL,
    `FechaInicial` datetime(6) NOT NULL,
    `FechaFinal` datetime(6) NOT NULL,
    `FechaDeRegistro` datetime(6) NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_Apartado` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Apartado_Subcategoria_SubcategoriaId` FOREIGN KEY (`SubcategoriaId`) REFERENCES `Subcategoria` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Apartado_TipoDeApartado_TipoDeApartadoId` FOREIGN KEY (`TipoDeApartadoId`) REFERENCES `TipoDeApartado` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;


CREATE TABLE `Gasto` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Nombre` longtext CHARACTER SET utf8mb4 NULL,
    `Cantidad` decimal(65,30) NOT NULL,
    `SubcategoriaId` int NOT NULL,
    `EstaActivo` tinyint(1) NOT NULL,
    `PeriodoId` int NOT NULL,
    `FechaDeRegistro` datetime(6) NOT NULL,
    `Guid` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_Gasto` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Gasto_Subcategoria_SubcategoriaId` FOREIGN KEY (`SubcategoriaId`) REFERENCES `Subcategoria` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;


CREATE INDEX `IX_Apartado_SubcategoriaId` ON `Apartado` (`SubcategoriaId`);


CREATE INDEX `IX_Apartado_TipoDeApartadoId` ON `Apartado` (`TipoDeApartadoId`);


CREATE INDEX `IX_Gasto_SubcategoriaId` ON `Gasto` (`SubcategoriaId`);


CREATE INDEX `IX_Subcategoria_CategoriaId` ON `Subcategoria` (`CategoriaId`);


