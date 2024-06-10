/* List the popularity of the eateries in descending order by the amount of food ordered by the passengers */

Select e.EatyName ,Count(OrderQty) as 'Amt of Food Ordered'
From Eatery e inner join Dish d on e.EatyID = d.EatyID
inner join Orders o on d.DishID = o.DishID
Group By e.EatyName
Order By 'Amt of Food Ordered' desc



/* List the popularity of the event type for adult passengers in descending order */

Select et.ETName , Count(NoOfAdultTicket) as 'Amt of Adult bookings'
From EventType et inner join Event e on et.ETID =e.ETID
inner join EventSession es on e.EventID = es.EventID
inner join Booking b on e.EventID = es.EventID 
Group By ETName
Order by Count(NoOfAdultTicket) desc


/* List the dishes that has the least amount of orders */

Select DishName , Sum(OrderQty) as 'Number of orders'
From Dish d inner join CSDish cs on d.DishID = cs.DishID
inner join Orders o on o.DishID = d.DishID
group by dishName
having sum(OrderQty)=1
order by SUm(OrderQty) asc
