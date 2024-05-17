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

-- 5. Produce a list of all facilities with the word 'Tennis' in their name.
-- Expected Result: 3 rows

-- 6. Retrieve the details of facilities with ID 1 and 5 without using the OR operator.
-- Expected Result: 2 rows

-- 7. Produce a list of members who joined after the start of September 2012.
-- Return the memid, surname, firstname, and joindate.
-- Expected Result: 10 rows

-- 8. Produce an ordered list of the first 10 surnames in the members table, without duplicates.
-- Expected Result: 10 rows (including GUEST as a last name)

-- 9. Retrieve the signup date of the last member.
-- Expected Result: 2012-09-26 18:08:45

-- 10. Produce a count of the number of facilities that have a cost to guests of 10 or more.
-- Expected Result: 6

-- 11. Produce a list of the total number of slots booked per facility in September 2012.
-- Return facility id and slots, sorted by the number of slots.
-- Expected Result: 9 rows

-- 12. Produce a list of facilities with more than 1000 slots booked.
-- Return facility id and total slots, sorted by facility id.
-- Expected Result: 5 rows

-- 13. Produce a list of the start times for bookings for tennis courts on '2012-09-21'.
-- Return start time and facility name, ordered by time.
-- Expected Result: 12 rows

-- 14. Produce a list of the start times for bookings by members named 'David Farrell'.
-- Expected Result: 34 rows
