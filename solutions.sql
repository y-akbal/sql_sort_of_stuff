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

7- SELECT Total, Agent_ID, name, last, Customer_NAME_, CUST_LAST_, Country FROM 
(SELECT invoices.Total, customers.CustomerId l, customers.FirstName Customer_NAME_, customers.LastName CUST_LAST_, customers.Country Country FROM invoices LEFT JOIN customers ON invoices.CustomerId = customers.CustomerId)
LEFT JOIN 
(SELECT customers.CustomerId k, customers.SupportRepId Agent_ID, employees.FirstName name, employees.LastName last FROM customers LEFT JOIN employees ON customers.SupportRepId = employees.EmployeeId
ORDER BY SupportRepId)
ON l = k

8- SELECT CAST(strftime('%Y',InvoiceDate) as INTEGER) Date, invoices.total FROM invoices WHERE Date BETWEEN 2009 and 2011

9- SELECT sum(1) FROM invoice_items WHERE InvoiceId = 37





	
	
