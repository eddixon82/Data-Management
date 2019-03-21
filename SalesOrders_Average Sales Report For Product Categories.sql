/*Display for each product the product name and the total sales
 that is greater than the average of sales for all products in that 
  category */

  SELECT p.ProductName,SUM(od.QuotedPrice * od.QuantityOrdered)
  AS Totalsales
  FROM Products p
  INNER JOIN Order_Details od ON od.productNumber = p.productNumber
  GROUP BY p.CategoryID, p.ProductName
  HAVING SUM(od.QuotedPrice * od.QuantityOrdered) > 
  (SELECT AVG(SumCategory) AS Avg1
			FROM
				(SELECT p2.CategoryID, SUM(od2.QuotedPrice * od2.QuantityOrdered) AS SumCategory
					FROM products p2  
					INNER JOIN Order_Details od2 ON od2.ProductNumber = p2.ProductNumber
					GROUP BY p2.CategoryID,p2.ProductNumber) AS SumResult
			WHERE CategoryID = p.CategoryID
			GROUP BY CategoryID)
			
		


							  

