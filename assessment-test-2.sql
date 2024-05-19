-- 1. Retrieve all the information from the cd.facilities table.
-- Expected Result: (Full table content)
SELECT * FROM cd.facilities;

-- 2. Print out a list of all the facilities and their cost to members.
-- Expected Result: (Facility names and costs)
SELECT name, membercost FROM cd.facilities;

-- 3. Produce a list of facilities that charge a fee to members.
-- Expected Result: 5 rows
SELECT name,membercost FROM cd.facilities
WHERE membercost > 0;

-- 4. Produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost.
-- Return the facid, facility name, member cost, and monthly maintenance.
-- Expected Result: 2 rows
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost < monthlymaintenance/50 AND membercost > 0;

-- 5. Produce a list of all facilities with the word 'Tennis' in their name.
-- Expected Result: 3 rows
SELECT * FROM cd.facilities
WHERE name ILIKE'%tennis%';

-- 6. Retrieve the details of facilities with ID 1 and 5 without using the OR operator.
-- Expected Result: 2 rows
SELECT * FROM cd.facilities
WHERE facid IN(1,5);

-- 7. Produce a list of members who joined after the start of September 2012.
-- Return the memid, surname, firstname, and joindate.
-- Expected Result: 10 rows
SELECT memid,surname,firstname,joindate FROM cd.members
WHERE joindate > '2012-09-01';

-- 8. Produce an ordered list of the first 10 surnames in the members table, without duplicates.
-- Expected Result: 10 rows (including GUEST as a last name)
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

-- 9. Retrieve the signup date of the last member.
-- Expected Result: 2012-09-26 18:08:45
SELECT DISTINCT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
--OR
SELECT MAX(joindate) AS latest_signup FROM cd.members;

-- 10. Produce a count of the number of facilities that have a cost to guests of 10 or more.
-- Expected Result: 6
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;

-- 11. Produce a list of the total number of slots booked per facility in September 2012.
-- Return facility id and slots, sorted by the number of slots.
-- Expected Result: 9 rows
SELECT f.facid, SUM(b.slots) FROM cd.facilities f
INNER JOIN cd.bookings b
ON f.facid = b.facid
WHERE EXTRACT(month FROM starttime) = 9 AND EXTRACT(year FROM starttime) = 2012
GROUP BY f.facid
ORDER BY SUM(b.slots);

-- 12. Produce a list of facilities with more than 1000 slots booked.
-- Return facility id and total slots, sorted by facility id.
-- Expected Result: 5 rows
SELECT fac.facid,SUM(slots) as total_slots FROM cd.facilities as fac
INNER JOIN cd.bookings as book
ON fac.facid = book.facid
GROUP BY fac.facid
HAVING SUM(slots) > 1000
ORDER BY fac.facid;

-- 13. Produce a list of the start times for bookings for tennis courts on '2012-09-21'.
-- Return start time and facility name, ordered by time.
-- Expected Result: 12 rows
SELECT book.starttime, name FROM cd.facilities as facil
INNER JOIN cd.bookings as book
ON facil.facid = book.facid
WHERE to_char(book.starttime,'YYYY-MM-DD') = '2012-09-21' AND name ILIKE'%Tennis Court%'
ORDER BY book.starttime ASC;

-- 14. Produce a list of the start times for bookings by members named 'David Farrell'.
-- Expected Result: 34 rows
SELECT book.starttime,firstname||'-'||surname as full_name 
FROM cd.bookings as book
INNER JOIN cd.members as mem
ON book.memid = mem.memid
WHERE firstname ILIKE'david' AND surname ILIKE'farrell';

--https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit
--https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit
