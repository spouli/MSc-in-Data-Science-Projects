
CREATE SCHEMA schema_08
    AUTHORIZATION postgres;   
	


	CREATE TABLE schema_08.publishers_08
	(
		publisher_id integer NOT NULL,
		publisher_name VARCHAR(200) NOT NULL,
		address varchar(200),
		headquarters_country varchar(200),
		contact_phone  varchar(10),
		CHECK (length(contact_phone) <= 10),
		PRIMARY KEY (publisher_id)
	);

	CREATE TABLE schema_08.books_08
	(
		publisher_id integer NOT NULL,
		book_isbn varchar(10) NOT NULL,
		title VARCHAR(200) NOT NULL,
		publication_year smallint NOT NULL,
		price NUMERIC(2) NOT NULL,
		CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES schema_08.publishers_08(publisher_id),
		PRIMARY KEY (book_isbn),
		CHECK (price>=0)
	);


	CREATE TABLE schema_08.reviews_08
	(
		review_id VARCHAR(200) NOT NULL,
		nickname VARCHAR(200) NOT NULL,
		date_created timestamp(6) with time zone[] NOT NULL,
		review_score integer,
		book_isbn VARCHAR(10),
		description VARCHAR(10000),
		CONSTRAINT fk_review FOREIGN KEY (book_isbn) REFERENCES schema_08.books_08(book_isbn),
		PRIMARY KEY (review_id),
		CHECK (review_score>=1),
		CHECK (review_score<=5)
	);


	CREATE TABLE schema_08.authors_08
	(
		author_id VARCHAR(40) NOT NULL,
		nationality varchar(60),
		author_name varchar(60) NOT NULL,
		gender varchar(10), 
		PRIMARY KEY (author_id)
	);

	CREATE TABLE schema_08.booksAuthors_08
	(
			author_id VARCHAR(40) NOT NULL,
			book_isbn VARCHAR(10) NOT NULL,
			author_role VARCHAR(100) NOT NULL,
			CONSTRAINT fk_book FOREIGN KEY (book_isbn) REFERENCES schema_08.books_08(book_isbn),
			CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES schema_08.authors_08(author_id)

	);


