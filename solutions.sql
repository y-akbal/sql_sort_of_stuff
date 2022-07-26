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

10- SELECT sum(quantity), invoice_id FROM invoice_line GROUP BY invoice_id

11- SELECT track.track_id, track.name, invoice_line.unit_price FROM invoice_line LEFT JOIN track
ON track.track_id = invoice_line.track_id GROUP BY invoice_line.track_id ORDER BY invoice_line.track_id


12- SELECT track.track_id, track.name, track.composer, invoice_line.* FROM invoice_line LEFT JOIN track
ON track.track_id = invoice_line.track_id GROUP BY invoice_line.track_id ORDER BY invoice_line.track_id


13- SELECT billing_country, sum(1) "# Invoices" FROM invoice GROUP BY billing_country

14- SELECT playlist.playlist_id, playlist.name, sum(1) "# OF ITEMS" FROM playlist LEFT JOIN playlist_track ON playlist.playlist_id = playlist_track.playlist_id GROUP BY playlist.playlist_id

15- SELECT Title,
		Album_Name,
		genre.name,
		Media_Type_
	FROM	
genre
LEFT JOIN
(SELECT track.name Title, 
		album.title Album_Name,
		track.genre_id Genre_Id,
		track.media_type_id Media_Type_
FROM track 
LEFT JOIN 
	album USING (album_id))
USING(genre_id);

16- SELECT customer_id, 
		sum(invoice_line.quantity) Quantity, 
		total 
FROM invoice 
LEFT JOIN 
	invoice_line USING (invoice_id) 
GROUP BY invoice_id 
ORDER BY customer_id DESC
17- 






	
	
