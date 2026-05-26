USE littlelemondb;

-- =====================================================
-- 1. STAFF
-- =====================================================

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Mario', 'Rossi', 'Manager', 65000.00, NULL);

SET @manager_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Anna', 'Smith', 'Head Waiter', 48000.00, @manager_id);

SET @staff_anna_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('John', 'Brown', 'Waiter', 42000.00, @staff_anna_id);

SET @staff_john_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Sophia', 'Davis', 'Chef', 52000.00, @manager_id);

SET @staff_sophia_id = LAST_INSERT_ID();


-- =====================================================
-- 2. CUSTOMERS
-- =====================================================

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Vanessa', 'McCarthy', '757536378', 'vanessa@example.com');

SET @customer_vanessa_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Marcos', 'Romero', '757536379', 'marcos@example.com');

SET @customer_marcos_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Hiroki', 'Yamane', '757536376', 'hiroki@example.com');

SET @customer_hiroki_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Diana', 'Pinto', '757536374', 'diana@example.com');

SET @customer_diana_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Marlon', 'Myers', '3476340000', 'marlon@example.com');

SET @customer_marlon_id = LAST_INSERT_ID();


-- =====================================================
-- 3. MENU
-- =====================================================

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Greek Menu', 'Greek');

SET @menu_greek_id = LAST_INSERT_ID();

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Italian Menu', 'Italian');

SET @menu_italian_id = LAST_INSERT_ID();

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Turkish Menu', 'Turkish');

SET @menu_turkish_id = LAST_INSERT_ID();

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Dessert Menu', 'Mixed');

SET @menu_dessert_id = LAST_INSERT_ID();


-- =====================================================
-- 4. MENU ITEMS
-- =====================================================

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_greek_id, 'Greek Salad', 'Starter', 12.00);

SET @item_greek_salad_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_greek_id, 'Lamb Gyro', 'Main Course', 18.00);

SET @item_lamb_gyro_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_italian_id, 'Margherita Pizza', 'Main Course', 16.00);

SET @item_pizza_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_italian_id, 'Pasta Alfredo', 'Main Course', 17.00);

SET @item_pasta_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_turkish_id, 'Chicken Kebab', 'Main Course', 19.00);

SET @item_kebab_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_turkish_id, 'Turkish Coffee', 'Drink', 6.00);

SET @item_coffee_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_dessert_id, 'Baklava', 'Dessert', 8.00);

SET @item_baklava_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_dessert_id, 'Cheesecake', 'Dessert', 9.00);

SET @item_cheesecake_id = LAST_INSERT_ID();


-- =====================================================
-- 5. BOOKINGS
-- =====================================================

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-24', 5, @staff_anna_id, @customer_vanessa_id);

SET @booking_1_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-24', 8, @staff_john_id, @customer_marcos_id);

SET @booking_2_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-25', 3, @staff_anna_id, @customer_hiroki_id);

SET @booking_3_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-25', 10, @staff_john_id, @customer_diana_id);

SET @booking_4_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-26', 12, @staff_anna_id, @customer_marlon_id);

SET @booking_5_id = LAST_INSERT_ID();


-- =====================================================
-- 6. ORDERS
-- =====================================================

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-24', 38.00, @booking_1_id);

SET @order_1_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-24', 28.00, @booking_2_id);

SET @order_2_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-25', 46.00, @booking_3_id);

SET @order_3_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-25', 26.00, @booking_4_id);

SET @order_4_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-26', 61.00, @booking_5_id);

SET @order_5_id = LAST_INSERT_ID();


-- =====================================================
-- 7. ORDER STATUS
-- =====================================================

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-24', 'Delivered', @order_1_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-24', 'Preparing', @order_2_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-25', 'Delivered', @order_3_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-25', 'Pending', @order_4_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-26', 'Out for Delivery', @order_5_id);


-- =====================================================
-- 8. ORDER ITEMS
-- =====================================================

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_1_id, @item_greek_salad_id, 1, 12.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_1_id, @item_lamb_gyro_id, 1, 18.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_1_id, @item_baklava_id, 1, 8.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_2_id, @item_pizza_id, 1, 16.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_2_id, @item_coffee_id, 2, 6.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_3_id, @item_kebab_id, 2, 19.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_3_id, @item_baklava_id, 1, 8.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_4_id, @item_pasta_id, 1, 17.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_4_id, @item_cheesecake_id, 1, 9.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_5_id, @item_lamb_gyro_id, 2, 18.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_5_id, @item_kebab_id, 1, 19.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_5_id, @item_coffee_id, 1, 6.00);



-- ========================== Next Section ========================================

USE littlelemondb;

