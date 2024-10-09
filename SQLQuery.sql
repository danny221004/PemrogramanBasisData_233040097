-- 1. Mengembalikan gender berdasarkan titel kesopanan
SELECT 
    empid, 
    firstname, 
    lastname, 
    titleofcourtesy, 
    CASE 
        WHEN titleofcourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
        WHEN titleofcourtesy = 'Mr.' THEN 'Male'
        ELSE 'Unknown'
    END AS gender
FROM 
    HR.Employees;

-- 2. Menghitung jumlah total pesanan dan total kuantitas untuk setiap pelanggan
SELECT 
    c.custid, 
    COUNT(o.orderid) AS numorders, 
    SUM(od.quantity) AS totalqty
FROM 
    Sales.Customers AS c
LEFT JOIN 
    Sales.Orders AS o ON c.custid = o.custid
LEFT JOIN 
    Sales.OrderDetails AS od ON o.orderid = od.orderid
GROUP BY 
    c.custid;

-- 3. Mengembalikan pelanggan dan pesanan mereka, termasuk pelanggan yang tidak melakukan pemesanan
SELECT 
    c.custid, 
    c.companyname, 
    o.orderid, 
    o.orderdate 
FROM 
    Sales.Customers AS c 
LEFT JOIN 
    Sales.Orders AS o ON c.custid = o.custid;

-- 4. Mengembalikan semua pesanan yang dilakukan pada hari terakhir aktivitas
SELECT 
    orderid, 
    orderdate, 
    custid, 
    empid 
FROM 
    Sales.Orders 
WHERE 
    orderdate = (SELECT MAX(orderdate) FROM Sales.Orders);

-- 5. Mengembalikan karyawan yang tidak melakukan pemesanan pada atau setelah 1 Mei 2016
SELECT 
    e.empid, 
    e.firstname, 
    e.lastname 
FROM 
    HR.Employees AS e 
WHERE 
    e.empid NOT IN (SELECT o.empid FROM Sales.Orders o WHERE o.orderdate >= '2016-05-01');
