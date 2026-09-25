-- =========================================================
-- MUSIC STORE SQL ANALYSIS PROJECT
-- =========================================================

-- CREATE DATABASE music_store;
USE music_store;


-- =========================================================
-- Q.1 Who is the senior most employee based on job title?
-- =========================================================

SELECT 
    *
FROM employee
ORDER BY levels DESC
LIMIT 1;


-- =========================================================
-- Q.2 Which countries have the most invoices?
-- =========================================================

SELECT 
    billing_country,
    COUNT(*) AS total_invoices
FROM invoice
GROUP BY billing_country
ORDER BY total_invoices DESC;


-- =========================================================
-- Q.3 What are the top 3 values of total invoices?
-- =========================================================

SELECT 
    ROUND(total, 2) AS top_3_invoices
FROM invoice
ORDER BY total DESC
LIMIT 3;


-- =========================================================
-- Q.4 Which city has the best customers?
-- Find the city where we made the most money.
-- =========================================================

SELECT 
    billing_city,
    ROUND(SUM(total), 2) AS total_invoices
FROM invoice
GROUP BY billing_city
ORDER BY total_invoices DESC
LIMIT 1;


-- =========================================================
-- Q.5 Who is the best customer?
-- The customer who has spent the most money.
-- =========================================================

SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    ROUND(SUM(invoice.total), 2) AS total_spent
FROM customer
JOIN invoice 
    ON invoice.customer_id = customer.customer_id
GROUP BY 
    customer.customer_id,
    customer.first_name,
    customer.last_name
ORDER BY total_spent DESC
LIMIT 1;


-- =========================================================
-- Q.6 Return the email, first name and last name
-- of all ROCK Music listeners.
-- Order alphabetically by email.
-- =========================================================

SELECT DISTINCT
    customer.email,
    customer.first_name,
    customer.last_name
FROM customer
JOIN invoice 
    ON customer.customer_id = invoice.customer_id
JOIN invoice_line 
    ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
    SELECT track_id
    FROM track
    JOIN genre 
        ON track.genre_id = genre.genre_id
    WHERE genre.name LIKE 'Rock'
)
ORDER BY customer.email;


-- =========================================================
-- Q.7 Find the top 10 artists who have written
-- the most Rock music songs.
-- =========================================================

SELECT 
    artist.artist_id,
    artist.name,
    COUNT(track.track_id) AS num_of_songs
FROM track
JOIN album 
    ON album.album_id = track.album_id
JOIN artist 
    ON artist.artist_id = album.artist_id
JOIN genre 
    ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY 
    artist.artist_id,
    artist.name
ORDER BY num_of_songs DESC
LIMIT 10;


-- =========================================================
-- Q.8 Return all track names that have a song length
-- longer than the average song length.
-- Order by longest songs first.
-- =========================================================

SELECT 
    name,
    milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds)
    FROM track
)
ORDER BY milliseconds DESC;


-- =========================================================
-- Q.9 Find how much amount was spent by each customer
-- on each artist.
-- Return customer name, artist name and total spent.
-- =========================================================

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    ar.name AS artist_name,
    ROUND(SUM(il.unit_price * il.quantity), 2) AS amount_spent
FROM invoice i
JOIN customer c 
    ON c.customer_id = i.customer_id
JOIN invoice_line il 
    ON il.invoice_id = i.invoice_id
JOIN track t 
    ON t.track_id = il.track_id
JOIN album alb 
    ON alb.album_id = t.album_id
JOIN artist ar 
    ON ar.artist_id = alb.artist_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name,
    ar.artist_id,
    ar.name
ORDER BY amount_spent DESC;


-- =========================================================
-- Q.10 Find the most popular music Genre for each country.
-- The most popular genre is the genre with the highest
-- amount of purchases.
-- =========================================================

WITH popular_genre AS (
    SELECT
        customer.country,
        genre.name AS genre_name,
        genre.genre_id,
        SUM(invoice_line.quantity) AS purchases,
        ROW_NUMBER() OVER (
            PARTITION BY customer.country
            ORDER BY SUM(invoice_line.quantity) DESC
        ) AS RowNo
    FROM invoice_line
    JOIN invoice
        ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer
        ON customer.customer_id = invoice.customer_id
    JOIN track
        ON track.track_id = invoice_line.track_id
    JOIN genre
        ON genre.genre_id = track.genre_id
    GROUP BY
        customer.country,
        genre.name,
        genre.genre_id
)

SELECT
    country,
    genre_name,
    purchases
FROM popular_genre
WHERE RowNo = 1
ORDER BY country;