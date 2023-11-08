-- 오라클 3일차 => 내장함수
/*
	SELECT 문장 => DQL(데이터 검색)
	=> 관련된 데이터를 모아두는 장소 : 테이블
	   사원 정보, 회원 정보, 맛집 정보, 여행 정보...
	   정보를 저장하기 위해 => 컬럼(멤버변수)
	   컬럼 => 데이터형(숫자(int, double), 문자(char, String), 날짜(Date))
	   => 컬럼 밑에 데이터를 첨부 => ROW
	   => 확인
	      DESC table_name => 컬럼명과 데이터형 확인
	      => user_tables => 오라클에 저장
	         ----------- user_views...
	      => 모든 테이블은 대문자로 저장
	      => 테이블 생성(같은 데이터베이스(XE)) => 테이블이 중복 없이
	         SELECT * FROM tab => 어떤 테이블이 생성되어 있는지 확인
	1) 형식
	   SELECT * | column1,column2... --------------- 5 => 내장함수
	   FROM table_name --------------- 1
	   [
	       WHERE 조건문 --------------- 2 => 연산자
	       ---------
	       GROUP BY  --------------- 3
	       HAVING --------------- 4
	       ---------
	       ORDER BY --------------- 6
	   ]
	   
	   => 그룹별 처리 GROUP BY
	   => 테이블을 연결해서 필요한 데이터 추출 => JOIN
	      예약 ===> 회원 정보 / 영화 정보
	      ---- id / mno(fk) => 회원의 모든 정보 / 영화의 모든 정보
	      
	      customer / book / orders
	      사용자 정보 / 책 정보 / 구매 정보
	   
	   => SUBQUERY : SQL 문장이 여러개면, 한 개로 묶어서 SQL 문장 1번 수행
	      JOIN시, 속도가 느려지고 메모리 누수 현상 발생 => 보안에 취약 => View를 사용(보완)
	      데이터 검색 => 정렬시, 속도가 느려진다 => INDEX(색인)를 이용
	      번호(중복X) => 자동증가번호 이용 => SEQUENCE
	      abclfjlhegflslksdsdf(테이블명이 어려울 경우) => alpha(별칭) => Synonym
	      문장이 계속 반복적 수행 => 메소드
	      => PL/SQL => 프로시저
	   => 데이터베이스 모델링(정규화)
	   
	   => 연산자
	      산술연산자 : 산술만 처리(+:문자열 결합(X) => CONCAT 혹은 || 사용)
	                  / => 정수/정수=실수
	                  '10'+'20"=30
	                  ---- ----
	                  TO_NUMBER('10')=10 => 자동으로 변경
	      비교연산자 : =, <> : 날짜와 문자열도 비교할 수 있다
	      논리연산자 : AND(범위 포함), OR(범위를 벗어난 경우)
	                  &&(입력 받기)   ||(문자열 결합)
	      NOT : !를 사용할 수 없다
	      NULL : 연산처리를 할 수 없다 => IS NULL, IS NOT NULL
	      BETWEEN : 기간, 범위 설정 => 포함(이상, 이하)
	      IN : OR를 여러개 사용시에
	      LIKE : 포함된 문자열 => 검색
	             % : 문지 제한 없음
	             _ : 한 글자
	             
	   => 내장함수
	      단일행 함수 : ROW 단위로 처리
	      	문자형
	      		UPPER : 대문자 변환 => UPPER('abc') => ABC
	      		LENGTH : 문자 갯수 => LENGTH('홍길동') => 3
	      		REPLACE : 문자 변경 => REPLACE('ABCD','A','K') => KBCD
	      		=> REPLACE(문자열,찾는 문자,변경 문자) => 여러 문자 변경이 가능
	      		=> 크롤링(이미지 => http(&,||가 포함될 수 있다)) => ^로 변경 후 저장
	      		SUBSTR : 문자를 자르는 경우 => SUBSTR('abcdef',1,3) => abc
	      		=> SUBSTR(문자열,시작위치,갯수)
	      		   자바의 문자열 인덱스 번호는 0번부터, 오라클은 1번부터 시작한다
	      		INSTR : 문자열의 인덱스 번호
	      		=> INSTR('ABCDABC','A',1,1) => 1
	      		=> INSTR('ABCDABC','A',1,2) => 5	      		                              
	      		=> INSTR(문자열,찾는 문자,시작 인덱스,문자의 위치)
	      		RPAD : 문자열 우측에 지정된 문자 출력 => ID나 PWD 찾기에 사용
	      		=> RPAD(SUBSTR(id,1,2),LENGTH(id),'*') => admin => ad***
	      		=> RPAD('ABC',7,'*') => ABC****
	      		=> RPAD('ABCDEFG',5,'*') => ABCDE => 문자 갯수만큼만 출력한다
	      		=> RPAD(문자열,문자 갯수,지정 문자)
	      		
	      	숫자형
	      		MOD : 나누고 나머지 값(%)
	      		=> MOD(5,2) => 5%2 => 1
	      		ROUND : 반올림
	      		=> ROUND(실수,소수점 자릿수)
	      		=> ROUND(78.678,2) => 78.68 => 소수점 2자리 이하의 수를 판별
	      		TRUNC : 버림
	      		=> TRUNC(78.678,2) => 78.67
	      		CEIL : 올림 => 웹사이트 페이징 기법
	      		=> 총페이지 구하기
	      		=> CEIL(14/10) => 2
	      		
	      	날짜형
	      		SYSDATE : 시스템의 시간, 날짜
	      		=> 숫자이기 때문에 산술연산 가능
	      		=> SYSDATE+1...
	      		=> 사용처(등록일을 자동으로 판별)
	      		   게시판, 댓글, 회원 가입, 예약...
	      		MONTHS_BETWEEN : 기간의 개월수
	      		=> MONTHS_BETWEEN(현재,과거)
	      		=> MONTHS_BETWEEN('23/11/09',과거) => 날짜를 직접 줄 수 있다
	      		ADD_MONTHS : 지정한 달을 추가하여 날짜 리턴
	      		=> 지정된 뒤의 날짜
	      		=> 1개월 단위
	      		=> ADD_MONTHS(SYSDATE,6) => 6개월 후의 날짜
	      		
	      	변환형
	      		TO_CHAR
	      		1) 숫자 => 문자열 변경
	      		   L999,999 => ￦999,999
	      		   $999,999
	      		   1,000,000
	      		   => 천 단위로 콤마를 찍을때
	      		2) 날짜 => 문자열 변경
	      		   브라우저에서 날짜 출력시 주로 사용
	      		   d : 일 => 1~31
	      		   dd : 일 => 01,02...10~
	      		   yy : 년도 => 23
	      		   yyyy : 년도 => 2023
	      		   rr : 년도 => 23
	      		   rrrr : 년도 => 2320 => Y2K
	      		   m/mm : month
	      		   hh/hh24 : 1~12/1~24
	      		   mi/MI : 분
	      		   s/ss : 초
	      		   dy : 요일
	      		=> TO_CHAR 사용시, 자바에서는 String으로 받아야 한다
	      		   
	      	기타형
	      		NVL : NULL값을 원하는 데이터로 변경해서 사용
	      		=> NVL(컬럼명,대체값)
	      		=> NVL(comm,0) => comm값이 NULL일 경우 0으로 변경
	      		=> 우편번호 => 번지가 NULL값인 경우가 있다 => '',공백으로 변경
	      		   브라우저는 NULL일 경우,NULL을 출력한다
	      		DECODE : 다중 조건문 => switch
	      		=> DECODE(deptno,10,'영업부'
	      		                 20,'개발부'
	      		                 30,'총무부')
	      		   별점 => DECODE(score,1,'★☆☆☆☆'
	      		                       2,'★★☆☆☆'
	      		                       ...)
	      		CASE : 다중 조건문 => if~else if~...
	      		=> CASE
	      		       WHEN deptno=10 THEN '개발부'
	      		       WHEN deptno=20 THEN '영업부'
	      		       WHEN deptno=30 THEN '총무부'
	      		   END "dname"
	      	
	      집합행 함수 : 컬럼(도메인) 단위로 처리
	      
*/
-- SELECT * FROM orders;
-- SELECT * FROM emp WHERE empno=&sabun;
-- SELECT RPAD('ABC',7,'*'),RPAD('ABCDEFG',5,'#') FROM dual;
-- SELECT ename,TO_CHAR(sal,'L999,999') FROM emp;
-- SELECT ename,TO_CHAR(sal,'999,999')||'원' FROM emp;
-- SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'RRRR-MM-DD') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'HH:MI:SS') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'DY') FROM dual;
-- SELECT TO_CHAR(SYSDATE,'YYYY"년도" MM"월" DD"일" HH24"시" MI"분" SS"초" DY"요일"') FROM dual;

-- 사원이 무슨 요일에 입사를 했는지
-- SELECT ename,TO_CHAR(hiredate,'dy') FROM emp;
-- SELECT ename,TO_CHAR(hiredate,'dy') FROM emp WHERE TO_CHAR(hiredate,'dy')='목';
-- SELECT ename,job,hiredate,DECODE(deptno,10,'영업부',20,'개발부',30,'총무부') "dname" FROM emp;
/*
SELECT ename,job,hiredate,CASE WHEN deptno=10 THEN '개발부'
	      		       WHEN deptno=20 THEN '영업부'
	      		       WHEN deptno=30 THEN '총무부'
	      		   END "dname" FROM emp;
*/