-- =====================================================
-- 1. STAFF
-- =====================================================

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Elena', 'Martinez', 'Assistant Manager', 57000.00, NULL);

SET @manager_elena_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Omar', 'Hassan', 'Head Chef', 54000.00, @manager_elena_id);

SET @staff_omar_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Priya', 'Patel', 'Assistant Chef', 43000.00, @staff_omar_id);

SET @staff_priya_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Liam', 'Johnson', 'Waiter', 39000.00, @manager_elena_id);

SET @staff_liam_id = LAST_INSERT_ID();

INSERT INTO Staff (FirstName, LastName, Role, Salary, ManagerID)
VALUES ('Nora', 'Williams', 'Receptionist', 41000.00, @manager_elena_id);

SET @staff_nora_id = LAST_INSERT_ID();


-- =====================================================
-- 2. CUSTOMERS
-- =====================================================

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Aaliyah', 'Johnson', '7185551001', 'aaliyah@example.com');

SET @customer_aaliyah_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('David', 'Chen', '7185551002', 'davidchen@example.com');

SET @customer_david_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Fatima', 'Ali', '7185551003', 'fatima@example.com');

SET @customer_fatima_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Christopher', 'Green', '7185551004', 'chrisgreen@example.com');

SET @customer_chris_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Isabella', 'Lopez', '7185551005', 'isabella@example.com');

SET @customer_isabella_id = LAST_INSERT_ID();


-- =====================================================
-- 3. MENU
-- =====================================================

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Seafood Menu', 'Mediterranean');

SET @menu_seafood_id = LAST_INSERT_ID();

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Vegan Menu', 'Mediterranean');

SET @menu_vegan_id = LAST_INSERT_ID();

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Brunch Menu', 'Mixed');

SET @menu_brunch_id = LAST_INSERT_ID();


-- =====================================================
-- 4. MENU ITEMS
-- =====================================================

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_seafood_id, 'Grilled Salmon', 'Main Course', 24.00);

SET @item_salmon_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_seafood_id, 'Shrimp Skewers', 'Main Course', 22.00);

SET @item_shrimp_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_seafood_id, 'Lemon Herb Rice', 'Side', 7.00);

SET @item_rice_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_vegan_id, 'Stuffed Grape Leaves', 'Starter', 10.00);

SET @item_grape_leaves_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_vegan_id, 'Vegan Falafel Bowl', 'Main Course', 15.00);

SET @item_falafel_bowl_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_vegan_id, 'Lentil Soup', 'Starter', 9.00);

SET @item_lentil_soup_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_brunch_id, 'Mediterranean Omelette', 'Brunch', 14.00);

SET @item_omelette_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_brunch_id, 'Fresh Orange Juice', 'Drink', 5.00);

SET @item_orange_juice_id = LAST_INSERT_ID();


-- =====================================================
-- 5. BOOKINGS
-- =====================================================

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-27', 2, @staff_liam_id, @customer_aaliyah_id);

SET @booking_6_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-27', 4, @staff_nora_id, @customer_david_id);

SET @booking_7_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-28', 6, @staff_liam_id, @customer_fatima_id);

SET @booking_8_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-28', 9, @staff_nora_id, @customer_chris_id);

SET @booking_9_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-29', 11, @staff_liam_id, @customer_isabella_id);

SET @booking_10_id = LAST_INSERT_ID();


-- =====================================================
-- 6. ORDERS
-- =====================================================

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-27', 55.00, @booking_6_id);

SET @order_6_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-27', 45.00, @booking_7_id);

SET @order_7_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-28', 34.00, @booking_8_id);

SET @order_8_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-28', 50.00, @booking_9_id);

SET @order_9_id = LAST_INSERT_ID();

INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-29', 24.00, @booking_10_id);

SET @order_10_id = LAST_INSERT_ID();


-- =====================================================
-- 7. ORDER STATUS
-- =====================================================

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-27', 'Delivered', @order_6_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-27', 'Ready to serve', @order_7_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-28', 'Preparing', @order_8_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-28', 'Pending', @order_9_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-29', 'Ready to pay', @order_10_id);


-- =====================================================
-- 8. ORDER ITEMS
-- =====================================================

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_6_id, @item_salmon_id, 1, 24.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_6_id, @item_shrimp_id, 1, 22.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_6_id, @item_rice_id, 1, 7.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_6_id, @item_orange_juice_id, 1, 5.00);


-- Order 7 total = Falafel Bowl 15 x 2 + Grape Leaves 10 + Juice 5 = 45

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_7_id, @item_falafel_bowl_id, 2, 15.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_7_id, @item_grape_leaves_id, 1, 10.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_7_id, @item_orange_juice_id, 1, 5.00);


