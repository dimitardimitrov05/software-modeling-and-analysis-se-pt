CREATE PROCEDURE dbo.sp_GetDriverStats
    @driver_id INT
AS
BEGIN
    SET NOCOUNT ON;
 
    IF NOT EXISTS (SELECT 1 FROM Driver WHERE driver_id = @driver_id)
        THROW 50003, N'Шофьорът не съществува.', 1;
 
    SELECT
        d.driver_id,
        d.full_name,
        COUNT(t.trip_id)               AS total_trips,
        ISNULL(SUM(t.fare), 0)         AS total_revenue,
        dbo.fn_DriverAvgRating(d.driver_id) AS avg_rating
    FROM Driver d
    LEFT JOIN Trip t
           ON t.driver_id = d.driver_id
          AND t.status = 'completed'
    WHERE d.driver_id = @driver_id
    GROUP BY d.driver_id, d.full_name;
END;