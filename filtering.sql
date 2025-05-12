WHERE (first_name = 'STEVEN' OR last_name = 'YOUNG')
  AND create_date > '2006-01-01'

WHERE NOT (first_name = 'STEVEN' OR last_name = 'YOUNG')
  AND create_date > '2006-01-01'

// rewrite the where clause to avoid using the not operator:

WHERE first_name <> 'STEVEN' AND last_name <> 'YOUNG'
  AND create_date > '2006-01-01'

mysql> SELECT c.email
    -> FROM customer c
    ->   INNER JOIN rental r
    ->   ON c.customer_id = r.customer_id
    -> WHERE date(r.rental_date) = '2005-06-14';
+---------------------------------------+
| email                                 |
+---------------------------------------+
| CATHERINE.CAMPBELL@sakilacustomer.org |
| JOYCE.EDWARDS@sakilacustomer.org      |
| AMBER.DIXON@sakilacustomer.org        |
| JEANETTE.GREENE@sakilacustomer.org    |
| MINNIE.ROMERO@sakilacustomer.org      |
| GWENDOLYN.MAY@sakilacustomer.org      |
| SONIA.GREGORY@sakilacustomer.org      |
| MIRIAM.MCKINNEY@sakilacustomer.org    |
| CHARLES.KOWALSKI@sakilacustomer.org   |
| DANIEL.CABRAL@sakilacustomer.org      |
| MATTHEW.MAHAN@sakilacustomer.org      |
| JEFFERY.PINSON@sakilacustomer.org     |
| HERMAN.DEVORE@sakilacustomer.org      |
| ELMER.NOE@sakilacustomer.org          |
| TERRANCE.ROUSH@sakilacustomer.org     |
| TERRENCE.GUNDERSON@sakilacustomer.org |
+---------------------------------------+
16 rows in set (0.03 sec)

mysql> SELECT c.email
    -> FROM customer c
    ->   INNER JOIN rental r
    ->   ON c.customer_id = r.customer_id
    -> WHERE date(r.rental_date) <> '2005-06-14';

+-----------------------------------+
| email                             |
+-----------------------------------+
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
| MARY.SMITH@sakilacustomer.org     |
...
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
| AUSTIN.CINTRON@sakilacustomer.org |
+-----------------------------------+
16028 rows in set (0.03 sec)

DELETE FROM rental
WHERE year(rental_date) = 2004;

DELETE FROM rental
WHERE year(rental_date) <> 2005 AND year(rental_date) <> 2006;

mysql> SELECT customer_id, rental_date
    -> FROM rental
    -> WHERE rental_date < '2005-05-25';
+-------------+---------------------+
| customer_id | rental_date         |
+-------------+---------------------+
|         130 | 2005-05-24 22:53:30 |
|         459 | 2005-05-24 22:54:33 |
|         408 | 2005-05-24 23:03:39 |
|         333 | 2005-05-24 23:04:41 |
|         222 | 2005-05-24 23:05:21 |
|         549 | 2005-05-24 23:08:07 |
|         269 | 2005-05-24 23:11:53 |
|         239 | 2005-05-24 23:31:46 |
+-------------+---------------------+
8 rows in set (0.00 sec)

mysql> SELECT customer_id, rental_date
    -> FROM rental
    -> WHERE rental_date <= '2005-06-16'
    ->   AND rental_date >= '2005-06-14';
+-------------+---------------------+
| customer_id | rental_date         |
+-------------+---------------------+
|         416 | 2005-06-14 22:53:33 |
|         516 | 2005-06-14 22:55:13 |
|         239 | 2005-06-14 23:00:34 |
|         285 | 2005-06-14 23:07:08 |
|         310 | 2005-06-14 23:09:38 |
|         592 | 2005-06-14 23:12:46 |
...
|         148 | 2005-06-15 23:20:26 |
|         237 | 2005-06-15 23:36:37 |
|         155 | 2005-06-15 23:55:27 |
|         341 | 2005-06-15 23:57:20 |
|         149 | 2005-06-15 23:58:53 |
+-------------+---------------------+
364 rows in set (0.00 sec)

