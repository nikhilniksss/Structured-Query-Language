CREATE TABLE returns (
    Order_Id VARCHAR(20) PRIMARY KEY,
    Return_Reason VARCHAR(50)
);

INSERT INTO returns (Order_Id, Return_Reason) VALUES
('US-2021-136679', 'Others'),
('US-2021-147886', 'Others'),
('US-2021-147998', 'Wrong Items'),
('US-2021-151127', 'Wrong Items'),
('US-2021-155999', 'Wrong Items');

SELECT * FROM returns;

-- Joins --

SELECT * FROM Orders
INNER JOIN returns 
ON Orders.Order_Id = returns.Order_ID;

