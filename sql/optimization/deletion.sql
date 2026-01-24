ALTER TABLE operations.orders
ADD CONSTRAINT order_customer_deletion FOREIGN KEY (customer_id) REFERENCES  operations.customers(customer_id) ON DELETE SET NULL;
-- set the customer_id in orders table to NULL when a customer is deleted from the customers table 



ALTER TABLE inventory.stock
ADD CONSTRAINT stock_drug_deletion
FOREIGN KEY (drug_id) REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;
-- deletes the drug_id record in stock if the drug is deleted in the drugs table.




ALTER TABLE inventory.drugs
ADD CONSTRAINT fk_supplier_drug
FOREIGN KEY (drug_id)
REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;
