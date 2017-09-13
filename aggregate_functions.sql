SELECT
    COUNT(*)
FROM books WHERE title LIKE '%the%';

SELECT COUNT(*) FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books
SELECT CONCAT(author_lname, ',', author_fname) AS 'author', AVG(released_year) FROM books GROUP BY author_lname,author_fname;
SELECT CONCAT(author_lname, ',', author_fname) AS 'Author Full Name',pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT
    released_year AS 'year',
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books GROUP BY released_year;