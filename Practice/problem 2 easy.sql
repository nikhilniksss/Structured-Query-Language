You have access to data from an electricity billing system, detailing the electricity usage and cost for specific households over billing periods in the years 2023 and 2024. Your objective is to present the total electricity consumption, total cost and average monthly consumption for each household per year display the output in ascending order of each household id & year of the bill.

 

Tables: electricity_bill
+-----------------+---------------+
| COLUMN_NAME     | DATA_TYPE     |
+-----------------+---------------+
| bill_id         | int           |
| household_id    | int           |
| billing_period  | varchar(7)    |
| consumption_kwh | decimal(10,2) |
| total_cost      | decimal(10,2) |
+-----------------+---------------+

Expected Output:

+--------------+-----------+-----------------+------------+---------------------+
| household_id | bill_year | consumption_kwh | total_cost | avg_consumption_kwh |
+--------------+-----------+-----------------+------------+---------------------+
|          101 | 2023      |         3743.50 |     561.56 |          311.958333 |
|          101 | 2024      |         3743.50 |     561.56 |          311.958333 |
|          102 | 2023      |         5980.00 |     897.00 |          498.333333 |
|          102 | 2024      |         7380.00 |    1107.00 |          615.000000 |
|          103 | 2023      |         6788.40 |    1018.32 |          565.700000 |
|          103 | 2024      |         8228.40 |    1234.32 |          685.700000 |
+--------------+-----------+-----------------+------------+---------------------+

Solution:

SELECT household_id,LEFT(billing_period,4) AS bill_year,
SUM(consumption_kwh) AS consumption_kwh,
SUM(total_cost) AS total_cost,
AVG(consumption_kwh) AS avg_consumption_kwh
FROM electricity_bill
GROUP BY household_id,bill_year;