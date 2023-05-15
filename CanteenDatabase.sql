CREATE TABLE `CanteenMenu_ProductCategories`(
`ProductCategoryId` INT NOT NULL AUTO_INCREMENT,
`ProductCategoryName` VARCHAR(20) NOT NULL,
Primary Key(`ProductCategoryId`));

CREATE TABLE `CanteenMenu_Roles`(
`RoleId` INT NOT NULL AUTO_INCREMENT,
`RoleName` varchar(15) NOT NULL,
Primary Key(`RoleId`));

CREATE TABLE `CanteenMenu_MealCategories`(
`MealCategoryId` INT NOT NULL AUTO_INCREMENT,
`MealCategoryName` VARCHAR(20) NOT NULL,
Primary Key(`MealCategoryId`));

CREATE TABLE `CanteenMenu_UnitsOfMeasure`(
`UnitId` INT NOT NULL AUTO_INCREMENT,
`UnitName` varchar(15) NOT NULL,
Primary Key(`UnitId`));

CREATE TABLE `CanteenMenu_Products` (
  `ProductId` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(20) NOT NULL,
  `ProductCategoryId` INT NOT NULL,
  `ProductFats` FLOAT NOT NULL,
  `ProductCarbohydrates` FLOAT NOT NULL,
  `ProductProteins` FLOAT NOT NULL,
  `SugarContent` INT NOT NULL,
  `WithLactose` BOOLEAN NOT NULL,
  `ProductKcal` INT NOT NULL,
  `ProductCapacity` INT NOT NULL,
  `UnitId` INT NOT NULL,
  PRIMARY KEY (`ProductId`),
  FOREIGN KEY (`UnitId`) REFERENCES `CanteenMenu_UnitsOfMeasure`(`UnitId`));
  
CREATE TABLE `CanteenMenu_Meals`(
`MealId` INT NOT NULL AUTO_INCREMENT,
`MealCategoryId` INT NOT NULL,
`MealName` varchar(20) NOT NULL,
`Recipe` varchar(400) NOT NULL,
`MealKcal` INT NOT NULL,
`IsVege` BOOLEAN NOT NULL,
`IsVegan` BOOLEAN NOT NULL,
`WithLactose` BOOLEAN NOT NULL,
Primary Key (`MealId`),
FOREIGN KEY (`MealCategoryId`) REFERENCES `CanteenMenu_MealCategories` (`MealCategoryId`));

CREATE TABLE `CanteenMenu_ListOfProducts`(
`Id` INT NOT NULL AUTO_INCREMENT,
`ProductId` INT NOT NULL,
`MealId` INT NOT NULL,
`UnitId` INT NOT NULL,
`CountOfProducts` INT NOT NULL,
PRIMARY KEY (`Id`),
FOREIGN KEY (`ProductId`) REFERENCES `CanteenMenu_Products`(`ProductId`),
FOREIGN KEY (`MealId`) REFERENCES `CanteenMenu_Meals`(`MealId`),
FOREIGN KEY (`UnitId`) REFERENCES `CanteenMenu_UnitsOfMeasure`(`UnitId`));

CREATE TABLE `CanteenMenu_Menu`(
`MenuId` INT NOT NULL AUTO_INCREMENT,
`NumberOfMeals` INT NOT NULL,
`MenuKcal` INT NOT NULL,
`MenuDate` DATE NOT NULL, 
PRIMARY KEY (`MenuId`));

CREATE TABLE `CanteenMenu_ListOfMeals`(
`Id` INT NOT NULL AUTO_INCREMENT,
`MenuId` INT NOT NULL,
`MealId` INT NOT NULL,
`CountOfMeals` INT NOT NULL,
PRIMARY KEY (`Id`),
FOREIGN KEY (`MenuId`) REFERENCES `CanteenMenu_Menu`(`MenuId`),
FOREIGN KEY (`MealId`) REFERENCES `CanteenMenu_Meals`(`MealId`));

CREATE TABLE `CanteenMenu_ProductResources`(
`Id` INT NOT NULL AUTO_INCREMENT,
`ProductId` INT NOT NULL,
`UnitId` INT NOT NULL,
`CountOfProducts` INT NOT NULL,
PRIMARY KEY (`Id`),
FOREIGN KEY (`ProductId`) REFERENCES `CanteenMenu_Products`(`ProductId`),
FOREIGN KEY (`UnitId`) REFERENCES `CanteenMenu_UnitsOfMeasure`(`UnitId`));

CREATE TABLE `CanteenMenu_PersonalData`(
`UserId` INT NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(20) NOT NULL,
`Surname` VARCHAR(20) NOT NULL,
`Age` INT NOT NULL,
`Sex` VARCHAR(1) Check(`Sex` IN ('K', 'M')),
PRIMARY KEY (`UserId`));

CREATE TABLE `CanteenMenu_UserAccount`(
`AccountId` INT NOT NULL AUTO_INCREMENT,
`UserId` INT NOT NULL,
`RoleId` INT NOT NULL,
`Email` varchar(20) NOT NULL,
`Login` varchar(20) NOT NULL,
`Password` varchar(20) NOT NULL,
PRIMARY KEY (`AccountId`),
FOREIGN KEY(`UserId`) REFERENCES `CanteenMenu_PersonalData`(`UserId`),
FOREIGN KEY(`RoleId`) REFERENCES `CanteenMenu_Roles`(`RoleId`));

CREATE TABLE `CanteenMenu_Review`(
`ReviewId` INT NOT NULL AUTO_INCREMENT,
`UserId` INT NOT NULL,
`MealId` INT NOT NULL,
`ReviewText` VARCHAR(200),
`Rating` INT CHECK (`Rating` IN (1,2,3,4,5)),
PRIMARY KEY(`ReviewId`),
FOREIGN KEY(`UserId`) REFERENCES `CanteenMenu_PersonalData`(`UserId`),
FOREIGN KEY(`MealId`) REFERENCES `CanteenMenu_Meals`(`MealId`));