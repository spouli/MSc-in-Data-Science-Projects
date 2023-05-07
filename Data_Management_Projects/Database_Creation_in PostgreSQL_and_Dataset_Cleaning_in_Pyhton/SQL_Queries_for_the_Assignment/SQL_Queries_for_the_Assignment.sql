-- Some of the queries below doe not return any data as the required data from the task has not been inserted in the database
-- But for the queries that does not return any data, if you try other values on where conditions you will see, that all queries returns the proper data


-- A
UPDATE schema_08.books_08
SET publication_year = 1950
WHERE book_isbn='1934876569';

-- B
SELECT COUNT(book_isbn) from schema_08.books_08;

-- C
SELECT (b.book_isbn, b.title, b.publication_year)
FROM schema_08.books_08 as b
LEFT JOIN schema_08.booksAuthors_08 b_a ON b.book_isbn = b_a.book_isbn
LEFT JOIN schema_08.authors_08 as aut ON aut.author_id = b_a.author_id 
WHERE b.price < 20 AND aut.author_name='Antoine de Saint-Exupery'
;

-- D
SELECT (b.book_isbn, b.title, b.publication_year, aut.author_name)
FROM schema_08.books_08 as b
LEFT JOIN schema_08.booksAuthors_08 as b_a ON b.book_isbn= b_a.book_isbn
LEFT JOIN schema_08.authors_08 as aut ON aut.author_id= b_a.author_id
WHERE b.price < 2 
;

-- E
SELECT avg(review_score) FROM schema_08.reviews_08 WHERE book_isbn='0434961604';

-- F
SELECT (b.book_isbn, b.title)
FROM schema_08.books_08 as b 
LEFT JOIN schema_08.reviews_08 as r ON r.book_isbn = b.book_isbn
group by b.book_isbn
Having COUNT(r.review_id) >= 3 AND avg(r.review_score) > 4.5
;