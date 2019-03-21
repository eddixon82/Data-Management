 /* Display all orders, the products in each order, and the amount owed
for each  product, in order number sequence.

 Create a view to save time 
from recreating the query again and can be ran over and order.In addition hiding the tables  */

CREATE VIEW SalesOrders
AS
SELECT DISTINCT o.OrderNumber,CAST(o.OrderDate AS DATE) AS OrderDate, CAST(o.ShipDate AS DATE) AS ShipDate,o.CustomerID,p.ProductNumber,p.ProductName,(od.QuantityOrdered * od.QuotedPrice) AS AmountOwed
FROM DBO.Orders o
INNER JOIN Order_Details od ON od.OrderNumber = o.OrderNumber
INNER JOIN Products p on p.ProductNumber = od.ProductNumber
GO

/* Confirm the view works */
SELECT * FROM SalesOrders


