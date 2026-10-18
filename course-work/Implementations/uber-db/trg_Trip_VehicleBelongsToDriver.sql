CREATE TRIGGER dbo.trg_Trip_VehicleBelongsToDriver
ON dbo.Trip
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
 
    IF UPDATE(driver_id) OR UPDATE(vehicle_id)
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN Vehicle v ON v.vehicle_id = i.vehicle_id
            WHERE v.driver_id <> i.driver_id
        )
        BEGIN
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;
            THROW 50010, N'Колата не принадлежи на избрания шофьор.', 1;
        END
    END
END;