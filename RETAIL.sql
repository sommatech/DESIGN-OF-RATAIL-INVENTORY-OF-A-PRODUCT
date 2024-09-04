
CREATE DATABASE RetailInventoryDb;

USE RetailInventoryDb;

CREATE TABLE Pro_duct(
      [ProductID] NVARCHAR(20), 
	  [ProductName] NVARCHAR(20), 
	  [CategoryID] INT,
	  [Price] INT, 
	  [Quantity] INT,
	  [SupplierID] INT
	  );

INSERT INTO Pro_duct (ProductID, ProductName, CategoryID, Price, Quantity, SupplierID)
VALUES   
     ('P01', 'Laptop', '1','1200','50', '101'),
     ('P02', 'Smartphone','1', '800','100', '102'), 
     ('P03', 'TV', '2', '1500','30', '103'),
     ('P04', 'Refrigerator', '2', '900','25', '104'),
     ('P05', 'Microwave', '3', '200','60', '105'),
     ('P06', 'Washing Machine', '2', '1100','20', '106'),
	 ('P07', 'Headphone', '4', '100','200', '107'),
     ('P08', 'Camera', '1', '700','15', '108'),
	 ('P09', 'Air Conditioner', '2', '1300','10', '109'),
	 ('P10', 'Blender', '3','150','80', '110');


CREATE TABLE Category
(
     [CategoryID] INT,
	  [CategoryName] NVARCHAR(20)
	  );

INSERT INTO Category (CategoryID, CategoryName)
VALUES  
	('1', 'Electronics'),
	('2', 'Appliances'),
	('3', 'Kitchenware'),
	('4', 'Accessories');





CREATE TABLE Supplier
(
	 [SupplierID] INT,
	 [SupplierName] NVARCHAR(20),
     [ContactNumber] NVARCHAR(20)
	 );

INSERT INTO Supplier (SupplierID, SupplierName, ContactNumber)
VALUES  
	('101', 'SupplierA','123-456-7890'),
	('102', 'SupplierB','234-567-8901'),
	('103', 'SupplierC','345-678-9012'),
	('104', 'SupplierD','456-789-0123'),
	('105','SupplierE','567-890-1234'),
	('106','SupplierF','678-901-2345'),
	('107','SupplierG','789-012-3456'),
	('108','SupplierH','890-123-4567'),
	('109','SupplierI','901-234-5678'),
	('110','SupplierJ','012-345-6789');




CREATE TABLE Warehouse
(
       [WarehouseID] NVARCHAR(20),
	   [WarehouseName] NVARCHAR(30),
	   [Location] NVARCHAR(20)
	  );

INSERT INTO Warehouse (WarehouseID, WarehouseName, Location)
VALUES
    ('W01', 'MainWarehouse', 'NewYork'),
	('W02','EastWarehouse', 'Boston'),
	('W03','WestWarehouse', 'San Diego'),
	('W04', 'NorthWarehouse', 'Chicago'),
	('W05', 'SouthWarehouse', 'Miami'),
	('W06', 'CentralWarehouse', 'Dallas'),
	('W07', 'PacificWarehouse', 'San Francisco'),
	('W08', 'MountainWarehouse', 'Denver'),
    ('W09','SouthernWarehouse', 'Atlanta'),
    ('W10', 'GulfWarehouse', 'Houston');


--------------------solutions to the questions

--------------1. write a SQL query to fetch products with the same price.

SELECT * 
FROM Pro_duct
WHERE Price IN (
   SELECT (Price)
   FROM Pro_duct
   GROUP BY Price
   HAVING COUNT (Price) > 1
);


-----------------------2. write a SQL query to fetch find the second highest priced product and its category.
 
SELECT P.ProductID, P.ProductName,P.Price,C.CategoryName
FROM Pro_duct P
INNER JOIN Category C
ON P.CategoryID = C.CategoryID
ORDER BY Price DESC
OFFSET  1 ROW
FETCH NEXT 1 ROW ONLY



------------------3. WRITE A QUERY TO GET THE MAXIMUM SALARY FROM EACH DEPARTMEENT, THE NAME OF THE DEPARTMENT AND THEE NAME OF THE EANER 

SELECT P. Price MAXPrice,C.CategoryName, P.ProductName
FROM Pro_duct P
JOIN Category C
ON  P.CategoryID = C.CategoryID
JOIN (SELECT CategoryID, MAX (Price) AS MAXPrice
FROM Pro_duct P
GROUP BY CategoryID) M ON C.CategoryID=M.CategoryID
AND P. Price = MAXPrice
 
 
 ------------------4. WRITE A SQL QUERY TO FETCH Supplier-wise count of products sorted by count in descending order

 SELECT COUNT(DISTINCT P.ProductName) count_of_sw ,P.SupplierID,S.SupplierName
 FROM Pro_duct P, Supplier S
 WHERE P.SupplierID = S.SupplierID 
 GROUP BY P.SupplierID,S.SupplierName 
 ORDER BY COUNT(*) DESC


 
 -------------5.query to fetch only the first word from the ProductName and append the price..
SELECT CONCAT(LEFT(ProductName,
        CHARINDEX ('',ProductName )+1), '_',Price) FirstWord_Price
FROM Pro_duct P


-------------6. query to fetch products with odd prices.
SELECT Price FROM Pro_duct P
WHERE Price % 2 = 1


--------------7. Create a view to fetch products with a price greater than $500.
CREATE VIEW vw_prt_price_$500 
AS
 SELECT P.ProductID, P.ProductName,P.Price, P.Quantity, C.CategoryName, S.SupplierName
 FROM Pro_duct P
 INNER JOIN Category C 
 ON P.CategoryID = C.CategoryID
INNER JOIN Supplier S
 ON P.SupplierID = S.SupplierID
 WHERE P.Price > $500
SELECT*FROM vw_prt_price_$500 

---------------8.Create a procedure to update product prices by 15% where the category is 'Electronics' and the supplier is not 'SupplierA'.

CREATE PROCEDURE sp_price_increase
AS
 BEGIN 
	UPDATE P
	SET P.Price = P.Price * 1.15
	FROM Pro_duct P
    JOIN Category C ON P.CategoryID = C.CategoryID
	JOIN Supplier S ON P.SupplierID = S.SupplierID
	WHERE C.CategoryName ='Electronics' AND S.SupplierName NOT IN ('SupplierA');
END;
GO
EXEC sp_price_increase;
GO
 
---------------9.Create a stored procedure to fetch product details along with their category, and how to screenshot using keyboardsupplier, including error handling.

CREATE PROCEDURE sp_fetch_retail_details
AS
BEGIN
    BEGIN TRY
        SELECT 
            P.ProductName, 
            C.CategoryName, 
            S.supplierName
        FROM Pro_duct P
        INNER JOIN Category C ON P.CategoryID = C.CategoryID
        INNER JOIN Supplier S ON P.SupplierID = S.SupplierID
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 20, 1);
    END CATCH
END;
GO