USE northwind;

/*
1. What is the product name(s) of the most expensive products? HINT: Find the
max price in a subquery and then use that value to find products whose price
equals that value.
*/
SELECT
	productName,
    unitPrice
FROM
	Products
WHERE
	unitPrice IN (
	SELECT
		MAX(unitPrice)
    FROM
		Products);
    
/*
2. What is the order id, shipping name and shipping address of all orders shipped via
"Federal Shipping"? HINT: Find the shipper id of "Federal Shipping" in a subquery
and then use that value to find the orders that used that shipper.
*/

SELECT
	orderId,
    shipName,
    shipAddress
FROM
	Orders
WHERE
	shipVia = (
    SELECT
		shipperID
	FROM
		shippers
	WHERE
		companyName LIKE "%Federal Shipping%"
    );

/*
3. What are the order ids of the orders that ordered "Sasquatch Ale"? HINT: Find
the product id of "Sasquatch Ale" in a subquery and then use that value to find
the matching orders from the `order details` table. Because the `order details`
table has a space in its name, you will need to surround it with back ticks in the
FROM clause.
*/
        

SELECT
	orderID
FROM
	`Order Details`
Where
	productID =(
	SELECT
		productID
	FROM
		Products
	WHERE
		productName LIKE "%sasquatch ale%"
        );
/*
4. What is the name of the employee that sold order 10266?
*/
SELECT
	firstName,
    lastName
FROM
	Employees
WHERE
	employeeID = (
    SELECT
		employeeID
	FROM
		Orders
	Where
		orderID = 10266
    );

/*
 5. What is the name of the customer that bought order 10266?
 */
 SELECT
	customerID,
	companyName
    
FROM
	Customers
WHERE
	customerID = (
    SELECT
		customerID
        
	FROM
		Orders
	Where
		orderID = 10266
    );
    
/*
using join
*/
SELECT
	c.CustomerID,
	c.CompanyName
FROM
	Customers c
	JOIN Orders o ON (o.CustomerID = c.CustomerID)
WHERE
	OrderID = 10266;