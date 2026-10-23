# Uber DB

Курсова работа по "Софтуерно моделиране и анализ".

## Автори

|Име|Факултетен номер|
|-|-|
|Стефан Шиков|2401322005|
|Димитър Димитров|2401322023|

## Тема

Платформа за споделено пътуване **Uber**: клиенти (Rider) поръчват пътувания, които се изпълняват от шофьори (Driver) с техните коли (Vehicle). Към пътуването могат да се прилагат промокодове (PromoCode), след края му се прави плащане (Payment) и клиентът може да остави оценка (Rating).

## Съдържание

```
uber-db/
├── creating\_db.sql                      # създава базата и таблиците
├── fn\_CalculateFare.sql                 # функция: цена на пътуване
├── fn\_DriverAvgRating.sql               # функция: средна оценка на шофьор
├── sp\_CompleteTrip.sql                  # процедура: приключване на пътуване
├── sp\_GetDriverStats.sql                # процедура: статистика за шофьор
├── trg\_Rating\_OnlyCompletedTrips.sql    # тригер: оценка само на приключено пътуване
├── trg\_Trip\_VehicleBelongsToDriver.sql  # тригер: колата трябва да е на шофьора
├── insert.sql                           # примерни данни
├── uber.pbix                            # Power BI отчет
└── diagrams/
    ├── conceptual\_chen.drawio           # концептуален модел (Chen)
    ├── logical\_crowsfoot.drawio         # логически модел (Crow's Foot)
    └── datawarehouse\_uml.drawio         # Data Warehouse (UML)
```

## Модели

* **Концептуален модел (Chen):** 8 обекта, 9 връзки, атрибути на всеки обект.
* **Логически модел (Crow's Foot):** 9 таблици, 41 атрибута, една връзка много към много (Rider ↔ PromoCode през RiderPromo).
* **Data Warehouse (UML):** 3 таблици факти (FactTrip, FactPayment, FactRating) и 8 таблици измерения (DimDate, DimRider, DimDriver, DimVehicle, DimCity, DimPromoCode, DimTripStatus, DimPaymentMethod).

Диаграмите се отварят с [draw.io](https://app.diagrams.net) (File → Open from → Device).

## База данни

* **Таблици:** City, Rider, Driver, Vehicle, PromoCode, RiderPromo, Trip, Payment, Rating.
* **Функции:** `fn\_CalculateFare` (базова такса + цена на километър, с отстъпка от промокод), `fn\_DriverAvgRating` (средна оценка на шофьор).
* **Съхранени процедури:** `sp\_CompleteTrip` (изчислява цената, приключва пътуването, създава плащане и отбелязва промокода като използван), `sp\_GetDriverStats` (брой пътувания, приходи и средна оценка на шофьор).
* **Тригери:** `trg\_Rating\_OnlyCompletedTrips` (не позволява оценка на неприключено пътуване), `trg\_Trip\_VehicleBelongsToDriver` (проверява дали колата е на избрания шофьор).
* **Данни:** 6 града, 20 клиенти, 12 шофьори, 12 коли, 5 промокода, 150 пътувания, с плащания и оценки.

## Инсталация и стартиране

Необходими програми: **SQL Server** (Developer или Express), **SQL Server Management Studio (SSMS)** и **Power BI Desktop** (само за Windows).

1. Отвори SSMS и се свържи със сървъра си.
2. Изпълни `creating\_db.sql`. След него избери базата **UberDB** от падащото меню горе вляво (или изпълни `USE UberDB;`), иначе следващите скриптове ще работят върху друга база.
3. Изпълни един по един (всеки файл в отделен прозорец за заявки), в този ред:

   1. `fn\_CalculateFare.sql`
   2. `fn\_DriverAvgRating.sql`
   3. `sp\_CompleteTrip.sql`
   4. `sp\_GetDriverStats.sql`
   5. `trg\_Rating\_OnlyCompletedTrips.sql`
   6. `trg\_Trip\_VehicleBelongsToDriver.sql`
4. Изпълни `insert.sql`, за да напълниш базата с данни. В края му се показва брой редове във всяка таблица.
5. Проба:

```sql
   EXEC dbo.sp\_GetDriverStats @driver\_id = 1;
   SELECT dbo.fn\_DriverAvgRating(1);
   ```

6. Отвори `uber.pbix` с Power BI Desktop. Ако не намери базата, избери **Transform data → Data source settings** и въведи името на твоя SQL Server.

## Power BI отчет

Отчетът е върху данните от базата и съдържа 4 визуализации: пътувания по град, пътувания по шофьор, плащания по начин на плащане и пътувания по година.

