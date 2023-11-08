-- 오라클 : 내장함수
-- DDL(table 제작 => DML(INSERT, UPDATE, DELETE))
-- VIEW / SEQUENCE / INDEX
-- PL/SQL(FUNCTION, PROCEDURE, TRIGGER)
-- 데이터베이스 모델링
/*
	내장 함수
	=> 오라클에서 지원하는 라이브러리, 사용자 정의 함수(Function) => 업체마다 따로 가지고있다
	=> 함수 : 재사용
	     --------------> 모든 영역에 댓글이 가능하게 한다
	=> 오라클에서 지원하는 내장 함수
	     1. 단일행 함수
	        ROW단위로 처리 => 한 줄씩
	        문자 함수 : String
	        => 변환 함수
		 ***1) UPPER : 대문자 변환 => UPPER('')
		 2) LOWER : 소문자 변환 => LOWER('')
		 3) INITCAP : 이니셜 변환 => INITCAP('')
		    => ABC => Abc(첫 자만 대문자로 바꾼다)
	        => 제어 함수
		 1) CONCAT : 문자열 결합
		    CONCAT('A','B') => 'AB' ===> 'A'||'B'
		 ***2) REPLACE : 변경
		       REPLACE('Hello Oracle','l','k') => Hekko Oracke
			      ---------------
			      원본(column을 쓸 수 있다), 변경 대상, 변경할 문자
		 ***3) SUBSTR : 문자를 자르는 경우(추출) => substring
		        SUBSTR('Hello Oracle',1,3) => Hel
				           ----- 1번째 글자부터 3글자
		        자바 : 문자열 인덱스 번호 => 0번부터 시작
		        오라클 : 1번부터 시작
		 ***4) INSTR : 문자가 몇 번째 위치에 있는지 확인
		        INSTR('ABCDEFG','D',1,1)
				     --------
				     찾는 문자, 시작 위치, 몇 번째
		        INSTR('ABCDABCD','A',1,2) => 두 개의 A중 두 번째 A를 찾는다
		 5) LPAD : 문자의 갯수가 부족할시 앞에 지정된 문자를 출력
		    abcdefg(7글자) => 12글자 요청 => *****abcdefg
		    LPAD('ABC',10,'#') => #######ABC
			       -----
			       출력할 글자의 갯수, 부족한 글자 갯수만큼 채워넣을 문자
		 ***6) RPAD
		        RPAD('ABC',10'*') => ABC*******
		 7) LTRIM : 왼쪽에 있는 문자 제거
		    LTRIM('ABCDA') => 문자를 지정하지 않을시 왼쪽 공백 제거 => ABCDA
		    LTRIM('ABCDA','A') => 왼쪽에 있는 A제거 => BCDA
		 8) RTRIM : 오른쪽에 있는 문자 제거
		    RTRIM('ABCDA','A') => ABCD
		   ### TRIM('A' FROM 'ABCDA') => BCD
		 9) ASCII : 문자를 번호로 변경
		    ASCII('A') => 65
		 10) CHR : 번호를 문자로 변경
		      CHR(97) => a
		 ***11) LENGTH : 문자 갯수
		         LENGTH('ABC') => 3
		         LENGTH('홍길동') => 3
		         => LENGTHB : 바이트 수
		=> 함수
		     1) SELECT 뒤에 사용
		        SELECT ename,LENGTH(ename) FROM emp;
		        => 컬럼 대신 사용 가능
		     2) WHERE 뒤에 사용
		        SELECT ename FROM emp WHERE LENGTH(ename)=5;
		     3) GROUP BY 뒤에 사용
		     4) ORDER BY 뒤에 사용

	        숫자 함수 : Math
		1) MOD => 나머지(%)
		   MOD(5,2) => 5%2 => 1
		   SELECT empno,ename FROM emp WHERE MOD(empno,2)=0; => 사번이 짝수인 사원만 출력
		***2) ROUND => 반올림
		      ROUND(123.5678,2) => 123.57
			          -- 소수점 이하 두 자리를 잘라 반올림
		3) TRUNC => 버림
		   TRUNC(1234.5678,2) => 1234.56
		***4) CEIL => 올림
		      => 총페이지 구하기
		      CEIL(1234.123) => 1235 => 소수점이 1이상(0이 아닐때)

	        날짜 함수 : Date
	        ***1) SYSDATE : 시스템의 날짜와 시간
	           => 정수와 같다
	           어제 SYSDATE-1
	           내일 SYSDATE+1
	        ***2) MONTHS_BETWEEN : 현재부터 ~ 과거까지의 개월 수
	              23/11/07~22/12/07 => 퇴직금, 연차, 호봉
	        ***3) ADD_MONTHS => 달을 추가
	              ADD_MONTHS(SYSDATE,1)
	              ADD_MONTHS('23/09/11',7)
	        4) NEXT_DAY
	           NEXT_DAY(SYSDATE,'수') => 오늘 날짜부터 수요일이 되는 날이 몇일인가
	        5) LAST_DAY => 지정한 달의 마지막일
	           LAST_DAY(SYSDATE)
	        
	        변환 함수 : Format
	        ***1) TO_CHAR : 문자 변환 => 숫자, 날짜...
	              String.valueOf()
	              숫자 변환 => 1,000
	        2) TO_NUMBER : 문자를 숫자로 변환 => Integer.paresInt() 
	        3) TO_DATE => 날짜 변환
	        
	        기타 함수 : if, switch~case

	     2. 집합행 함수
	        도메인단위로 처리 => 분석, 통계(평균, 총합, 최대값, 최소값, ROW갯수 확인)
*/
-- SELECT UPPER(ename) "대문자",LOWER(ename) "소문자",INITCAP(ename) "이니셜" FROM emp;
-- SELECT empno,ename,hiredate FROM emp WHERE ename=UPPER('king');
-- SELECT ename,SUBSTR(hiredate,1,2) "입사연도" FROM emp;
-- SELECT ename,SUBSTR(hiredate,7,2) "입사일자" FROM emp;
-- SELECT INSTR('ABCDABCD','A',1,1) FROM dual;
-- SELECT INSTR('ABCDABCD','A',1,2) FROM dual;
-- SELECT ename,RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') FROM emp;
-- SELECT ASCII('K'),CHR(68) FROM dual;
-- SELECT LTRIM('ABCDA','A'),RTRIM('ABCDA','A') FROM dual;
-- SELECT ename,LENGTH(ename) "글자수" FROM emp;
-- SELECT ename FROM emp WHERE LENGTH(ename)=5;
-- SELECT ROUND(1234.5678,2) FROM dual;
-- SELECT CEIL(14/10.0) FROM dual;
-- SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM dual;
-- SELECT NEXT_DAY(SYSDATE,'화'),NEXT_DAY(SYSDATE,'수') FROM dual;
-- SELECT LAST_DAY(SYSDATE) FROM dual;
-- SELECT LAST_DAY('23/10/01') FROM dual;
-- SELECT SYSDATE,ADD_MONTHS(SYSDATE,3) FROM dual;
-- SELECT ename,hiredate,TRUNC(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)/12.0)) "근무 년도" FROM emp;
-- SELECT ename,hiredate,empno FROM emp WHERE empno=7788;
-- SELECT ename,hiredate,empno FROM emp WHERE empno='7788';
-- SELECT ename,hiredate,empno FROM emp WHERE empno=TO_NUMBER('7788');
-- SELECT ename,sal,TO_CHAR(sal,'L999,999') FROM emp;