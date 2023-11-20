-- ����Ŭ : �����Լ�
-- DDL(table ���� => DML(INSERT, UPDATE, DELETE))
-- VIEW / SEQUENCE / INDEX
-- PL/SQL(FUNCTION, PROCEDURE, TRIGGER)
-- �����ͺ��̽� �𵨸�
/*
	���� �Լ�
	=> ����Ŭ���� �����ϴ� ���̺귯��, ����� ���� �Լ�(Function) => ��ü���� ���� �������ִ�
	=> �Լ� : ����
	     --------------> ��� ������ ����� �����ϰ� �Ѵ�
	=> ����Ŭ���� �����ϴ� ���� �Լ�
	     1. ������ �Լ�
	        ROW������ ó�� => �� �پ�
	        ���� �Լ� : String
	        => ��ȯ �Լ�
		 ***1) UPPER : �빮�� ��ȯ => UPPER('')
		 2) LOWER : �ҹ��� ��ȯ => LOWER('')
		 3) INITCAP : �̴ϼ� ��ȯ => INITCAP('')
		    => ABC => Abc(ù �ڸ� �빮�ڷ� �ٲ۴�)
	        => ���� �Լ�
		 1) CONCAT : ���ڿ� ����
		    CONCAT('A','B') => 'AB' ===> 'A'||'B'
		 ***2) REPLACE : ����
		       REPLACE('Hello Oracle','l','k') => Hekko Oracke
			      ---------------
			      ����(column�� �� �� �ִ�), ���� ���, ������ ����
		 ***3) SUBSTR : ���ڸ� �ڸ��� ���(����) => substring
		        SUBSTR('Hello Oracle',1,3) => Hel
				           ----- 1��° ���ں��� 3����
		        �ڹ� : ���ڿ� �ε��� ��ȣ => 0������ ����
		        ����Ŭ : 1������ ����
		 ***4) INSTR : ���ڰ� �� ��° ��ġ�� �ִ��� Ȯ��
		        INSTR('ABCDEFG','D',1,1)
				     --------
				     ã�� ����, ���� ��ġ, �� ��°
		        INSTR('ABCDABCD','A',1,2) => �� ���� A�� �� ��° A�� ã�´�
		 5) LPAD : ������ ������ �����ҽ� �տ� ������ ���ڸ� ���
		    abcdefg(7����) => 12���� ��û => *****abcdefg
		    LPAD('ABC',10,'#') => #######ABC
			       -----
			       ����� ������ ����, ������ ���� ������ŭ ä������ ����
		 ***6) RPAD
		        RPAD('ABC',10'*') => ABC*******
		 7) LTRIM : ���ʿ� �ִ� ���� ����
		    LTRIM('ABCDA') => ���ڸ� �������� ������ ���� ���� ���� => ABCDA
		    LTRIM('ABCDA','A') => ���ʿ� �ִ� A���� => BCDA
		 8) RTRIM : �����ʿ� �ִ� ���� ����
		    RTRIM('ABCDA','A') => ABCD
		   ### TRIM('A' FROM 'ABCDA') => BCD
		 9) ASCII : ���ڸ� ��ȣ�� ����
		    ASCII('A') => 65
		 10) CHR : ��ȣ�� ���ڷ� ����
		      CHR(97) => a
		 ***11) LENGTH : ���� ����
		         LENGTH('ABC') => 3
		         LENGTH('ȫ�浿') => 3
		         => LENGTHB : ����Ʈ ��
		=> �Լ�
		     1) SELECT �ڿ� ���
		        SELECT ename,LENGTH(ename) FROM emp;
		        => �÷� ��� ��� ����
		     2) WHERE �ڿ� ���
		        SELECT ename FROM emp WHERE LENGTH(ename)=5;
		     3) GROUP BY �ڿ� ���
		     4) ORDER BY �ڿ� ���

	        ���� �Լ� : Math
		1) MOD => ������(%)
		   MOD(5,2) => 5%2 => 1
		   SELECT empno,ename FROM emp WHERE MOD(empno,2)=0; => ����� ¦���� ����� ���
		***2) ROUND => �ݿø�
		      ROUND(123.5678,2) => 123.57
			          -- �Ҽ��� ���� �� �ڸ��� �߶� �ݿø�
		3) TRUNC => ����
		   TRUNC(1234.5678,2) => 1234.56
		***4) CEIL => �ø�
		      => �������� ���ϱ�
		      CEIL(1234.123) => 1235 => �Ҽ����� 1�̻�(0�� �ƴҶ�)

	        ��¥ �Լ� : Date
	        ***1) SYSDATE : �ý����� ��¥�� �ð�
	           => ������ ����
	           ���� SYSDATE-1
	           ���� SYSDATE+1
	        ***2) MONTHS_BETWEEN : ������� ~ ���ű����� ���� ��
	              23/11/07~22/12/07 => ������, ����, ȣ��
	        ***3) ADD_MONTHS => ���� �߰�
	              ADD_MONTHS(SYSDATE,1)
	              ADD_MONTHS('23/09/11',7)
	        4) NEXT_DAY
	           NEXT_DAY(SYSDATE,'��') => ���� ��¥���� �������� �Ǵ� ���� �����ΰ�
	        5) LAST_DAY => ������ ���� ��������
	           LAST_DAY(SYSDATE)
	        
	        ��ȯ �Լ� : Format
	        ***1) TO_CHAR : ���� ��ȯ => ����, ��¥...
	              String.valueOf()
	              ���� ��ȯ => 1,000
	        2) TO_NUMBER : ���ڸ� ���ڷ� ��ȯ => Integer.paresInt() 
	        3) TO_DATE => ��¥ ��ȯ
	        
	        ��Ÿ �Լ� : if, switch~case

	     2. ������ �Լ�
	        �����δ����� ó�� => �м�, ���(���, ����, �ִ밪, �ּҰ�, ROW���� Ȯ��)
*/
-- SELECT UPPER(ename) "�빮��",LOWER(ename) "�ҹ���",INITCAP(ename) "�̴ϼ�" FROM emp;
-- SELECT empno,ename,hiredate FROM emp WHERE ename=UPPER('king');
-- SELECT ename,SUBSTR(hiredate,1,2) "�Ի翬��" FROM emp;
-- SELECT ename,SUBSTR(hiredate,7,2) "�Ի�����" FROM emp;
-- SELECT INSTR('ABCDABCD','A',1,1) FROM dual;
-- SELECT INSTR('ABCDABCD','A',1,2) FROM dual;
-- SELECT ename,RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') FROM emp;
-- SELECT ASCII('K'),CHR(68) FROM dual;
-- SELECT LTRIM('ABCDA','A'),RTRIM('ABCDA','A') FROM dual;
-- SELECT ename,LENGTH(ename) "���ڼ�" FROM emp;
-- SELECT ename FROM emp WHERE LENGTH(ename)=5;
-- SELECT ROUND(1234.5678,2) FROM dual;
-- SELECT CEIL(14/10.0) FROM dual;
-- SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM dual;
-- SELECT NEXT_DAY(SYSDATE,'ȭ'),NEXT_DAY(SYSDATE,'��') FROM dual;
-- SELECT LAST_DAY(SYSDATE) FROM dual;
-- SELECT LAST_DAY('23/10/01') FROM dual;
-- SELECT SYSDATE,ADD_MONTHS(SYSDATE,3) FROM dual;
-- SELECT ename,hiredate,TRUNC(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)/12.0)) "�ٹ� �⵵" FROM emp;
-- SELECT ename,hiredate,empno FROM emp WHERE empno=7788;
-- SELECT ename,hiredate,empno FROM emp WHERE empno='7788';
-- SELECT ename,hiredate,empno FROM emp WHERE empno=TO_NUMBER('7788');
-- SELECT ename,sal,TO_CHAR(sal,'L999,999') FROM emp;