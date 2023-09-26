-- Soal 1
CREATE DATABASE books_store;

CREATE TABLE books (
    Id_Buku INT NOT NULL AUTO_INCREMENT,
    Judul_Buku VARCHAR(100),
    Pengarang VARCHAR(100),
    Tahun_Terbit INT,
    Penerbit VARCHAR(100),
    Tanggal_Dibuat DATE DEFAULT CURRENT_DATE, 
    Tanggal_Diupdate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (Id_Buku) 
)

CREATE TABLE category (
    Id_Category INT NOT NULL AUTO_INCREMENT,
    Nama_Category VARCHAR(100),
    Tanggal_Dibuat DATE DEFAULT CURRENT_DATE, 
    Tanggal_Diupdate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (Id_Category) 
)

-- Soal 2
INSERT INTO books (Judul_Buku, Pengarang, Tahun_Terbit, Penerbit)
VALUES ("Building Microservices", "Sam Newman", 2014, "O'Reilly Media"), 
    ("Clean Code", "Robert C. Martin", 2008, "Prentice Hall"),
    ("The Pragmatic Programmer", "Andrew Hunt", 1999, "Addison-Wesley"),
    ("Design Patterns", "Erich Gamma", 1994, "Addison-Wesley"),
    ("Introduction to Algorithms", "Thomas H. Cormen", 1990, "MIT Press"),
    ("The Art of Computer Prog.", "Donald E. Knuth", 1968, "Addison-Wesley"),
    ("Clean Architecture", "Robert C. Martin", 2017, "Prentice Hall"),
    ("Refactoring", "Martin Fowler", 1999, "Addison-Wesley"),
    ("Domain-Driven Design", "Eric Evans", 2003, "Addison-Wesley"),
    ("The Mythical Man-Month", "Frederick Brooks", 1975, "Addison-Wesley")

INSERT INTO category (Nama_Category)
VALUES ("Pemograman"), ("Fiksi"), ("Nonfiksi"), ("Bisnis"), ("Teknologi"), ("Seni"), ("Sejarah"), ("Sains"), ("Hukum"), ("Kesehatan")

-- Soal 3
SELECT * FROM books;

SELECT * FROM category;

-- Soal 4
UPDATE books
SET Judul_Buku = "Building Microservices: Designing Fine-Grained Systems 1st", Tahun_Terbit = 2015, Tanggal_Diupdate = "2023-09-20"
WHERE Id_Buku = 1;

-- Soal 5
DELETE FROM books
WHERE Id_Buku=10;

DELETE FROM category
WHERE Id_Category=10;

-- Soal 6
SELECT judul_buku, Penerbit FROM books
where Penerbit="Addison-Wesley";

SELECT * FROM books
WHERE Tahun_Terbit BETWEEN 2003 AND 2023;

SELECT * FROM books 
WHERE Judul_Buku LIKE "%design%";

-- Soal 7
CREATE TABLE book_categories (
    Id INT NOT NULL AUTO_INCREMENT,
    Id_Category INT NOT NULL,
    Id_Book INT NOT NULL,
    Tanggal_Dibuat DATE DEFAULT CURRENT_DATE,
    Tanggal_Diupdate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (Id),
    FOREIGN KEY (Id_Category) REFERENCES category(Id_Category),
  	FOREIGN KEY (Id_Book) REFERENCES books(Id_Buku)
)

-- Soal 8
INSERT INTO book_categories (Id_Category, Id_Book)
VALUES (1, 2), (5, 3), (1, 1)

-- Soal 9
SELECT books.Id_Buku AS id, books.Judul_Buku, category.Nama_Category
FROM books
INNER JOIN category ON books.Id_Buku = category.Id_Category;

-- Soal 10
ALTER TABLE books ADD COLUMN jumlah_halaman INT;