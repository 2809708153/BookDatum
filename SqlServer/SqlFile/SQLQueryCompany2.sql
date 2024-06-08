use Company
--1.按公司客户所在地来统计销售总额
SELECT   
    c.addr AS 客户所在地,  
    SUM(s.toa_amt) AS 销售总额  
FROM   
    customer c  
JOIN   
    sales s ON c.cus_id = s.cus_id  
GROUP BY   
    c.addr
--2.查询公司从96年8月开始单价超过2000块的采购单号和供应商
SELECT   
    p.pur_no AS 采购单号,  
    s.sup_name AS 供应商  
FROM   
    pur_item p
JOIN   
    supply s ON p.sup_id = s.sup_id 
WHERE   
    p.pur_date >= '1996-08-01' -- 从1996年8月开始  
    AND p.unit_price > 2000;
--3.查询公司目前库存商品的名称和数量
SELECT   
    pro.prod_name AS 商品名称,  
    s.stk_qty AS 数量  
FROM   
    product pro
JOIN   
    stock s ON pro.prod_id = s.prod_id
--4.查询公司采购金额超过10万的定单信息（包括 定单号厂家 商品名）
SELECT   
    sup.sup_name AS 定单号厂家,  
    pro.prod_name AS  商品名  
FROM   
    pur_item pur
JOIN   
    supply sup ON pur.sup_id = sup.sup_id
JOIN   
    product pro ON pur.prod_id = pro.prod_id
where 
	pur.qty * pur.unit_price > 100000
--5.查询库存量前三名的产品名称
SELECT   
    top 3 pro.prod_name AS 产品名称  
FROM   
    product pro
JOIN   
    stock s ON pro.prod_id = s.prod_id
order by
	s.stk_qty DESC
--6.查询库存商品销售金额在第三到第六的供货商的信息
WITH RankedSales AS (  
    SELECT   
        st.sup_id,  
        SUM(s.unit_price * s.qty) AS total_sales,  
        ROW_NUMBER() OVER (ORDER BY SUM(s.unit_price * s.qty) DESC) AS sales_rank  
    FROM   
        stock st
	JOIN
		sale_item s ON s.prod_id = st.prod_id
	Group by
		st.sup_id
)  
SELECT s.sup_id, s.sup_name 
FROM RankedSales rs  
JOIN supply s ON rs.sup_id = s.sup_id  
WHERE rs.sales_rank BETWEEN 3 AND 6
--7.查询同一类型产品有两家以上供货商的产品编号以及供货商的数量
SELECT 
	sa.prod_id AS 产品编号,
	count(DISTINCT sa.sup_id) AS 供货商的数量
FROM
	sale_item AS sa
GROUP BY
	sa.prod_id
HAVING
	count(DISTINCT sa.sup_id) >= 2
--8.统计公司各种产品的销售金额（需要区分不同的厂家）
SELECT   
    p.prod_name,  
    su.sup_name,  
    SUM(s.unit_price * s.qty) AS total_sales_amount  
FROM   
    product p  
JOIN   
    sale_item s ON p.prod_id = s.prod_id 
JOIN   
    supply su ON s.sup_id = su.sup_id 
GROUP BY   
    p.prod_id, p.prod_name, s.sup_id, su.sup_name
--9.查询公司在96年10月的定单，计算每日定单金额，并按照定单金额排序
SELECT  
    order_date,  
    SUM(sa.qty * sa.unit_price) AS daily_order_amount  
FROM  
    sale_item sa
WHERE  
    YEAR(order_date) = 1996 AND MONTH(order_date) = 10  
GROUP BY  
    sa.order_date  
ORDER BY  
    daily_order_amount DESC