mysql> SELECT customer_id, rental_date
    -> FROM rental
    -> WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';
+-------------+---------------------+
| customer_id | rental_date         |
+-------------+---------------------+
|         416 | 2005-06-14 22:53:33 |
|         516 | 2005-06-14 22:55:13 |
|         239 | 2005-06-14 23:00:34 |
|         285 | 2005-06-14 23:07:08 |
|         310 | 2005-06-14 23:09:38 |
|         592 | 2005-06-14 23:12:46 |
...
|         148 | 2005-06-15 23:20:26 |
|         237 | 2005-06-15 23:36:37 |
|         155 | 2005-06-15 23:55:27 |
|         341 | 2005-06-15 23:57:20 |
|         149 | 2005-06-15 23:58:53 |
+-------------+---------------------+
364 rows in set (0.00 sec)

mysql> SELECT customer_id, rental_date
    -> FROM rental
    -> WHERE rental_date BETWEEN '2005-06-16' AND '2005-06-14';
Empty set (0.00 sec)

SELECT customer_id, rental_date
    -> FROM rental
    -> WHERE rental_date >= '2005-06-16' 
    ->   AND rental_date <= '2005-06-14';
Empty set (0.00 sec)

mysql> SELECT customer_id, payment_date, amount
    -> FROM payment
    -> WHERE amount BETWEEN 10.0 AND 11.99;
+-------------+---------------------+--------+
| customer_id | payment_date        | amount |
+-------------+---------------------+--------+
|           2 | 2005-07-30 13:47:43 |  10.99 |
|           3 | 2005-07-27 20:23:12 |  10.99 |
|          12 | 2005-08-01 06:50:26 |  10.99 |
|          13 | 2005-07-29 22:37:41 |  11.99 |
|          21 | 2005-06-21 01:04:35 |  10.99 |
|          29 | 2005-07-09 21:55:19 |  10.99 |
...
|         571 | 2005-06-20 08:15:27 |  10.99 |
|         572 | 2005-06-17 04:05:12 |  10.99 |
|         573 | 2005-07-31 12:14:19 |  10.99 |
|         591 | 2005-07-07 20:45:51 |  11.99 |
|         592 | 2005-07-06 22:58:31 |  11.99 |
|         595 | 2005-07-31 11:51:46 |  10.99 |
+-------------+---------------------+--------+
114 rows in set (0.01 sec)

mysql> SELECT title, rating
    -> FROM film
    -> WHERE rating = 'G' OR rating = 'PG';

SELECT title, rating
FROM film
WHERE rating IN ('G','PG');

mysql> SELECT title, rating
    -> FROM film
    -> WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%');
+---------------------------+--------+
| title                     | rating |
+---------------------------+--------+
| ACADEMY DINOSAUR          | PG     |
| ACE GOLDFINGER            | G      |
| AFFAIR PREJUDICE          | G      |
| AFRICAN EGG               | G      |
| AGENT TRUMAN              | PG     |
| ALAMO VIDEOTAPE           | G      |
| ALASKA PHANTOM            | PG     |
| ALI FOREVER               | PG     |
| AMADEUS HOLY              | PG     |
...
| WEDDING APOLLO            | PG     |
| WEREWOLF LOLA             | G      |
| WEST LION                 | G      |
| WIZARD COLDBLOODED        | PG     |
| WON DARES                 | PG     |
| WONDERLAND CHRISTMAS      | PG     |
| WORDS HUNTER              | PG     |
| WORST BANGER              | PG     |
| YOUNG LANGUAGE            | G      |
+---------------------------+--------+
372 rows in set (0.00 sec)

SELECT title, rating
FROM film
WHERE rating NOT IN ('PG-13','R', 'NC-17');

/*

Wildcard character	Matches
_

Exactly one character

%

Any number of characters (including 0)

*/

mysql> SELECT last_name, first_name
    -> FROM customer
    -> WHERE last_name LIKE '_A_T%S';
