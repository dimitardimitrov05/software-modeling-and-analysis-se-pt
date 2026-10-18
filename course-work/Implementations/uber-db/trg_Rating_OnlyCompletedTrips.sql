CREATE TRIGGER dbo.trg_Rating_OnlyCompletedTrips
ON dbo.Rating
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
 
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Trip t ON t.trip_id = i.trip_id
        WHERE t.status <> 'completed'
    )
    BEGIN
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW 50011, N'Не може да се оцени пътуване, което не е приключено.', 1;
    END
END;