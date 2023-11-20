-- 오라클 2일차 => 연산자 / 내장함수 / ORDER BY
/*
   => 조인
   => 서브쿼리
   => DDL(Table 생성)
   1) DQL : 검색(웹사이트의 핵심기능)
                     목록 출력, 로그인, 상세보기, 예약, 결제, 페이징...
      => 명령어 : SELECT
           테이블의 구조 : 데이터를 저장하는 공간(파일)
           데이터베이스 : 폴더 => 자동 생성(XE)
           테이블 : 파일(파일시스템 => DBMS)
           1. 테이블의 구조
              => COLUMN + ROW => 2차원 구조
              CREATE TABLE member(
                  id VARCHAR2(10),
                  name VARCHAR2(50),
                  sex VARCHAR2(10),
                  phone VARCHAR2(20),
                  address VARCHAR2(100)
              )          ||
              class Member{
                  String id;
                  String name;
                  String sex;
                  String phone;
                  String address;
              }
              -----------------------------------------------------------------
	    id	name	sex	phone		address	=> COLUMN
              -----------------------------------------------------------------
	    aaa	홍길동	남자	1111-1111	서울	=> ROW(인스턴스)
	    Member m1=new Member();
	    m1.id="aaa";
              -----------------------------------------------------------------
	    bbb	심청이	여자	2222-2222	경기	=> ROW(인스턴스)
              -----------------------------------------------------------------
              => 데이터별로 구분이 되어있다(관리가 쉽다)
              => 데이터 읽기 / 쓰기가 편리하다
              => 전체 데이터 읽기 / 원하는 데이터만 추출 / 지정된 데이터만 추출
                   SELECT * / SELECT column1,column2 / SELECT * FROM emp WHERE...
              
              검색하는 명령어 SELECT의 형식
              SELECT * | column1,column2...
              FROM table_name
              [
                  WHERE 조건절 => 연산자
                  -------------------------------------
                  GROUP BY 그룹 => 그룹별 처리 => 단독으로 사용 가능
                  HAVING => 단독으로 사용 불가능(GROUP BY가 있어야 사용 가능)
                  -------------------------------------
                  ORDER BY 컬럼명 => 정렬(ASC|DESC)
              ]

              => 연산처리(조건문)
                   1. 산술연산자(+, -, *, /)
                      + : 산술만 가능하다(문자열 결합 X => ||)
                      / : 정수/정수=실수
                      => 조건문보다 SELECT 뒤에서 주로 통계 (컬럼단위의 연산처리함수는 있으나, 로우단위는 없다 => 산술연산자로 해야한다)
                   2. 비교연산자 : =, <>(!=), <, >, <=, >=
                   3. 논리연산자 : AND, OR
                   4. 대입연산자 : =
                      => WHERE 뒤에 = (같다)
                      => 다른 곳에 = (대입)
                           UPDATE table_name
                           SET name='' => 대입
                           WHERE id=''; => 같다
                   5. IN : OR가 여러개 사용
                            deptno=10 OR deptno=20 OR deptno=30 OR deptno=40 OR deptno=50
                            => deptno IN (10,20,30,40,50)
                            => 최대한 SQL문장을 줄여야한다, 검색 속도
                   6. NULL : 데이터가 없는 상태
                                => 데이터가 NULL일때는 연산처리가 안된다
                                => IS NULL => NULL이라면
                                => IS NOT NULL => NULL이 아니라면
                                => 자바에서는 NULL을 제어하면 오류 발생
                                     String name=null;
                                     if(name.equals("aaa")) => NullPointerException
                   7. BETWEEN : >= AND <=
                                     기간, 범위 => 페이징
                   8. NOT : 부정 반대의 효과
                              NOT IN, NOT BETWEEN, NOT LIKE
                   9. LIKE : 유사문자열 검색
                              % => 문자의 갯수 제한이 없다
                              _ => 한 글자
                              'A%' => A로 시작하는 모든 문자열
                              '%A' => A로 끝나는 모든 문자열
                              '%A%' => A를 포함하는 모든 문자열 => 검색, 우편번호 찾기
                              => 1차(오라클 => SQL) : 우편번호를 만들어서 처리
                              => 2차(기술) : Daum에서 제공하는 라이브러리 사용
                              '_A%' => 두 번째 글자가 A인 모든 문자열
                              '__A__' => 세 번째 글자가 A인 다섯 글자를 가진 문자열

                   다중검색
                   ----------
                   A, B, C, D, E
                   WHERE ename LIKE '%A%'
                   OR ename LIKE '%B%'
                   OR ename LIKE '%C%'
                   OR ename LIKE '%D%'
                   OR ename LIKE '%E%'

                   WHERE REGEXP_LIKE(ename,'A|B|C|D|E')

              => 내장함수

   2) DDL : 테이블 생성, 뷰 생성, 시퀀스 생성, 인덱스 생성
              생성 : CREATE
              삭제 : DROP
              수정 : ALTER
   3) DML : 추가, 수정, 삭제
               INSERT, UPDATE, DELETE
   4) TCL : 일괄 처리 => 한 번에 저장, 명령어 취소
                                COMMIT, ROLLBACK
   5) DCL : 사용자 계정(hr)
              ------------------ 제약이 많이 있다
              GRANT(권한 부여), REVOKE(권한 해제)
              -------------------------------------------
              system / sysdba => 권한 부여
              conn system/happy
              conn hr/happy
*/
-- 1. 데이터를 검색 => table, column, 데이터형 확인 => DESC table_name
-- 웹 => tomcat => web.xml(프레임워크 등록)
-- DESC book;
/*
BOOKID		NOT NULL NUMBER(2) => 구분자(primary key) 중복이 없다
BOOKNAME	VARCHAR2(40)
PUBLISHER	VARCHAR2(40)
PRICE		NUMBER(8)

	A~Z
	A B C
	SELECT * FROM board;
	--------------------------
	자바로 저장 => 브라우저로 전송
	setA()~setZ()
*/
-- SELECT : 원하는 데이터만 출력 => 책이름과 가격을 출력
-- SELECT bookname,price FROM book;
-- 가격이 20000원 미만인 도서명 출력
-- SELECT bookname FROM book WHERE price<20000;
-- 가격이 12000이상 20000이하인 책이름,가격을 출력
/*
SELECT bookname,price FROM book WHERE price>=12000 AND price<=20000;
SELECT bookname,price FROM book WHERE price BETWEEN 12000 AND 20000;
BETWEEN~AND보다 >=, <=가 속도가 빠르다
*/
/*
-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
SELECT bookname FROM book WHERE publisher='굿스포츠' OR publisher='대한미디어';
SELECT bookname FROM book WHERE publisher IN ('굿스포츠','대한미디어');
-- '축구의 역사'를 출간한 출판사를 검색
SELECT publisher FROM book WHERE bookname='축구의 역사';
-- 도서이름에 '축구'가 포함된 출판사를 검색
SELECT publisher FROM book WHERE bookname LIKE '%축구%';
-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색
SELECT bookname FROM book WHERE bookname LIKE '_구%';
-- 축구에 관한 도서중 가격이 20000원 이상인 도서를 검색
SELECT bookname FROM book WHERE price>=20000 AND bookname LIKE '%축구%';
*/
