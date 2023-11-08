-- ����Ŭ GROUP BY / JOIN / SUBQUERY
/*
	ORDERID	NOT NULL NUMBER(2) => ���Ź�ȣ(�ߺ� ���� ������)
 	CUSTID	NUMBER(2) => ����ȣ
 	BOOKID	NUMBER(2) => å��ȣ
 	SALEPRICE	NUMBER(8) => ����
 	ORDERDATE	DATE => ������
*/
/*
   ORDERID     CUSTID     BOOKID  SALEPRICE ORDERDAT
---------- ---------- ---------- ---------- --------
         1          1          1       6000 20/07/01
         2          1          3      21000 20/07/03
         3          2          5       8000 20/07/03
         4          3          6       6000 20/07/04
         5          4          7      20000 20/07/05
         6          1          2      12000 20/07/07
         7          4          8      13000 20/07/07
         8          3         10      12000 20/07/08
         9          2         10       7000 20/07/09
        10          3          8      13000 20/07/10
*/
-- SUM : ���� => ������ å�� �� ����
-- SELECT SUM(saleprice) FROM orders;
-- COUNT : ���� => ������ ����� ��
/*
SELECT COUNT(*) FROM orders;
SELECT custid FROM orders;
SELECT DISTINCT custid FROM orders;
SELECT COUNT(DISTINCT custid) FROM orders;
*/
-- ���ŵ� å�߿� ���� ���å�� ���ΰ�
/*
SELECT MAX(saleprice) FROM orders;
SELECT MIN(saleprice) FROM orders;
SELECT ROUND(AVG(saleprice)) FROM orders;
*/
/*
	GROUP BY : ������ �׷캰�� ���� ���
	           ------------ ���� ���� ������ �ִ� ���
	emp : �μ���ȣ��, �Ի�⵵��, ������
	-- �μ����� �ο���, �޿��� ����, �޿� ���, �ִ밪, �ּҰ�
*/
-- 10,20,30
/*
SELECT COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" FROM emp WHERE deptno=10;
SELECT COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" FROM emp WHERE deptno=20;
SELECT COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" FROM emp WHERE deptno=30;
*/
-- GROUP BY
/*
SELECT deptno,COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" FROM emp GROUP BY deptno ORDER BY deptno;
SELECT job,COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" FROM emp GROUP BY job ORDER BY job;
*/
-- �Ի�⵵��
/*
SELECT TO_CHAR(hiredate,'YYYY'),COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" 
FROM emp 
GROUP BY TO_CHAR(hiredate,'YYYY') 
ORDER BY TO_CHAR(hiredate,'YYYY');
*/
-- ���Ϻ�
/*
SELECT TO_CHAR(hiredate,'DY'),COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�" 
FROM emp 
GROUP BY TO_CHAR(hiredate,'DY');
*/
-- �μ��� ��ü �޿��� ��պ��� ���� �μ��� ���
/*
SELECT deptno,COUNT(*) "�ο���",SUM(sal) "�޿� ����",AVG(sal) "�޿� ���",MAX(sal) "�ִ밪",MIN(sal) "�ּҰ�"
FROM emp
GROUP BY deptno
HAVING AVG(sal)<2073;
*/
-- �� �μ��� �������� �޴� �ο��� ���
/*
SELECT deptno,COUNT(*) "�ο���"
FROM emp
WHERE comm IS NOT NULL AND comm<>0
GROUP BY deptno;
*/
-- WHERE ������ GROUP BY���� ����� �� ����(GROUP BY�� HAVING)
-- GROUP BY ���ÿ��� ��� �÷���� GROUP BY �÷����� �����ؾ��Ѵ�
/*
SELECT deptno,job,COUNT(*),AVG(sal),SUM(sal)
FROM emp
GROUP BY deptno,job
ORDER BY deptno,job DESC;
*/
SELECT custid,COUNT(*) "��������"
FROM orders
WHERE saleprice>=8000
GROUP BY custid
HAVING COUNT(*)>=2;