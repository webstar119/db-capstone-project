use littlelemondb;

-- ================================== Complete Ordering_Table View ====================================

select O.OrderID, O.OrderDate, O.TotalCost, 
B.BookingID, B.BookingDate, B.TableNo, 
S.StaffID, S.FirstName as "Staff FirstName", S.LastName as "Staff LastName", S.Role, S.Salary, S.ManagerID, 
C.CustomerID,C.FirstName, C.Lastname, C.Cell, C.Email, 
OS.StatusID, OS.DeliveryDate, OS.Status, 
OI.OrderItemID, OI.Quantity, OI.UnitPrice, 
MI.ItemID, MI.ItemName, MI.Category, MI.Price, 
M.MenuID, M.MenuName, M.Cuisine
from Orders as O
inner join Bookings as B
	on B.BookingID = O.BookingID
inner join Staff as S
	on S.StaffID = B.StaffID
inner join Customers as C
	on C.CustomerID = B.CustomerID
inner join OrderStatus as OS
	on OS.OrderID = O.OrderID
inner join OrderItems as OI
	on O.OrderID = OI.OrderID
inner join MenuItems as MI
	on MI.itemID = OI.ItemID
inner join Menu as M
	on M.MenuID = MI.MenuID; 


Create View Ordering_Table as select O.OrderID, O.OrderDate, O.TotalCost, 
B.BookingID, B.BookingDate, B.TableNo, 
S.StaffID, S.FirstName as "Staff FirstName", S.LastName as "Staff LastName", S.Role, S.Salary, S.ManagerID, 
C.CustomerID,C.FirstName, C.Lastname, C.Cell, C.Email, 
OS.StatusID, OS.DeliveryDate, OS.Status, 
OI.OrderItemID, OI.Quantity, OI.UnitPrice, 
MI.ItemID, MI.ItemName, MI.Category, MI.Price, 
M.MenuID, M.MenuName, M.Cuisine
from Orders as O
inner join Bookings as B
	on B.BookingID = O.BookingID
inner join Staff as S
	on S.StaffID = B.StaffID
inner join Customers as C
	on C.CustomerID = B.CustomerID
inner join OrderStatus as OS
	on OS.OrderID = O.OrderID
inner join OrderItems as OI
	on O.OrderID = OI.OrderID
inner join MenuItems as MI
	on MI.itemID = OI.ItemID
inner join Menu as M
	on M.MenuID = MI.MenuID; 

-- ================================== OrdersView Procedure ====================================

Select O.OrderID, OI.Quantity, O.TotalCost
from Orders as O
inner Join OrderItems as OI
on OI.OrderID = O.OrderID
where OI.Quantity > 2;

create view OrdersView as Select O.OrderID, OI.Quantity, O.TotalCost
from Orders as O
inner Join OrderItems as OI
on OI.OrderID = O.OrderID
where OI.Quantity > 2;

Select * from Ordersview;


-- ================================== addCustomer Procedure ====================================
Delimiter //
Create procedure addCustomer(
	IN P_FirstName Varchar(45), 
    IN P_LastName Varchar(45), 
    IN P_Cell Varchar(45), 
    IN P_Email Varchar(45))
Begin
	Insert into customers(FirstName, LastName, Cell, Email)
    Values (P_FirstName, P_LastName, P_Cell, P_Email);
End //
Delimiter ;

-- ================================== addBooking Procedure ====================================
Delimiter //
Create procedure addBooking(
	IN P_BookingDate DATE,
    IN P_TableNo INT,
    IN P_StaffID INT,
    IN P_CustomerID INT
)
Begin
	Insert into Bookings(BookingDate, TableNo, StaffID, CustomerID)
    Values (P_BookingDate, P_TableNo, P_StaffID, P_CustomerID);
End //
Delimiter ;

-- ================================== addStaff Procedure ====================================
Delimiter //

Create procedure addStaff(
	IN P_FirstName Varchar(45),
	IN P_LastName Varchar(45),
	IN P_Role Varchar(45),
	IN P_Salary decimal,
	IN P_ManagerID INT)
Begin
	Insert into Staff(FirstName, LastName, Role, Salary, ManagerID)
    Values (P_FirstName, P_LastName, P_Role, P_Salary, P_ManagerID);
