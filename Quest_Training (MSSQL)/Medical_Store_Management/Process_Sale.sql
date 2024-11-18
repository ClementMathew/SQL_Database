CREATE PROCEDURE ProcessSale
    @customer_id INT,
    @medication_id INT,
    @quantity INT
AS
BEGIN
    DECLARE @currentStock INT;
    DECLARE @price DECIMAL(10, 2);

    -- Check current stock quantity

    SELECT @currentStock = stock_quantity, 
           @price = price
    FROM Medications
    WHERE id = @medication_id;

    -- Ensure there is enough stock to process the sale

    IF @currentStock >= @quantity
    BEGIN
        -- Insert the sale record

        INSERT INTO Sales (customer_id, medication_id, quantity, total_price)
        VALUES (@customer_id, @medication_id, @quantity, @quantity * @price);

        -- Update the stock quantity in the Medications table

        UPDATE Medications
        SET stock_quantity = stock_quantity - @quantity
        WHERE id = @medication_id;

        PRINT 'Sale processed successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Not enough stock available for this sale.';
    END
END;
