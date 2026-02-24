-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
SELECT p.ProductName, c.CategoryName
FROM Product AS p            
JOIN Category AS c ON c.Id = p.CategoryID

-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
SELECT o.Id, s.CompanyName
FROM [Order] AS o               
JOIN Shipper AS s ON s.Id = o.ShipVia
WHERE o.OrderDate < '2012-08-09'
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
SELECT od.Quantity, p.ProductName
FROM [Order] AS o                       
JOIN OrderDetail AS od ON od.OrderId = o.Id
JOIN Product AS p ON p.Id = od.ProductId                                        
WHERE o.Id = 10251                                                                                                                                                  
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)

SELECT o.Id AS OrderId, c.CompanyName, e.LastName                           
FROM [Order] AS o
JOIN Customer AS c ON c.Id = o.CustomerId           
JOIN Employee AS e ON e.Id = o.EmployeeId   