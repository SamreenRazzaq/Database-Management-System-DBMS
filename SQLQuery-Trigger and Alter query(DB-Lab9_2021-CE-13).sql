/*CREATE TRIGGER dbo.availableTrigger ON products
AFTER INSERT, UPDATE AS
BEGIN
	UPDATE products
	SET status = 'NA'
	WHERE quantity < 50
	UPDATE products
	SET status = 'A'
	WHERE quantity >= 50

END;
*/
-- DELETING THE CONSTRAINT
ALTER TABLE merchants
ADD CONSTRAINT chk_merchants_country
CHECK (country_code >= 1);

INSERT INTO merchants(id, merchant_name, admin_id, country_code, created_at)
VALUES (21, 'Samreen', 4, 2, '28-03-2022')