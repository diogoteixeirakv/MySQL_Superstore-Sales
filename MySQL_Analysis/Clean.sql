-- OVERLOOK --
use store

select count(*)
from superstore

select *
from superstore
order by orderdate, orderid

describe superstore

-- Date Range: 2014-01-04 to 2017-12-30
select min(orderdate), max(orderdate)
from superstore

-- RENAME COLUMNS -- 
ALTER TABLE superstore
RENAME COLUMN `Product ID` TO ProductID 
ALTER TABLE superstore
RENAME COLUMN `Customer ID` TO CustomerID
ALTER TABLE superstore
RENAME COLUMN  `Sub-Category` TO SubCategory
ALTER TABLE superstore
RENAME COLUMN  `Row ID` TO RowID
ALTER TABLE superstore
RENAME COLUMN `Order ID` TO OrderID
ALTER TABLE superstore
RENAME COLUMN `Order Date` TO OrderDate
ALTER TABLE superstore
RENAME COLUMN `Ship Date` TO ShipDate
ALTER TABLE superstore
RENAME COLUMN `Ship Mode` TO ShipMode
ALTER TABLE superstore
RENAME COLUMN `Customer Name` TO CustomerName
ALTER TABLE superstore
RENAME COLUMN `Postal Code` TO PostalCode
ALTER TABLE superstore
RENAME COLUMN `Product Name` TO ProductName


-- FORMAT ORDERDATE --
select orderdate
from superstore
order by orderdate 

UPDATE superstore
SET orderdate = REPLACE(orderdate, '/', '-')

SELECT orderid, STR_TO_DATE(OrderDate, '%e-%c-%Y') AS OrderDate1
from superstore

update superstore
set OrderDate=STR_TO_DATE(OrderDate, '%m-%d-%Y')


-- NULLS CHECK --
-- No nulls
select *
from superstore
where 
	rowid is null or
    orderid is null or
    orderdate is null or
    shipdate is null or
    shipmode is null or
    customerid is null or
    customername is null or
    segment is null or
    country is null or
    city is null or
    state is null or
    postalcode is null or
    region is null or
    productid is null or
    category is null or
    subcategory is null or
    productname is null or
    sales is null or
    quantity is null or
    discount is null or
    profit is null 

-- DETECT DUPLICATES --
-- There are duplicates.
SELECT orderid, count(*) as records
FROM superstore
GROUP BY orderid
HAVING count(*) > 1

-- Deduplicate
SELECT distinct a.orderid, a.customername, a.orderdate, a.customerid, a.customername, a.sales, count(*) as records
FROM superstore a
JOIN superstore b on a.orderid = b.orderid
group by orderid
having count(*)>1
order by orderdate

