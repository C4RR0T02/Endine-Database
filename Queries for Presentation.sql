/* 1. Count the number of bookings, number of reservations and number of orders made by each passenger */
SELECT Passenger.PgrName, COUNT(Reservation.ReservID) AS 'No. of Reservations',COUNT(Orders.OrderQty) AS 'No. of orders' 
FROM Orders
INNER JOIN Passenger
ON Orders.PgrID = Passenger.PgrID
INNER JOIN Reservation
ON Reservation.PgrID = Passenger.PgrID
GROUP BY Passenger.PgrName

/* 2. Count the number of tickets booked for each event session of events (event for adults only) */
SELECT Event.EventName, EventSession.EventDateTime, SUM(Booking.NoOfAdultTicket) AS 'Number of Tickets'
FROM Event
INNER JOIN EventSession
ON Event.EventID = EventSession.EventID
INNER JOIN Booking
ON Booking.EventID = EventSession.EventID AND Booking.SessionNo = EventSession.SessionNo
WHERE Event.MinAge >= 13
GROUP BY EventSession.EventDateTime, Event.EventName

/* 3. Count the number of eateries for each type of cuisine */
SELECT Cuisine.CuisineName, COUNT(Eatery.EatyID) AS 'Number of Eateries'
FROM Cuisine
INNER JOIN Dish
ON Dish.CuisineID = Cuisine.CuisineID
INNER JOIN Eatery
ON Eatery.EatyID = Dish.EatyID
GROUP BY Cuisine.CuisineName
