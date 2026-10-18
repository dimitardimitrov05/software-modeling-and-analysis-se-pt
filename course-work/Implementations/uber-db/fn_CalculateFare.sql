CREATE FUNCTION dbo.fn_CalculateFare
(
    @distance_km DECIMAL(6,2),
    @promo_id    INT
)
RETURNS DECIMAL(8,2)
AS
BEGIN
    DECLARE @base_fare  DECIMAL(8,2) = 2.50;   -- базова такса
    DECLARE @price_km   DECIMAL(8,2) = 1.20;   -- цена на километър
    DECLARE @discount   DECIMAL(5,2) = 0;
    DECLARE @fare       DECIMAL(8,2);
 
    IF @promo_id IS NOT NULL
    BEGIN
        SELECT @discount = discount_percent
        FROM PromoCode
        WHERE promo_id = @promo_id;
    END
 
    SET @fare = (@base_fare + @distance_km * @price_km) * (1 - ISNULL(@discount, 0) / 100);
 
    RETURN ROUND(@fare, 2);
END;