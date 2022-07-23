1-
SELECT FirstName, 
		LastName,
		CustomerId, 
		Country
FROM customers 
	WHERE Country != "USA"
	
2- SELECT *
FROM customers 
	WHERE Country LIKE "BRAZIL"  (Like can be removed here, or can do 'br%')

3- SELECT
	customers.FirstName, 
	customers.LastName,
	invoices.InvoiceId,
	invoices.InvoiceDate,
	invoices.Total
From customers
LEFT JOIN invoices on 
	customers.CustomerId = invoices.CustomerId
WHERE customers.Country = "Brazil"

4- Select *
FROM employees
WHERE Title LIKE '%agent%'

5- Select DISTINCT BillingCountry
FROM invoices
6- SELECT Total, l,  sup, name, last FROM 
(SELECT invoices.Total, customers.CustomerId l FROM invoices LEFT JOIN customers ON invoices.CustomerId = customers.CustomerId)
LEFT JOIN 
(SELECT customers.CustomerId k, customers.SupportRepId sup, employees.FirstName name, employees.LastName last FROM customers LEFT JOIN employees ON customers.SupportRepId = employees.EmployeeId
ORDER BY SupportRepId)
ON l = k

7



	
	
