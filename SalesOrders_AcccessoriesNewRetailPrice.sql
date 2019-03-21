
/* Update all retail prices for products categorize as accessories by 1.05 */

/*Run a select first before updating product categories
  as Accessories */

SELECT ProductNumber, ProductName, retailprice, CAST(RetailPrice * 1.05 AS smallmoney) AS NewPrice
  FROM Products
  WHERE CategoryID =(SELECT CategoryID
  FROM Categories 
  WHERE CategoryDescription = 'Accessories')


  /* Updating product categorize as Accessories by 1.05  */

UPDATE Products
SET RetailPrice = RetailPrice *1.05
WHERE CategoryID =(SELECT CategoryID
   FROM Categories 
   WHERE CategoryDescription = 'Accessories')

/* Confirmed the updated retailprice */
SELECT ProductNumber, ProductName, retailprice
  FROM Products
  WHERE CategoryID =(SELECT CategoryID
  FROM Categories 
  WHERE CategoryDescription = 'Accessories')