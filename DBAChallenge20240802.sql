====================================
--CONSULTAS BIKE STORES
-- Autor Beatriz Tenório
-- Desafio tecnico Coodesh
====================================

--1) Listar todos Clientes que não tenham realizado uma compra;

SELECT c.customer_id, c.first_name, c.last_name FROM customers c 
LEFT JOIN orders orders ON c.customer_id = o.customer_id
WHERE  o.order_id IS null;
--Explicação : LEFT JOIN pega todos os clientes e filtra os que nao tem pedidos (o.order_id IS null)


--2) Listar os Produtos que não tenham sido comprados

SELECT p.product_id, p.product_name, p.product_price FROM products Pedido
LEFT JOIN order_items o ON p.product_id = o,product_id
WHERE o.product_id IS null;
--Explicação : Produtos que não aparecem na tabela order_items são produtos que nao foram vendidos


--3) Listar os Produtos sem Estoque;
--Explicação:
SELECT p.product_id, p.product_name FROM products p 
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity IS null OR s.quantity = 0;
--Explicação:  Considera produtos sem registro de estoque no caso NULL ou com quantidade zeradas (s.quantity IS null OR s.quantity = 0)

--4) Agrupar a quantidade de vendas que uma determinada Marca por Loja.

SELECT b.brand_name, s.store_name, SUM(oo.quantity) AS total FROM order_items oo 
JOIN products p ON o.product_id =p.product_id
JOIN brands b ON p.brand_id =b.brand_id
JOIN orders o ON oo.order_id = o.orders
JOIN stores s ON o.store_id = s.store_id
GROUP BY b.brand_name, s.store_name
ORDER BY b.brand_name, s.store_name;
--Explicação: Agrupa e soma quantidade de itens vendidos, agrupando por marca e por loja.

-- 5) Listar os Funcionarios que não estejam relacionados a um Pedido.

SELECT s.staff_id, s.first_name, s.last_name FROM staffs s 
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.order_id IS null;
--Explicação: LEFT JOIN tras todos os funcionarios e filtra os que nunca atederam pedidos