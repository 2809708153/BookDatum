use Company
--1.����˾�ͻ����ڵ���ͳ�������ܶ�
SELECT   
    c.addr AS �ͻ����ڵ�,  
    SUM(s.toa_amt) AS �����ܶ�  
FROM   
    customer c  
JOIN   
    sales s ON c.cus_id = s.cus_id  
GROUP BY   
    c.addr
--2.��ѯ��˾��96��8�¿�ʼ���۳���2000��Ĳɹ����ź͹�Ӧ��
SELECT   
    p.pur_no AS �ɹ�����,  
    s.sup_name AS ��Ӧ��  
FROM   
    pur_item p
JOIN   
    supply s ON p.sup_id = s.sup_id 
WHERE   
    p.pur_date >= '1996-08-01' -- ��1996��8�¿�ʼ  
    AND p.unit_price > 2000;
--3.��ѯ��˾Ŀǰ�����Ʒ�����ƺ�����
SELECT   
    pro.prod_name AS ��Ʒ����,  
    s.stk_qty AS ����  
FROM   
    product pro
JOIN   
    stock s ON pro.prod_id = s.prod_id
--4.��ѯ��˾�ɹ�����10��Ķ�����Ϣ������ �����ų��� ��Ʒ����
SELECT   
    sup.sup_name AS �����ų���,  
    pro.prod_name AS  ��Ʒ��  
FROM   
    pur_item pur
JOIN   
    supply sup ON pur.sup_id = sup.sup_id
JOIN   
    product pro ON pur.prod_id = pro.prod_id
where 
	pur.qty * pur.unit_price > 100000
--5.��ѯ�����ǰ�����Ĳ�Ʒ����
SELECT   
    top 3 pro.prod_name AS ��Ʒ����  
FROM   
    product pro
JOIN   
    stock s ON pro.prod_id = s.prod_id
order by
	s.stk_qty DESC
--6.��ѯ�����Ʒ���۽���ڵ����������Ĺ����̵���Ϣ
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
--7.��ѯͬһ���Ͳ�Ʒ���������Ϲ����̵Ĳ�Ʒ����Լ������̵�����
SELECT 
	sa.prod_id AS ��Ʒ���,
	count(DISTINCT sa.sup_id) AS �����̵�����
FROM
	sale_item AS sa
GROUP BY
	sa.prod_id
HAVING
	count(DISTINCT sa.sup_id) >= 2
--8.ͳ�ƹ�˾���ֲ�Ʒ�����۽���Ҫ���ֲ�ͬ�ĳ��ң�
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
--9.��ѯ��˾��96��10�µĶ���������ÿ�ն����������ն����������
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
--10.��ѯһ�����ۼ�¼�а�����������ϸ��¼���������ʼ�¼
SELECT sa.*  
FROM sales sa  
WHERE sa.sale_id IN (  
    SELECT sale_id  
    FROM sales  
    GROUP BY sale_id
    HAVING COUNT(*) = 2  
)
--11.��ѯ�����ܱ��������ϸ���в����ϲ��չ�ϵ�����ݣ��������Ϊ�����ֶΣ���
SELECT sh.*  
FROM sales sh  
LEFT JOIN sale_item sd ON sh.order_no = sd.order_no 
--12.��ѯÿ��Ա���Ĺ����Լ�Ӧ�ý��ɵĸ�������˰��40000���²�����40000---49999 5%   50000��59999 7% 60000���� 10%��
SELECT   
    emp_name AS Ա������,   
    salary AS ����,   
    CASE   
        WHEN salary < 40000 THEN 0  
        WHEN salary BETWEEN 40000 AND 49999 THEN (salary - 40000) * 0.05  
        WHEN salary BETWEEN 50000 AND 59999 THEN 40000 * 0.05 + (salary - 50000) * 0.07  
        ELSE 40000 * 0.05 + 10000 * 0.07 + (salary - 60000) * 0.10  
    END AS ��������˰���  
FROM   
    employee
--13.���ɹ�˾���۵���ϸ��Ҫ�������Ҫ���ֵ���ϢΪ�������ţ�����Ա���������۲�Ʒ�����������ƣ����۽�
SELECT  
    s.order_no AS ������,  
    e.emp_name AS ����Ա����,  
    pro.prod_name AS ���۲�Ʒ,  
    su.sup_name AS ����������,  
    s.toa_amt AS ���۽��  
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

--14.�ڲɹ���ϸ���в�ѯ ͬ���Ʒ�ڲ�ͬʱ�������۳���200Ԫ�Ĳ�Ʒ������������
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
--15.��ѯ��ͬһ����빫˾��Ա����Ϣ
SELECT *  
FROM employee  
WHERE date_hired IN (  
    SELECT date_hired  
    FROM employee  
    GROUP BY date_hired  
    HAVING COUNT(*) > 1  
)
--16.��ѯ��˾���пͻ��ڹ�˾�Ķ������
SELECT   
    c.cus_name,s.* 
FROM   
    customer c
JOIN   
    sales s ON c.cus_id = s.cus_id
--17.��ѯ�ɹ�˾Ůҵ��Ա���ӻصĶ���
SELECT   
    e.emp_name,s.* 
FROM   
    sales s
JOIN   
    employee e ON e.emp_no = s.sale_id
WHERE
	e.sex = 'M' 
--18.��ѯ��˾��������ͬ��Ա��������Ա�������ʾԱ����Ϣ
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
--19.��ѯ��˾��Ŀǰҵ����û�г���2���ҵ��Ա
SELECT   
    * 
FROM   
    employee e
JOIN   
    sales s ON e.emp_no = s.sale_id
WHERE
	s.toa_amt <= 20000 
--20.��ѯ�ֿ��л�û�����۹��Ĳ�Ʒ��Ϣ
SELECT *
FROM stock
WHERE prod_id NOT IN (
	SELECT prod_id
    FROM sale_item
    GROUP BY prod_id  
)
--21.��ѯû���ڹ�˾������Ʒ�Ŀͻ�����
SELECT *
FROM customer
WHERE cus_id NOT IN (
	SELECT cus_id  
    FROM sales  
    GROUP BY cus_id  
)
--22.���չ�������ͳ�ƹ�˾�����۰�
SELECT   
    su.sup_name AS ������,
	SUM(sa.unit_price * sa.qty) AS ���۶�
FROM   
    sale_item sa 
JOIN   
    supply su ON sa.sup_id = su.sup_id 
GROUP BY   
    su.sup_name
ORDER BY
	SUM(sa.unit_price * sa.qty) DESC
