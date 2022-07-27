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
17-  SELECT support_rep_id, sum(TOTAL_)
FROM customer INNER JOIN 
(SELECT customer_id, sum(1) TOTAL_
FROM
	invoice
GROUP BY customer_id)
USING (customer_id)
GROUP BY support_rep_id

/*
gives partial answer, if you do the following you will get the names as well
*/	

17- SELECT employee.first_name, employee.last_name, employee.employee_id, TOTAL__
FROM 
employee
INNER JOIN
((SELECT support_rep_id, sum(TOTAL_) TOTAL__
FROM customer INNER JOIN 
(SELECT customer_id, sum(1) TOTAL_
FROM
	invoice
GROUP BY customer_id)
USING (customer_id)
GROUP BY support_rep_id))
ON 1
employee_id = support_rep_id

	
18- /*(We answer this question for 2017)*/
SELECT support_rep_id, DATE_, sum(1)
FROM customer INNER JOIN 
(SELECT customer_id, CAST(strftime('%Y',invoice_date) as INTEGER) DATE_
FROM
	invoice
)
WHERE DATE_ = 2017
GROUP BY support_rep_id
/* OR */
SELECT  support_rep_id, max(TOTAL_sum) FROM
(SELECT support_rep_id, DATE_, sum(1) TOTAL_sum
FROM customer INNER JOIN 
(SELECT customer_id, CAST(strftime('%Y',invoice_date) as INTEGER) DATE_
FROM
	invoice
)
WHERE DATE_ = 2017
GROUP BY support_rep_id)


19 - /* The same as before */


20- SELECT  support_rep_id, max(TOTAL_sum) FROM
(SELECT support_rep_id, DATE_, sum(1) TOTAL_sum
FROM customer INNER JOIN 
(SELECT customer_id, CAST(strftime('%Y',invoice_date) as INTEGER) DATE_
FROM
	invoice
)
GROUP BY support_rep_id)


21 - SELECT employee.first_name, employee.last_name, Tot_Customers
FROM employee 
INNER JOIN 
(SELECT sum(1) Tot_Customers, 
		support_rep_id 
	FROM customer 
	GROUP BY customer.support_rep_id
)
						
ON support_rep_id = employee.employee_id

/* IF you use left join here you see non sales agents get NULL, so better use INNER*/ 

22- /* For max*/

 SELECT billing_country, max(invoices) FROM
(SELECT billing_country, sum(1) invoices FROM invoice
GROUP BY invoice.billing_country
)

/* For all countries*/
SELECT billing_country, sum(1) invoices FROM invoice
GROUP BY invoice.billing_country

23- /* did it for 2020 */ SELECT max(sum_), track_ID FROM
(
SELECT sum(1) sum_, track_ID FROM
(
SELECT invoice_id, track_id track_ID, 
CAST(strftime('%Y',invoice_date) as INTEGER) Date_ FROM 
invoice
INNER JOIN
invoice_line
USING (invoice_id)
WHERE Date_ = 2020
)
GROUP BY track_ID
)

24- SELECT track.name, track_ID_  FROM
track INNER JOIN
(
SELECT sum(1) sum_, track_ID_ FROM
(
SELECT invoice_id, track_id track_ID_, FROM 
invoice
LEFT JOIN
invoice_line
USING (invoice_id)
)
GROUP BY track_ID_
ORDER BY sum_ DESC
LIMIT 5)
ON track_ID_ = track.track_id

25 -  SELECT ID, composer, sum(1) TOT FROM 
invoice_line
LEFT JOIN
  ( SELECT track_id ID, composer FROM 
track )
ON ID = invoice_line.track_id
WHERE composer IS NOT NULL
GROUP BY composer
ORDER BY TOT DESC
/* This dude may be wrong wathca' nevertheless gives the order. Now it is easy to find max*/

26- SELECT Invoice_ID_, Total_Number_Of_Tracks FROM

(SELECT max(GEN_ID) - min(GEN_ID) GEN_DIF,
		IN_ID Invoice_ID_,
		sum(tot_track) Total_Number_Of_Tracks
FROM 
(SELECT  track_id tra_ID, 1 Tot_track,
		genre_id GEN_ID, 
		invoice_id IN_ID 
FROM  invoice_line 
LEFT JOIN track
USING (track_id)
ORDER BY IN_ID)
GROUP BY IN_ID)
WHERE GEN_DIF != 0  
/* Wavvv this one did hurt*/


	
	
