--inventory CONSTRAINTS
ALTER TABLE inventory.drugs
ADD CONSTRAINT check_positive_price  CHECK (price > 0);
-- check the price of each drugs recorded into the database

ALTER TABLE inventory.stock
ADD CONSTRAINT check_nonnegative_quantity CHECK (qquantity >= 0)

-- ordera constraints
ALTER TABLE operations.orders
ADD CONSTRAINTS check_total_amount CHECK (total_amount >= 0)

