-- ����Ŭ 3���� => �����Լ�
/*
	SELECT ���� => DQL(������ �˻�)
	=> ���õ� �����͸� ��Ƶδ� ��� : ���̺�
	   ��� ����, ȸ�� ����, ���� ����, ���� ����...
	   ������ �����ϱ� ���� => �÷�(�������)
	   �÷� => ��������(����(int, double), ����(char, String), ��¥(Date))
	   => �÷� �ؿ� �����͸� ÷�� => ROW
	   => Ȯ��
	      DESC table_name => �÷���� �������� Ȯ��
	      => user_tables => ����Ŭ�� ����
	         ----------- user_views...
	      => ��� ���̺��� �빮�ڷ� ����
	      => ���̺� ����(���� �����ͺ��̽�(XE)) => ���̺��� �ߺ� ����
	         SELECT * FROM tab => � ���̺��� �����Ǿ� �ִ��� Ȯ��
	1) ����
	   SELECT * | column1,column2... --------------- 5 => �����Լ�
	   FROM table_name --------------- 1
	   [
	       WHERE ���ǹ� --------------- 2 => ������
	       ---------
	       GROUP BY  --------------- 3
	       HAVING --------------- 4
	       ---------
	       ORDER BY --------------- 6
	   ]
	   
	   => �׷캰 ó�� GROUP BY
	   => ���̺��� �����ؼ� �ʿ��� ������ ���� => JOIN
	      ���� ===> ȸ�� ���� / ��ȭ ����
	      ---- id / mno(fk) => ȸ���� ��� ���� / ��ȭ�� ��� ����
	      
	      customer / book / orders
	      ����� ���� / å ���� / ���� ����
	   
	   => SUBQUERY : SQL ������ ��������, �� ���� ��� SQL ���� 1�� ����
	      JOIN��, �ӵ��� �������� �޸� ���� ���� �߻� => ���ȿ� ��� => View�� ���(����)
	      ������ �˻� => ���Ľ�, �ӵ��� �������� => INDEX(����)�� �̿�
	      ��ȣ(�ߺ�X) => �ڵ�������ȣ �̿� => SEQUENCE
	      abclfjlhegflslksdsdf(���̺���� ����� ���) => alpha(��Ī) => Synonym
	      ������ ��� �ݺ��� ���� => �޼ҵ�
	      => PL/SQL => ���ν���
	   => �����ͺ��̽� �𵨸�(����ȭ)
	   
	   => ������
	      ��������� : ����� ó��(+:���ڿ� ����(X) => CONCAT Ȥ�� || ���)
	                  / => ����/����=�Ǽ�
	                  '10'+'20"=30
	                  ---- ----
	                  TO_NUMBER('10')=10 => �ڵ����� ����
	      �񱳿����� : =, <> : ��¥�� ���ڿ��� ���� �� �ִ�
	      �������� : AND(���� ����), OR(������ ��� ���)
	                  &&(�Է� �ޱ�)   ||(���ڿ� ����)
	      NOT : !�� ����� �� ����
	      NULL : ����ó���� �� �� ���� => IS NULL, IS NOT NULL
	      BETWEEN : �Ⱓ, ���� ���� => ����(�̻�, ����)
	      IN : OR�� ������ ���ÿ�
	      LIKE : ���Ե� ���ڿ� => �˻�
	             % : ���� ���� ����
	             _ : �� ����
	             
	   => �����Լ�
	      ������ �Լ� : ROW ������ ó��
	      	������
	      		UPPER : �빮�� ��ȯ => UPPER('abc') => ABC
	      		LENGTH : ���� ���� => LENGTH('ȫ�浿') => 3
	      		REPLACE : ���� ���� => REPLACE('ABCD','A','K') => KBCD
	      		=> REPLACE(���ڿ�,ã�� ����,���� ����) => ���� ���� ������ ����
	      		=> ũ�Ѹ�(�̹��� => http(&,||�� ���Ե� �� �ִ�)) => ^�� ���� �� ����
	      		SUBSTR : ���ڸ� �ڸ��� ��� => SUBSTR('abcdef',1,3) => abc
	      		=> SUBSTR(���ڿ�,������ġ,����)
	      		   �ڹ��� ���ڿ� �ε��� ��ȣ�� 0������, ����Ŭ�� 1������ �����Ѵ�
	      		INSTR : ���ڿ��� �ε��� ��ȣ
	      		=> INSTR('ABCDABC','A',1,1) => 1
	      		=> INSTR('ABCDABC','A',1,2) => 5	      		                              
	      		=> INSTR(���ڿ�,ã�� ����,���� �ε���,������ ��ġ)
	      		RPAD : ���ڿ� ������ ������ ���� ��� => ID�� PWD ã�⿡ ���
	      		=> RPAD(SUBSTR(id,1,2),LENGTH(id),'*') => admin => ad***
	      		=> RPAD('ABC',7,'*') => ABC****
	      		=> RPAD('ABCDEFG',5,'*') => ABCDE => ���� ������ŭ�� ����Ѵ�
	      		=> RPAD(���ڿ�,���� ����,���� ����)
	      		
	      	������
	      		MOD : ������ ������ ��(%)
	      		=> MOD(5,2) => 5%2 => 1
	      		ROUND : �ݿø�
	      		=> ROUND(�Ǽ�,�Ҽ��� �ڸ���)
	      		=> ROUND(78.678,2) => 78.68 => �Ҽ��� 2�ڸ� ������ ���� �Ǻ�
	      		TRUNC : ����
	      		=> TRUNC(78.678,2) => 78.67
	      		CEIL : �ø� => ������Ʈ ����¡ ���
	      		=> �������� ���ϱ�
	      		=> CEIL(14/10) => 2
	      		
	      	��¥��
	      		SYSDATE : �ý����� �ð�, ��¥
	      		=> �����̱� ������ ������� ����
	      		=> SYSDATE+1...
	      		=> ���ó(������� �ڵ����� �Ǻ�)
	      		   �Խ���, ���, ȸ�� ����, ����...
	      		MONTHS_BETWEEN : �Ⱓ�� ������
	      		=> MONTHS_BETWEEN(����,����)
	      		=> MONTHS_BETWEEN('23/11/09',����) => ��¥�� ���� �� �� �ִ�
	      		ADD_MONTHS : ������ ���� �߰��Ͽ� ��¥ ����
	      		=> ������ ���� ��¥
	      		=> 1���� ����
	      		=> ADD_MONTHS(SYSDATE,6) => 6���� ���� ��¥
	      		
	      	��ȯ��
	      		TO_CHAR
	      		1) ���� => ���ڿ� ����
	      		   L999,999 => ��999,999
	      		   $999,999
	      		   1,000,000
	      		   => õ ������ �޸��� ������
	      		2) ��¥ => ���ڿ� ����
	      		   ���������� ��¥ ��½� �ַ� ���
	      		   d : �� => 1~31
	      		   dd : �� => 01,02...10~
	      		   yy : �⵵ => 23
	      		   yyyy : �⵵ => 2023
	      		   rr : �⵵ => 23
	      		   rrrr : �⵵ => 2320 => Y2K
	      		   m/mm : month
	      		   hh/hh24 : 1~12/1~24
	      		   mi/MI : ��
	      		   s/ss : ��
	      		   dy : ����
	      		=> TO_CHAR ����, �ڹٿ����� String���� �޾ƾ� �Ѵ�
	      		   
	      	��Ÿ��
	      		NVL : NULL���� ���ϴ� �����ͷ� �����ؼ� ���
	      		=> NVL(�÷���,��ü��)
	      		=> NVL(comm,0) => comm���� NULL�� ��� 0���� ����
	      		=> �����ȣ => ������ NULL���� ��찡 �ִ� => '',�������� ����
	      		   �������� NULL�� ���,NULL�� ����Ѵ�
	      		DECODE : ���� ���ǹ� => switch
	      		=> DECODE(deptno,10,'������'
	      		                 20,'���ߺ�'
	      		                 30,'�ѹ���')
	      		   ���� => DECODE(score,1,'�ڡ١١١�'
	      		                       2,'�ڡڡ١١�'
	      		                       ...)
	      		CASE : ���� ���ǹ� => if~else if~...
	      		=> CASE
	      		       WHEN deptno=10 THEN '���ߺ�'
	      		       WHEN deptno=20 THEN '������'
	      		       WHEN deptno=30 THEN '�ѹ���'
	      		   END "dname"
	      	
	      ������ �Լ� : �÷�(������) ������ ó��
	      
*/
-- SELECT * FROM orders;
-- SELECT * FROM emp WHERE empno=&sabun;
-- SELECT RPAD('ABC',7,'*'),RPAD('ABCDEFG',5,'#') FROM dual;
-- SELECT ename,TO_CHAR(sal,'L999,999') FROM emp;
-- SELECT ename,TO_CHAR(sal,'999,999')||'��' FROM emp;
-- SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'RRRR-MM-DD') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'HH:MI:SS') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'DY') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'YYYY"�⵵" MM"��" DD"��" HH24"��" MI"��" SS"��" DY"����"') FROM dual;

-- ����� ���� ���Ͽ� �Ի縦 �ߴ���
-- SELECT ename,TO_CHAR(hiredate,'dy') FROM emp;
-- SELECT ename,TO_CHAR(hiredate,'dy') FROM emp WHERE TO_CHAR(hiredate,'dy')='��';
-- SELECT ename,job,hiredate,DECODE(deptno,10,'������',20,'���ߺ�',30,'�ѹ���') "dname" FROM emp;
/*
SELECT ename,job,hiredate,CASE WHEN deptno=10 THEN '���ߺ�'
	      		       WHEN deptno=20 THEN '������'
	      		       WHEN deptno=30 THEN '�ѹ���'
	      		   END "dname" FROM emp;
*/