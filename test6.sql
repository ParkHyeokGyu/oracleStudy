-- ����Ŭ 2���� => ���� 155page
/*
	SELECT * | column1,column2...
	FROM table_name|view_name|SELECT~
	[
		WHERE => ������
		GROUP BY => �׷캰 ó��
		HAVING => �׷쿡 ���� ����
		ORDER BY => ����
	]

	=> ����Ŭ�� �ڵ� ������ �ȵȴ�
		    ------------ ORDER BY, INDEX_ASC, INDEX_DESC
	=> ORDER BY�� ����
	     => SELECT ������ �� �������� �߰�
	     -------------------------------
	     => ORDER BY �÷���
	     => ORDER BY �÷��� ASC
	     -------------------------------
	     => ORDER BY �÷��� DESC
*/
-- �޿��� ���������� ���
-- SELECT ename,sal FROM emp;
-- SELECT ename,sal FROM emp ORDER BY sal DESC;
/*
SELECT ename,sal FROM emp ORDER BY 1 DESC;
SELECT ename,sal FROM emp ORDER BY 2 DESC;
              1     2                          �÷� ����
*/
-- ���� ���� => �亯�� �Խ���, ����
-- SELECT ename,sal FROM emp ORDER BY sal DESC,ename ASC;
-- SELECT ename,sal FROM emp ORDER BY 2 DESC,1;

-- book => �������� ������������ ���
-- SELECT bookname FROM book ORDER BY bookname DESC;
-- ������, ���� => ������ ���������� ���(ASC)
-- SELECT bookname,price FROM book ORDER BY price;
/*
emp
 EMPNO		NOT NULL NUMBER(4)	���
 ENAME		VARCHAR2(10)		�̸�
 JOB		VARCHAR2(9)		����
 MGR		NUMBER(4)		�����ȣ
 HIREDATE	DATE			�Ի���
 SAL		NUMBER(7,2)		�޿�
 COMM		NUMBER(7,2)		������
 DEPTNO		NUMBER(2)		�μ���ȣ
*/
-- ����� �̸��� �μ���ȣ ���
-- SELECT ename,deptno FROM emp;
-- SELECT ename,deptno FROM emp ORDER BY deptno;
-- �������� ���� ����� �̸�,�޿�,������ ��� => �޿��� ���������� ���
-- SELECT ename,sal,comm FROM emp WHERE comm IS NULL OR comm=0 ORDER BY sal DESC;
-- SELECT ename,sal,comm FROM emp WHERE NOT (comm IS NOT NULL AND comm<>0) ORDER BY sal DESC;
-- 81�⿡ �Ի��� ����� �̸�,�Ի��� => �Ի����� �ֱ��� ������� ���
-- SELECT ename,hiredate FROM emp WHERE hiredate LIKE '81%' ORDER BY hiredate DESC;
-- ����� �̸��߿� A�ڰ� ���� ����� �̸��� �޿� ��� => �޿��� ���������� ���
-- SELECT ename as �̸�,sal as �޿� FROM emp WHERE ename NOT LIKE '%A%' ORDER BY sal DESC;
-- ����� �ִ� ����� �̸��� �޿�,�Ի����� ��� => �޿��� ���������� ���, ���� ��쿡�� �̸��� ���� ������ ���
-- SELECT ename,sal,hiredate,mgr FROM emp WHERE mgr IS NOT NULL ORDER BY sal DESC,ename;
-- ����� ���ϰ� �ִ� �����ȣ�� �ߺ����� ���
-- SELECT DISTINCT mgr FROM emp WHERE mgr IS NOT NULL;
-- �Ի����� 82�� �����̰ų� ������ MANAGER�� ����� �̸�,����,�Ի��� ���
-- SELECT ename,job,hiredate FROM emp WHERE hiredate>'82/12/31' OR job='MANAGER';
-- �̸��߿� A�ڰ� 3��°�� �ִ� ����� ��� ���� ���
-- SELECT * FROM emp WHERE ename LIKE '__A%';