End //

Delimiter ;

-- ================================== OrderView1 Procedure ====================================
Select * from orders;

select O.orderID, OI.Quantity, OI.UnitPrice, OI.OrderItemID
from Orders as O
join orderitems as OI
on OI.OrderID = O.OrderID;


select OI.orderID, count(orderID) as Quantity, Sum(OI.UnitPrice) as TotalPrice
from OrderItems as OI
group by OI.OrderID;

create view ordersview as select OI.orderID, count(orderID) as Quantity, Sum(OI.UnitPrice) as TotalPrice
from OrderItems as OI
group by OI.OrderID;


Select * from ordersview; -- view is for quantity above 2

select OI.orderID, count(orderID) as "Quantity", Sum(OI.UnitPrice) as "TotalPrice"
from OrderItems as OI
group by OI.OrderID
having Quantity > 2;

create view ordersview as select OI.orderID, count(orderID) as "Quantity", Sum(OI.UnitPrice) as "TotalPrice"
from OrderItems as OI
group by OI.OrderID
having Quantity > 2;

select * from ordering_table;

select * from OrderItems;

-- ================================== OrderView2 ====================================

select 
C.CustomerID, concat(C.FirstName, " ", C.LastName) as "Full_Name",
O.OrderID,
OI.UnitPrice,
M.MenuName,
MI.Category, MI.ItemName
from Orders as O
inner join Bookings as B
	on B.BookingID = O.BookingID
inner join Customers as C
	on C.CustomerID = B.CustomerID
inner join orderitems as OI
	on OI.OrderID = O.OrderID
inner join Menuitems as MI
	on MI.ItemID = OI.ItemID
inner join Menu as M
	on M.MenuID = MI.MenuID
order by Unitprice, Full_Name ASC;

create view OrdersView2 as select 
C.CustomerID, concat(C.FirstName, " ", C.LastName) as "Full_Name",
O.OrderID,
OI.UnitPrice,
M.MenuName,
MI.Category, MI.ItemName
from Orders as O
inner join Bookings as B
	on B.BookingID = O.BookingID
inner join Customers as C
	on C.CustomerID = B.CustomerID
inner join orderitems as OI
	on OI.OrderID = O.OrderID
inner join Menuitems as MI
	on MI.ItemID = OI.ItemID
inner join Menu as M
	on M.MenuID = MI.MenuID
order by Unitprice, Full_Name ASC;

Select * from ordersview2;

-- ================================== OrderView3 ====================================

SELECT MI.MenuID, MI.ItemName, OI.Quantity
FROM MenuItems AS MI
INNER JOIN OrderItems AS OI
    ON MI.ItemID = OI.ItemID
WHERE OI.Quantity > 2;


SELECT DISTINCT
    M.MenuName
FROM Menu AS M
WHERE M.MenuID = ANY (
    SELECT MI.MenuID
    FROM MenuItems AS MI
    INNER JOIN OrderItems AS OI
        ON MI.ItemID = OI.ItemID
    WHERE OI.Quantity > 2);
    
create view OrderView3 as 
SELECT DISTINCT
    M.MenuName
FROM Menu AS M
WHERE M.MenuID = ANY (
    SELECT MI.MenuID
    FROM MenuItems AS MI
    INNER JOIN OrderItems AS OI
        ON MI.ItemID = OI.ItemID
    WHERE OI.Quantity > 2);
    
Select * from orderview3;    
    
 -- ================================== MaxQuantity Procedure ====================================   
select max(Quantity) as "Maximum Quantity in Order" from OrderItems;

create procedure GetMaxQuantity()
select max(Quantity) as "Maximum Quantity in Order" from OrderItems;

call GetMaxQuantity();

-- ================================== Prepared Statement  ====================================
select O.OrderID, sum(OI.Quantity) as "Quantity", sum(OI.Unitprice) as "Cost"
from Orders as O
inner join Bookings as B
on B.BookingID = O.BookingID
inner join Customers as C
on C.CustomerID = B.CustomerID
inner join orderitems as OI
on OI.OrderID = O.OrderID
group by O.OrderID, C.CustomerID
having C.CustomerID = 1;


