-- ORDER BY --
-- Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- WHERE --
-- Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';
-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;

-- Joins --
-- Find all books about Computers and list ONLY the book titles
SELECT b.title FROM books b INNER JOIN subjects s ON b.subject_id = s.id WHERE s.subject = 'Computers';
-- Find all books and display a result table with ONLY the following columns
--      Book title
--      Author's first name
--      Author's last name
--      Book subject
SELECT b.title AS Book_title, a.first_name AS Authors_first_name, a.last_name AS Authors_last_name, s.subject AS Subject 
FROM books b 
INNER JOIN authors a ON b.author_id = a.id 
INNER JOIN subjects s ON b.subject_id=s.id;
-- Find all books that are listed in the stock table
--       Sort them by retail price (most expensive first)
--       Display ONLY: title and price
SELECT b.title, s.cost 
FROM stock s 
INNER JOIN editions e ON s.isbn = e.isbn                                             
INNER JOIN books b ON e.book_id = b.id 
ORDER BY s.cost DESC;

-- Find the book "Dune" and display ONLY the following columns
--      Book title
--      ISBN number
--      Publisher name
--      Retail price
SELECT b.title, s.isbn, p.name, s.cost 
FROM stock s 
INNER JOIN editions e 
    ON s.isbn = e.isbn                             
INNER JOIN books b 
    ON e.book_id = b.id 
INNER JOIN publishers p 
    ON e.publisher_id=p.id
WHERE b.title='Dune';
-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
--      Customer first name
--      Customer last name
--      ship date
--      book title
SELECT c.first_name, c.last_name, s.ship_date, b.title                                                                                       
FROM shipments s INNER JOIN editions e ON s.isbn=e.isbn                                                                                                 
INNER JOIN books b ON e.book_id=b.id                                                                                                                    
INNER JOIN customers c ON s.customer_id=c.id                                                                                                            
ORDER BY s.ship_date;


