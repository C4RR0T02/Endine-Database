/* List the passengers name and number of times ordered Vegetarian meals in 
ascending order from the most number of orders to the least number of orders */

SELECT Passenger.PgrName, SUM(Orders.OrderQty) AS 'Number of times ordered Vegetarian'
FROM Passenger 
INNER JOIN Orders 
ON Passenger.PgrID = Orders.PgrID 
INNER JOIN Categorised_in
ON Categorised_in.DishID = Orders.DishID
INNER JOIN FoodCategory
ON Categorised_in.FcID = FoodCategory.FcID
WHERE FoodCategory.FcName = 'Vegetarian'
GROUP BY Passenger.PgrName
ORDER BY SUM(Orders.OrderQty) DESC, Passenger.PgrName ASC


/* List the number of children tickets purchased for the different event ordered by the popularity of booking. */

SELECT Event.EventName, SUM(Booking.NoOfChildTicket) AS 'Sum of children ticket purchased'
FROM Booking
INNER JOIN EventSession
ON Booking.EventID = EventSession.EventID AND Booking.SessionNo = EventSession.SessionNo
INNER JOIN Event
ON Booking.EventID = Event.EventID
WHERE Booking.NoOfChildTicket IN (SELECT NoOfChildTicket FROM Booking WHERE NoOfChildTicket >= 1)
GROUP BY Event.EventName
ORDER BY SUM(Booking.NoOfChildTicket) DESC, Event.EventName ASC

/* List the dishes in each eatery with at least 5 orders. */

SELECT Eatery.EatyName, Dish.DishName, SUM(Orders.OrderQty) AS 'Number of Orders'
FROM Orders
INNER JOIN Dish
ON Orders.DishID = Dish.DishID
INNER JOIN Eatery
ON Dish.EatyID = Eatery.EatyID
GROUP BY Dish.DishName, Eatery.EatyName
HAVING SUM(Orders.OrderQty) >= 5
ORDER BY Eatery.EatyName ASC, SUM(Orders.OrderQty) DESC, Dish.DishName ASC
