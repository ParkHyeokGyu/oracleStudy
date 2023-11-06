-- ����Ŭ SQL => DML(129page)
/*
   DQL : SELECT
           = ����
           = ���� => ������
              => ������
              => ���� �Լ�
           = ���̺� ���� => ������ ����(JOIN)
           = SQL������ ��ģ�� => ��������
   DDL : ���̺� ���� => Ű�� ����
   DML(TCL) => �߰�, ����, ����
   ------------------------------------------------- ����
   View : �������̺�
   INDEX : ����ȭ
   SEQUENCE, �ó���
   PL/SQL
   �����ͺ��̽� �𵨸�
   
   bit => byte => word => record => table
   ���
   --------------------------------------------------------------------
	�����ͺ��̽�	�ǹ�		���� �ǹ�
   --------------------------------------------------------------------
	�����̼�		���̺�		����
   --------------------------------------------------------------------
	�Ӽ�		�÷�		�ʵ�(�������)
   --------------------------------------------------------------------
	Ʃ��		ROW/RECORD	��ü(�ν��Ͻ�) => �� ��(Ŭ���� ��ü)
   --------------------------------------------------------------------

	���̺� => emp(�������) => ����Ŭ���� ����(������ ���̺�)
	=> �÷�(8��), ROW(14��) => 14�� ���� ����
                 ------------
                  DESC table�� => �÷���� �������� Ȯ��
                  *** ��������(CHAR, VARCHAR2, CLOB => ���ڿ�) => ''
	          (DATE) = ��¥�� => ������ ���ڿ��� �Ѵ�
	          (NUMBER) = ������ => int, double(����, �Ǽ�)
	
	emp ���̺��� ����
	�÷���		��������
	EMPNO		NOT NULL NUMBER(4)	����		�����ȣ
 	ENAME		VARCHAR2(10)		���ڿ�		�̸�
	JOB		VARCHAR2(9)		���ڿ�		����
 	MGR      		NUMBER(4)		����		�����ȣ
 	HIREDATE 	DATE			��¥��		�Ի���
 	SAL     		NUMBER(7,2)		����,�Ǽ�		�޿�
 	COMM  		NUMBER(7,2)		����,�Ǽ�		������
 	DEPTNO		NUMBER(2)		����		�μ���ȣ
	----------------------------------------------------------------------------------------- 8���� ����(�� �����) => �� ������� 14��
	=> ���α׷��� �ʿ��� ������ ���� => SELECT

	1) SELECT : ������ ����(�ʿ��� ������ �˻�)
	   = SQL������ ���ڿ��� �Ǿ��ִ� => ������ �����µ� �ַ�
	      1. ����(����) => ��ҹ��� ����(X) => �������̸� Ű����� �빮�ڸ� ����Ѵ�
	         ------------------------------------
	         SELECT * | column1,column2...
	         FROM table_name;
	         [
	             WHERE ���ǹ�
	                       -------- ������
	             GROUP BY group_column => �Ի�⵵��, �μ���, ������...
	             HEVING �׷����� => GROUP BY�� �ִ� ��쿡�� ��� ����
	             ORDER BY ���� (ASC|DESC)
	             => INDEX�� �̿��� �� �ִ�
	         ]
*/
-- emp�� �ִ� ��� �����͸� ���
-- SELECT * FROM emp;
-- emp���� ���ϴ� �����͸� ���(�̸�, ����, �Ի���, �޿�)
-- SELECT ename,job,hiredate,sal FROM emp;
/*
   SELECT ename "�̸�",hiredate "�Ի���",sal "�޿�" FROM emp;
   SELECT ename as �̸�,hiredate as �Ի���,sal as �޿� FROM emp;
*/
-- SELECT ename "�̸�",hiredate "�Ի���",sal "�޿�" FROM emp;
-- SELECT ename as �̸�,hiredate as �Ի���,sal as �޿� FROM emp;
-- �μ���ȣ
-- SELECT deptno FROM emp;
-- �ߺ����� => ������, �帣... => DISTINCT �ڿ��� �÷� 1���� ����
-- SELECT DISTINCT deptno FROM emp;
-- SELECT DISTINCT job FROM emp;
-- 1. book ���̺� Ȯ��
-- DESC book;
/*
 BOOKID		NOT NULL NUMBER(2)	������
 BOOKNAME	VARCHAR2(40)		å�̸�
 PUBLISHER	VARCHAR2(40)		���ǻ�
 PRICE		NUMBER(8)		����
*/
-- 2. ��� ������ ������� ���� ���
-- SELECT bookname,price FROM book;
-- ���ǻ� ���
SELECT publisher FROM book;
SELECT DISTiNCT publisher FROM book;