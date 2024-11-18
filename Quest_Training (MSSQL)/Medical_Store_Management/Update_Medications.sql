
-- Updating values to Medications --

CREATE PROCEDURE update_Medications
    @name VARCHAR(100),
    @category VARCHAR(50),
    @price DECIMAL(10, 2), 
    @expiry_date DATE,
    @supplier_id INT,
    @type VARCHAR(20),
    @quantity INT 
AS
BEGIN

    DECLARE @present INT;

    SELECT @present = COUNT(*)
    FROM Medications
    WHERE name = @name;
    
    IF @present > 0
    BEGIN
        IF @type = 'stock_in'
        BEGIN
            UPDATE Medications
            SET stock_quantity = stock_quantity + @quantity
            WHERE name = @name;
        END

        IF @type = 'stock_out'
        BEGIN
            UPDATE Medications
            SET stock_quantity = stock_quantity - @quantity
            WHERE name = @name;
        END
    END

    ELSE
    BEGIN
        INSERT INTO Medications (name, category, price, expiry_date, supplier_id, stock_quantity)
        VALUES 
        (@name, @category, @price, @expiry_date, @supplier_id, @quantity);  
    END
END