+-----------+------------+
| last_name | first_name |
+-----------+------------+
| MATTHEWS  | ERICA      |
| WALTERS   | CASSANDRA  |
| WATTS     | SHELLY     |
+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT last_name, first_name
    -> FROM customer
    -> WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';
+-------------+------------+
| last_name   | first_name |
+-------------+------------+
| QUALLS      | STEPHEN    |
| QUIGLEY     | TROY       |
| QUINTANILLA | ROGER      |
| YANEZ       | LUIS       |
| YEE         | MARVIN     |
| YOUNG       | CYNTHIA    |
+-------------+------------+
6 rows in set (0.00 sec)

// Null: That Four-Letter Word

/*

Not applicable
Such as the employee ID column for a transaction that took place at an ATM machine

Value not yet known
Such as when the federal ID is not known at the time a customer row is created

Value undefined
Such as when an account is created for a product that has not yet been added to the database

*/

mysql> SELECT rental_id, customer_id
    -> FROM rental
    -> WHERE return_date IS NULL;
+-----------+-------------+
| rental_id | customer_id |
+-----------+-------------+
|     11496 |         155 |
|     11541 |         335 |
|     11563 |          83 |
|     11577 |         219 |
|     11593 |          99 |
...
|     15867 |         505 |
|     15875 |          41 |
|     15894 |         168 |
|     15966 |         374 |
+-----------+-------------+
183 rows in set (0.01 sec)

mysql> SELECT rental_id, customer_id
    -> FROM rental
    -> WHERE return_date = NULL;
Empty set (0.01 sec)

mysql> SELECT rental_id, customer_id, return_date
    -> FROM rental
    -> WHERE return_date IS NOT NULL;
+-----------+-------------+---------------------+
| rental_id | customer_id | return_date         |
+-----------+-------------+---------------------+
|         1 |         130 | 2005-05-26 22:04:30 |
|         2 |         459 | 2005-05-28 19:40:33 |
|         3 |         408 | 2005-06-01 22:12:39 |
|         4 |         333 | 2005-06-03 01:43:41 |
|         5 |         222 | 2005-06-02 04:33:21 |
|         6 |         549 | 2005-05-27 01:32:07 |
|         7 |         269 | 2005-05-29 20:34:53 |
...
|     16043 |         526 | 2005-08-31 03:09:03 |
|     16044 |         468 | 2005-08-25 04:08:39 |
|     16045 |          14 | 2005-08-25 23:54:26 |
|     16046 |          74 | 2005-08-27 18:02:47 |
|     16047 |         114 | 2005-08-25 02:48:48 |
|     16048 |         103 | 2005-08-31 21:33:07 |
|     16049 |         393 | 2005-08-30 01:01:12 |
+-----------+-------------+---------------------+
15861 rows in set (0.02 sec)

mysql> SELECT rental_id, customer_id, return_date
    -> FROM rental
    -> WHERE return_date IS NULL
    ->   OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';
+-----------+-------------+---------------------+
| rental_id | customer_id | return_date         |
+-----------+-------------+---------------------+
|     11496 |         155 | NULL                |
|     11541 |         335 | NULL                |
|     11563 |          83 | NULL                |
|     11577 |         219 | NULL                |
|     11593 |          99 | NULL                |
...
|     15939 |         382 | 2005-09-01 17:25:21 |
|     15942 |         210 | 2005-09-01 18:39:40 |
|     15966 |         374 | NULL                |
|     15971 |         187 | 2005-09-02 01:28:33 |
|     15973 |         343 | 2005-09-01 20:08:41 |
|     15977 |         550 | 2005-09-01 22:12:10 |
|     15982 |         370 | 2005-09-01 21:51:31 |
|     16005 |         466 | 2005-09-02 02:35:22 |
|     16020 |         311 | 2005-09-01 18:17:33 |
|     16033 |         226 | 2005-09-01 02:36:15 |
|     16037 |          45 | 2005-09-01 02:48:04 |
|     16040 |         195 | 2005-09-02 02:19:33 |
+-----------+-------------+---------------------+
245 rows in set (0.01 sec)