CREATE FUNCTION dbo.fn_DriverAvgRating
(
    @driver_id INT
)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @avg DECIMAL(3,2);
 
    SELECT @avg = AVG(CAST(r.score AS DECIMAL(5,2)))
    FROM Rating r
    JOIN Trip t ON t.trip_id = r.trip_id
    WHERE t.driver_id = @driver_id;
 
    RETURN @avg;
END;