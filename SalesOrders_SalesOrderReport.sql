 /*Display all orders, the products in each order, and the amount owed
for each  product, in order number sequence*/


 /* Showing all records in Orders table */

SELECT *
FROM DBO.Orders

/*Showing all records in Order_Details table */

SELECT * 
FROM DBO.Order_Details

/*Showing all records in product table */

SELECT * 
FROM DBO.Products

/* Create an Inner Join on three tables, Orders, Order_Details and Product */

SELECT TOP(100) o.OrderNumber,CAST(o.OrderDate AS DATE) AS OrderDate,
 CAST(o.ShipDate AS DATE) AS ShipDate,o.CustomerID,p.ProductNumber,
 p.ProductName,(od.QuantityOrdered * od.QuotedPrice) AS AmountOwed
FROM DBO.Orders o
INNER JOIN Order_Details od ON od.OrderNumber = o.OrderNumber
INNER JOIN Products p on p.ProductNumber = od.ProductNumber

