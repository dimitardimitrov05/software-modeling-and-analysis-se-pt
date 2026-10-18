CREATE PROCEDURE dbo.sp_CompleteTrip
    @trip_id        INT,
    @payment_method NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @status   NVARCHAR(20);
    DECLARE @distance DECIMAL(6,2);
    DECLARE @promo_id INT;
    DECLARE @rider_id INT;
    DECLARE @fare     DECIMAL(8,2);
 
    SELECT @status   = status,
           @distance = distance_km,
           @promo_id = promo_id,
           @rider_id = rider_id
    FROM Trip
    WHERE trip_id = @trip_id;
 
    IF @status IS NULL
        THROW 50001, N'Пътуването не съществува.', 1;
 
    IF @status NOT IN ('requested', 'ongoing')
        THROW 50002, N'Пътуването вече е приключено или отказано.', 1;
 
    SET @fare = dbo.fn_CalculateFare(@distance, @promo_id);
 
    BEGIN TRY
        BEGIN TRANSACTION;
 
        UPDATE Trip
        SET fare = @fare,
            status = 'completed'
        WHERE trip_id = @trip_id;
 
        INSERT INTO Payment (trip_id, amount, method)
        VALUES (@trip_id, @fare, @payment_method);
 
        IF @promo_id IS NOT NULL
            UPDATE RiderPromo
            SET is_used = 1
            WHERE rider_id = @rider_id AND promo_id = @promo_id;
 
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;