--10.查询一笔销售记录中包含有两条明细记录的销售总帐记录
SELECT sa.*  
FROM sales sa  
WHERE sa.sale_id IN (  
    SELECT sale_id  
    FROM sales  
    GROUP BY sale_id
    HAVING COUNT(*) = 2  
)
--11.查询销售总表和销售明细表中不符合参照关系的数据（定单编号为参照字段）。
SELECT sh.*  
FROM sales sh  
LEFT JOIN sale_item sd ON sh.order_no = sd.order_no 
--12.查询每个员工的工资以及应该交纳的个人所得税金额（40000以下不交，40000---49999 5%   50000—59999 7% 60000以上 10%）
SELECT   
    emp_name AS 员工姓名,   
    salary AS 工资,   
    CASE   
        WHEN salary < 40000 THEN 0  
        WHEN salary BETWEEN 40000 AND 49999 THEN (salary - 40000) * 0.05  
        WHEN salary BETWEEN 50000 AND 59999 THEN 40000 * 0.05 + (salary - 50000) * 0.07  
        ELSE 40000 * 0.05 + 10000 * 0.07 + (salary - 60000) * 0.10  
    END AS 个人所得税金额  
FROM   
    employee
--13.生成公司销售的明细表要求表中需要表现的信息为（定单号，销售员姓名，销售产品，供货商名称，销售金额）
SELECT  
    s.order_no AS 定单号,  
    e.emp_name AS 销售员姓名,  
    pro.prod_name AS 销售产品,  
    su.sup_name AS 供伙商名称,  
    s.toa_amt AS 销售金额  
FROM  
    sales s  
JOIN  
    employee e ON e.emp_no = s.sale_id   
JOIN  
    sale_item sa ON sa.order_no = s.order_no
JOIN  
    supply su ON sa.sup_id = su.sup_id
JOIN
	product pro ON pro.prod_id = sa.prod_id

--14.在采购明细表中查询 同类产品在不同时间进货差价超过200元的产品及供货商名称
SELECT   
    su.sup_name,pro.prod_name
FROM   
    pur_item a 
JOIN
	supply su ON su.sup_id = a.sup_id
JOIN
	product pro ON pro.prod_id = a.prod_id
JOIN   
    pur_item b ON a.prod_id = b.prod_id AND a.sup_id = b.sup_id AND a.pur_date < b.pur_date  
WHERE   
    ABS(a.unit_price - b.unit_price) > 200  
--15.查询在同一天进入公司的员工信息
SELECT *  
FROM employee  
WHERE date_hired IN (  
    SELECT date_hired  
    FROM employee  
    GROUP BY date_hired  
    HAVING COUNT(*) > 1  
)
--16.查询公司所有客户在公司的定货情况
SELECT   
    c.cus_name,s.* 
FROM   
    customer c
JOIN   
    sales s ON c.cus_id = s.cus_id
--17.查询由公司女业务员所接回的定单
SELECT   
    e.emp_name,s.* 
FROM   
    sales s
JOIN   
    employee e ON e.emp_no = s.sale_id
WHERE
	e.sex = 'M' 
--18.查询公司中姓名相同的员工并按照员工编号显示员工信息
SELECT   
    *  
FROM   
    employee e  
WHERE   
    e.emp_name IN (  
        SELECT emp_name  
        FROM employee  
        GROUP BY emp_name  
        HAVING COUNT(*) > 1  
    )  
ORDER BY   
    e.emp_no
--19.查询公司中目前业绩还没有超过2万的业务员
SELECT   
    * 
FROM   
    employee e
JOIN   
    sales s ON e.emp_no = s.sale_id
WHERE
	s.toa_amt <= 20000 
--20.查询仓库中还没有销售过的产品信息
SELECT *
FROM stock
WHERE prod_id NOT IN (
	SELECT prod_id
    FROM sale_item
    GROUP BY prod_id  
)
--21.查询没有在公司订购产品的客户名单
SELECT *
FROM customer
WHERE cus_id NOT IN (
	SELECT cus_id  
    FROM sales  
    GROUP BY cus_id  
)
--22.按照供货商来统计公司的销售榜
SELECT   
    su.sup_name AS 供货商,
	SUM(sa.unit_price * sa.qty) AS 销售额
FROM   
    sale_item sa 
JOIN   
    supply su ON sa.sup_id = su.sup_id 
GROUP BY   
    su.sup_name
ORDER BY
	SUM(sa.unit_price * sa.qty) DESC