-- Order 8 total = Lentil Soup 9 + Falafel Bowl 15 + Juice 5 x 2 = 34

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_8_id, @item_lentil_soup_id, 1, 9.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_8_id, @item_falafel_bowl_id, 1, 15.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_8_id, @item_orange_juice_id, 2, 5.00);


-- Order 9 total = Salmon 24 + Omelette 14 + Rice 7 + Juice 5 = 50

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_9_id, @item_salmon_id, 1, 24.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_9_id, @item_omelette_id, 1, 14.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_9_id, @item_rice_id, 1, 7.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_9_id, @item_orange_juice_id, 1, 5.00);


-- Order 10 total = Omelette 14 + Grape Leaves 10 = 24

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_10_id, @item_omelette_id, 1, 14.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_10_id, @item_grape_leaves_id, 1, 10.00);

-- ====================================== 3rd Batch ============================

USE littlelemondb;

SELECT StaffID INTO @existing_staff_id
FROM Staff
ORDER BY StaffID
LIMIT 1;


-- =====================================================
-- 1. ADD NEW CUSTOMERS
-- =====================================================

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Kevin', 'Thomas', '7185552001', 'kevin@example.com');

SET @customer_kevin_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Rachel', 'Adams', '7185552002', 'rachel@example.com');

SET @customer_rachel_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Cell, Email)
VALUES ('Malik', 'Carter', '7185552003', 'malik@example.com');

SET @customer_malik_id = LAST_INSERT_ID();


-- =====================================================
-- 2. ADD A NEW MENU AND MENU ITEMS
-- =====================================================

INSERT INTO Menu (MenuName, Cuisine)
VALUES ('Family Specials Menu', 'Mediterranean');

SET @menu_family_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_family_id, 'Family Mezze Platter', 'Starter', 18.00);

SET @item_mezze_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_family_id, 'Chicken Shawarma Wrap', 'Main Course', 13.00);

SET @item_shawarma_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_family_id, 'Mint Lemonade', 'Drink', 4.00);

SET @item_lemonade_id = LAST_INSERT_ID();

INSERT INTO MenuItems (MenuID, ItemName, Category, Price)
VALUES (@menu_family_id, 'Rice Pudding', 'Dessert', 7.00);

SET @item_rice_pudding_id = LAST_INSERT_ID();


-- =====================================================
-- 3. ADD BOOKINGS
-- =====================================================

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-30', 7, @existing_staff_id, @customer_kevin_id);

SET @booking_11_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-30', 9, @existing_staff_id, @customer_rachel_id);

SET @booking_12_id = LAST_INSERT_ID();

INSERT INTO Bookings (BookingDate, TableNo, StaffID, CustomerID)
VALUES ('2026-05-31', 14, @existing_staff_id, @customer_malik_id);

SET @booking_13_id = LAST_INSERT_ID();


-- =====================================================
-- 4. ADD ORDERS
-- =====================================================

-- Order total: 3 Mezze Platters = 54, 4 Lemonades = 16, Total = 70
INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-30', 70.00, @booking_11_id);

SET @order_11_id = LAST_INSERT_ID();

-- Order total: 4 Shawarma Wraps = 52, 3 Rice Puddings = 21, Total = 73
INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-30', 73.00, @booking_12_id);

SET @order_12_id = LAST_INSERT_ID();

-- Order total: 3 Mezze Platters = 54, 5 Lemonades = 20, 4 Rice Puddings = 28, Total = 102
INSERT INTO Orders (OrderDate, TotalCost, BookingID)
VALUES ('2026-05-31', 102.00, @booking_13_id);

SET @order_13_id = LAST_INSERT_ID();


-- =====================================================
-- 5. ADD ORDER STATUS
-- =====================================================

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-30', 'Preparing', @order_11_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-30', 'Ready to serve', @order_12_id);

INSERT INTO OrderStatus (DeliveryDate, Status, OrderID)
VALUES ('2026-05-31', 'Pending', @order_13_id);


-- =====================================================
-- 6. ADD ORDER ITEMS WITH QUANTITY GREATER THAN 2
-- =====================================================

-- Order 11
INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_11_id, @item_mezze_id, 3, 18.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_11_id, @item_lemonade_id, 4, 4.00);


-- Order 12
INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_12_id, @item_shawarma_id, 4, 13.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_12_id, @item_rice_pudding_id, 3, 7.00);


-- Order 13
INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_13_id, @item_mezze_id, 3, 18.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_13_id, @item_lemonade_id, 5, 4.00);

INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice)
VALUES (@order_13_id, @item_rice_pudding_id, 4, 7.00);
