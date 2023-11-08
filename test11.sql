-- ���̺� �� �� �̻󿡼� �ʿ��� �����͸� ���� => JOIN
/*
 emp �������
 EMPNO	NOT NULL NUMBER(4)	���
 ENAME	VARCHAR2(10)		�̸�
 JOB		VARCHAR2(9)		����
 MGR		NUMBER(4)			�����ȣ
 HIREDATE	DATE				�Ի���
 SAL		NUMBER(7,2)		�޿�
 COMM		NUMBER(7,2)		������
 DEPTNO	NUMBER(2)			�μ���ȣ
 ----------------------------------------
 dept �μ�����
 DEPTNO	NOT NULL NUMBER		�μ���ȣ
 DNAME	VARCHAR2(20)		�μ���
 LOC		VARCHAR2(20)		�ٹ���
 ----------------------------------------
 1. JOIN�� ����
    = INNER JOIN => NULL���� �ִ� ��� ó�� �Ұ���(�����)
      = EQUI JOIN
      = NON-EQUI JOIN
      ------------------- ����� ������ ���� ������ ���, �÷����� �޶� ��� ����
      = NATURAL JOIN
      = JOIN USING
      ------------------- �÷����� �����ؾ��Ѵ�
      
      A(a,b,c,d)
      B(b,e,g,h)
      => a,c,e,g
      
      ����)
      	����Ŭ ����
      	SELECT a,c,e,g
      	FROM A,B
      	WHERE A.b=B.b; => �÷����� ������ ��� ��������� ����������Ѵ�
      	
      	ANSI ����(ǥ��)
      	SELECT a,c,e,g
      	FROM A JOIN B
      	ON A.b=B.b;
      
    = OUTER JOIN => NULL���� �ִ� ��� ó�� ����(ADMIN)
      = LEFT OUTER JOIN
      = RIGHT OUTER JOIN
      = FULL OUTER JOIN
*/
/*
-- ����Ŭ ����
-- ���, �̸�, ����, �Ի���, �޿�, �μ���, �ٹ���
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno;
-- ANSI ����
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
-- �ڿ� ����
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp NATURAL JOIN dept;
-- JOIN USING
SELECT empno,ename,job,hiredate,sal,dname,loc
FROM emp JOIN dept USING(deptno);
*/

/*
 orders
 ORDERID		NOT NULL NUMBER(2)
 CUSTID		NUMBER(2)
 BOOKID		NUMBER(2)
 SALEPRICE		NUMBER(8)
 ORDERDATE		DATE
 ---------------------------------
 customer
 CUSTID		NOT NULL NUMBER(2)
 NAME			VARCHAR2(40)
 ADDRESS		VARCHAR2(50)
 PHONE		VARCHAR2(20)
 ---------------------------------
 book
 BOOKID		NOT NULL NUMBER(2)
 BOOKNAME		VARCHAR2(40)
 PUBLISHER		VARCHAR2(40)
 PRICE		NUMBER(8)
*/
-- EQUI JOIN
-- ����Ŭ ����
/*
SELECT * FROM orders;
SELECT orderid,name,bookname,saleprice,orderdate
FROM orders o,customer c,book b
WHERE o.custid=c.custid AND o.bookid=b.bookid;
*/
-- ANSI ����
/*
SELECT orderid,name,bookname,saleprice,orderdate
FROM orders o JOIN customer c
ON o.custid=c.custid
JOIN book b
ON o.bookid=b.bookid;
*/
-- ���̺��� �� ���� ����� �� �ִ� => SELF JOIN
SELECT e1.ename "����",e2.ename "���"
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);