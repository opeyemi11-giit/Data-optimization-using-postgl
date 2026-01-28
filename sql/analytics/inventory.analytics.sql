-- Supply Chain Risk Monitor
CREATE VIEW analytics.supply_chain_risk AS
SELECT stock.drug_id, 
	drugs."name" AS drug_name, 
	stock.quantity AS current_stock,
	CASE
		WHEN stock.quantity <= 100 THEN 'CRITICAL: Stock out'
		WHEN stock.quantity <=500 THEN 'WARNING: Low Stock'
		ELSE 'Good Stock'
	END AS risk_status,
	suppliers.name AS supplier_name,
	suppliers.contact_email AS supplier_contact_email		
FROM inventory.stock
LEFT JOIN inventory.drugs ON drugs.drug_id = stock.drug_id
LEFT JOIN inventory.suppliers ON suppliers.drug_id = suppliers.drug_id
WHERE stock.quantity <= 1000;

SELECT * FROM analytics.supply_chain_risk;





-- 2. supllier value report.

CREATE OR REPLACE VIEW analytics.supplier_value_report AS
SELECT
    s.name AS supplier_name,                                
    SUM(o.total_amount) AS total_revenue,                   
    COUNT(o.order_id) AS order_volume,                      
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS revenue_rank
FROM inventory.suppliers AS s
JOIN inventory.drugs AS d
    ON d.drug_id = s.drug_id                        
JOIN operations.orders AS o
    ON o.drug_id = d.drug_id                                
GROUP BY
    s.name;

CREATE OR REPLACE VIEW analytics.supplier_value_report AS
SELECT
    s.name AS supplier_name,                                
    SUM(o.total_amount) AS total_revenue,                   
    COUNT(o.order_id) AS order_volume,                      
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS revenue_rank
FROM inventory.suppliers AS s
JOIN inventory.drugs AS d
    ON d.drug_id = s.drug_id                        
JOIN operations.orders AS o
    ON o.drug_id = d.drug_id                                
GROUP BY
    s.name;