Prepare GetOrderDetails from
'select O.OrderID, sum(OI.Quantity) as "Quantity", sum(OI.Unitprice) as "Cost"
from Orders as O
inner join Bookings as B
on B.BookingID = O.BookingID
inner join Customers as C
on C.CustomerID = B.CustomerID
inner join orderitems as OI
on OI.OrderID = O.OrderID
group by O.OrderID, C.CustomerID
having C.CustomerID = ?';


set @ID = 1;
execute GetOrderDetails using @ID;



DROP PROCEDURE IF EXISTS CancelOrder;

-- ================================== CancelOrder Procedure ====================================

DELIMITER //
CREATE PROCEDURE CancelOrder(IN P_OrderID INT)
BEGIN
    
	DELETE FROM OrderItems
    WHERE OrderID = P_OrderID;
    
    DELETE FROM OrderStatus
    WHERE OrderID = P_OrderID;
    
	DELETE FROM Orders
    WHERE OrderID = P_OrderID;

    SELECT CONCAT('Order ', P_OrderID, ' is cancelled') AS Confirmation;
END //
DELIMITER ;

-- call CancelOrder(5);

Call addBooking('2022-10-10', 4, 5, 1);
Call addBooking('2022-11-12', 3, 3, 3);
Call addBooking('2022-10-11', 2, 9, 2);
Call addBooking('2022-10-13', 2, 9, 1);


select * from bookings;
select * from staff;

Select Concat("Table ", TableNo, " is already booked") as "BookingStatus"
from Bookings
where TableNo = 3 and BookingDate = '2026-05-25';

Delimiter //
create procedure CheckBooking(IN P_Date DATE, IN P_TableNo INT)
Begin
	Select Concat("Table ", TableNo, " is already booked") as "BookingStatus"
	from Bookings
	where TableNo = P_TableNo and BookingDate = P_Date;
End //
Delimiter ;
-- drop procedure if exists checkBooking;

call Checkbooking('2026-09-25', 3);



USE littlelemondb;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN p_booking_date DATE, IN p_table_no INT)
BEGIN
    DECLARE booking_count INT DEFAULT 0;
    START TRANSACTION;

    INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
    VALUES (p_booking_date, p_table_no, 9, 1);

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = p_booking_date AND TableNo = p_table_no;

    IF booking_count > 1 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', p_table_no, ' is already booked - booking cancelled') 
        AS 'Booking status';
    ELSE
        COMMIT;
        SELECT CONCAT('Table ', p_table_no, ' is available - booking confirmed') 
        AS 'Booking status';
    END IF;
END //
DELIMITER ;

call AddValidBooking('2026-09-25', 3);


drop procedure if exists addBooking;
Delimiter //
Create procedure addBooking(
	IN P_TableNo INT,
    IN P_StaffID INT,
    IN P_CustomerID INT,
    IN P_BookingDate DATE
)
Begin
	Insert into Bookings(TableNo, StaffID, CustomerID,BookingDate)
    Values (P_TableNo, P_StaffID, P_CustomerID,P_BookingDate);
    Select Concat("New Booking added") as Confirmation;
End //
Delimiter ;

call addBooking(6,9,4,'2026-02-20');
select * from Bookings;

drop procedure if exists UpdateBooking;

Delimiter //
Create Procedure UpdateBooking(
	IN P_BookingID INT, 
	IN P_BookingDate Date)
Begin
	Update Bookings 
    set BookingDate = P_BookingDate
	where BookingID = P_BookingID;
    Select concat('Booking ', BookingID, ' updated') as 'Confirmation'
    from Bookings
    where BookingID = P_BookingID;
End //
Delimiter ;

call UpdateBooking(20,'2026-02-19');
select * from Bookings;


drop procedure if exists CancelBooking;

Delimiter //
create procedure CancelBooking(IN P_BookingID INT)
Begin
	Select concat('Booking ',BookingID, ' cancelled') as 'Confirmation'
    from Bookings
    where BookingID = P_BookingID;
    
	Delete from Bookings
    where BookingID = P_BookingID;
    
End //
Delimiter ;

call CancelBooking(21);

