-- 오라클 SQL => DML(129page)
/*
   DQL : SELECT
           = 형식
           = 조건 => 셀렉션
              => 연산자
              => 내장 함수
           = 테이블 연결 => 데이터 추출(JOIN)
           = SQL문장을 합친다 => 서브쿼리
   DDL : 테이블 생성 => 키의 종류
   DML(TCL) => 추가, 수정, 삭제
   ------------------------------------------------- 기초
   View : 가상테이블
   INDEX : 최적화
   SEQUENCE, 시노임
   PL/SQL
   데이터베이스 모델링
   
   bit => byte => word => record => table
   용어
   --------------------------------------------------------------------
	데이터베이스	실무		같은 의미
   --------------------------------------------------------------------
	릴레이션		테이블		파일
   --------------------------------------------------------------------
	속성		컬럼		필드(멤버변수)
   --------------------------------------------------------------------
	튜플		ROW/RECORD	객체(인스턴스) => 한 줄(클래스 객체)
   --------------------------------------------------------------------

	테이블 => emp(사원정보) => 오라클에서 지원(연습용 테이블)
	=> 컬럼(8개), ROW(14개) => 14명에 대한 정보
                 ------------
                  DESC table명 => 컬럼명과 데이터형 확인
                  *** 데이터형(CHAR, VARCHAR2, CLOB => 문자열) => ''
	          (DATE) = 날짜형 => 저장은 문자열로 한다
	          (NUMBER) = 숫자형 => int, double(정수, 실수)
	
	emp 테이블의 구조
	컬럼명		데이터형
	EMPNO		NOT NULL NUMBER(4)	정수		사원번호
 	ENAME		VARCHAR2(10)		문자열		이름
	JOB		VARCHAR2(9)		문자열		직위
 	MGR      		NUMBER(4)		정수		사수번호
 	HIREDATE 	DATE			날짜형		입사일
 	SAL     		NUMBER(7,2)		정수,실수		급여
 	COMM  		NUMBER(7,2)		정수,실수		성과급
 	DEPTNO		NUMBER(2)		정수		부서번호
	----------------------------------------------------------------------------------------- 8개의 정보(한 사원당) => 총 사원수는 14명
	=> 프로그램에 필요한 데이터 추출 => SELECT

	1) SELECT : 데이터 추출(필요한 데이터 검색)
	   = SQL문장은 문자열로 되어있다 => 형식을 익히는데 주력
	      1. 형식(순서) => 대소문자 구분(X) => 가급적이면 키워드는 대문자를 사용한다
	         ------------------------------------
	         SELECT * | column1,column2...
	         FROM table_name;
	         [
	             WHERE 조건문
	                       -------- 연산자
	             GROUP BY group_column => 입사년도별, 부서별, 직위별...
	             HEVING 그룹조건 => GROUP BY가 있는 경우에만 사용 가능
	             ORDER BY 정렬 (ASC|DESC)
	             => INDEX를 이용할 수 있다
	         ]
*/
-- emp에 있는 모든 데이터를 출력
-- SELECT * FROM emp;
-- emp에서 원하는 데이터만 출력(이름, 직위, 입사일, 급여)
-- SELECT ename,job,hiredate,sal FROM emp;
/*
   SELECT ename "이름",hiredate "입사일",sal "급여" FROM emp;
   SELECT ename as 이름,hiredate as 입사일,sal as 급여 FROM emp;
*/
-- SELECT ename "이름",hiredate "입사일",sal "급여" FROM emp;
-- SELECT ename as 이름,hiredate as 입사일,sal as 급여 FROM emp;
-- 부서번호
-- SELECT deptno FROM emp;
-- 중복제거 => 가수명, 장르... => DISTINCT 뒤에는 컬럼 1개만 적용
-- SELECT DISTINCT deptno FROM emp;
-- SELECT DISTINCT job FROM emp;
-- 1. book 테이블 확인
-- DESC book;
/*
 BOOKID		NOT NULL NUMBER(2)	구분자
 BOOKNAME	VARCHAR2(40)		책이름
 PUBLISHER	VARCHAR2(40)		출판사
 PRICE		NUMBER(8)		가격
*/
-- 2. 모든 도서의 도서명과 가격 출력
-- SELECT bookname,price FROM book;
-- 출판사 출력
SELECT publisher FROM book;
SELECT DISTiNCT publisher FROM book;