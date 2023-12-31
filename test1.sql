-- 오라클 1일차
/*
   23page => 데이터베이스와 데이터베이스 시스템
                                       ------------------------ 오라클
             데이터베이스 : 필요한 정보를 얻기 위해 논리적으로 연관된 데이터를 모아서 통합
            ---------------- 배열 / 클래스 / 파일 / 사용하기 쉽게 만든 관계형 데이터베이스
   24page => 데이터베이스 시스템
                  => 관련된 데이터를 모아서 관리 : 검색, 추가, 삭제, 수정이 가능하게 만든 시스템
                                ------------------------- CRUD
                                CRUD => Create Read Update Delete
                                                 |        |
                                              추가    읽기(검색)
                                            INSERT  SELECT  UPDATE  DELETE => DML(데이터 조작언어)
                  => Oralce / MYSQL / MSSQL / DB2 / MariaDB
                       -------   ---------                      ----------- 실무(MYSQL,MariaDB)
   25page => 데이터베이스 개념과 특징
                  1) 통합된 데이터(데이터베이스 => 폴더)
                     폴더 : 데이터베이스
                     파일 : 테이블
                     -----
                     정보 저장 => 1|aaa|aaa|aaa|aaa\n
                                       ----------------------- ROW => 데이터가 구분이 되어있다
                                                                  ROW => 한 명, 한 개에 대한 정보를 가지고 있다
                                                                  => Record / Tuple => 자바는 객체
                                                                  => 오라클의 단위는 ROW
                  2) 저장된 데이터 : 저장은 이미지 단위로(보안이 뛰어나다, 저장 용량이 작다) => 하드디스크에 저장
                     데이터베이스 시스템
                     ------------------------
                     응용 프로그램(클라이언트)
                              | => 요청 => SQL(오라클 통신) => JDBC
                              |      = DML(SELECT, INSERT, UPDATE, DELETE)
                              |      = DDL(CREATE, DROP, ALTER, TRUNCATE, RENAME)
                              |      = DCL(GRANT, REVOKE)
                              |      = TCL(COMMIT, ROLLBACK)
                              |      = PL/SQL(함수나 자동수행)
                         오라클(서버)
                              | => 데이터 관리
                     하드 디스크
                  3) 운영데이터 : 사이트에 필요한 데이터를 검색할 목적으로 저장된 데이터에 접근할 수 있게 관리
                  4) 공유된 데이터 : 접속자 모든 사람이 모든 데이터를 공유
                                          => 팀별(오라클을 1개만 사용) => 자바(static)
   26page => 데이터베이스의 특징
                   1) 실시간 접근성(오라클은 항상 열어둔다) => 윈도우 부팅 시 자동 실행
                       => 한 번 저장하면 절대 지워지지 않는다(사용자에 의해 삭제는 가능하다)
                   2) 계속된 변화(영화 등록,게시판 쓰기...)
                   3) 동시 공유
                   4) 값에 의한 참조(자바 => 메모리 주소)
   27page => 데이터베이스 시스템의 구성
                   DBMS : 실제 저장된 데이터와 응용 프로그램과 연결 => 오라클
                   데이터베이스 : 실제 저장된 데이터 => XE
                                       자바에서 오라클 연결
                                       jdbc:oracle:thin:@localhost:1521:XE => 자동으로 생성되는 데이터베이스명
                                             ------------  서버 주소 포트 저장된 위치
                                             | 업체명(mysql, microsoft...)
                                             => thin(무료) => 연결만 수행(속도가 느리다)
                                             => oci(유료) => 데이터를 읽어서 저장 후 연결(속도가 빠르다)
                   데이터 모델 : 데이터를 저장하는 기법
                           |
                       오라클 => 보통 저장(문자, 숫자, 날짜)
                                      문자 => CHAR, VARCHAR2, CLOB(가변, 4gb)
                                                     |           | 가변형(1~4000byte)
                                                  1~2000byte => 고정 => CHAR(2000) => 'A'(1byte가 아닌 2000byte가 저장된다)
                                                  => 한글은 3byte
                                                  => '홍길동' => 9byte이상 확보
                                      숫자 => NUMBER => 38자리 사용이 가능
                                                  NUMBER(4) => int, NUMBER(7,2) => double
                                      날짜 => DATE, TIMESTAMP
                                      ------------------------------- 자바 데이터형
                                      => 어떤 데이터가 저장되었는지 확인 가능 : DESC table명
                                      => 키의 종류
                                           기본키(중복을 허용하지 않는 키) => ID, 게시물 번호 => PRIMARY KEY
                                           => 모든 테이블에 ROW구분을 위해서 1개 이상 존재
                                           => 무결성의 원칙
                                           후보키(기본키를 대체하는 키) => email,phone => UNIQUE KEY
                                           외래키(참조키) => FOREIGN KEY
                                           NOT NULL, CHECK, DEFAULT
                                      => DDL(데이터 모델링)
   28page~34page => 데이터베이스의 발전 과정
                   1) 파일 시스템 : 구분이 없다 => 관리하기 어렵다(다른 파일과 연결해서 사용이 어렵다)
                                                              보안이 취약하다
                   2) 데이터베이스 시스템 : 구분이 있다, 관리가 쉽다, 보안이 뛰어나다, 연결해서 사용하기 편리하다(JOIN, SUBQUERY)
                       => 1차 목적 => 사용법(데이터베이스 설계, 화면 UI, SQL...)
                   3) 웹 데이터베이스 시스템
                       브라우저 ========== 자바 ========== 오라클
                        | 화면 출력                   | JDBC(SQL)             | 데이터 저장
                          Front-End                    Back-End                 DBA
                   4) 분산 데이터베이스 시스템 : 백업
                       => 장점 : 중복의 최소화, 일관성, 독립성, 관리 기능 => MSA
   35page => 파일 시스템 => 네트워크 => 파일 입출력
   44page => DBMS의 장점
                   1) 데이터 중복의 최소화 => 정규화
                   2) 일관성, 독립성, 관리, 개발 향상성
   45page => 데이터베이스 시스템 구성
                   -----------------------------
                   응용 프로그램 : 자바
                            | => 오라클 명령어를 이용 => SQL
                   데이터베이스 : 오라클
                            | => read / write
                   하드디스크 : 실제로 데이터 저장
   46page => 데이터베이스 언어(SQL) => 문자열로 만들어져 있다
                   SQL의 종류
                   -------------
                   1) DML(데이터 조작언어)
                      SELECT(데이터 검색) => 가장 많이 사용
                               회원 정보 보기
                      INSERT(데이터 추가) : 회원 가입
                      UPDATE(데이터 수정) : 회원 수정
                      DELETE(데이터 삭제) : 회원 탈퇴
                   2) DDL(데이터 모델링) : 저장 공간 생성(클래스 설계)
                      CREATE : 테이블, 뷰, 시퀀스, 시노임, 인덱스, 함수, 프로시저, 트리거 생성
                      ALTER : 수정
                      DROP : 삭제
                      TRUNCATE : 데이터 잘라내기
                      RENAME : 이름 변경
                   3) DCL(데이터 제어언어)
                      GRANT : 권한 부여 => system
                      REVOKE : 권한 해제
                   4) TCL(트랜잭션 언어)
                      COMMIT : 정상적으로 저장
                      ROLLBACK : 명령문 취소
--------------------------------------------------------------------------------------
   46page : SELECT
               => 데이터 검색
               => 형식)
                    *** SQL문장은 대소문자 구분을 하지 않는다
                    *** 약속 : 키워드는 대문자로 사용한다
                    SELECT *(ALL) | 원하는 데이터만(column1,column2,...) ----- 5
                    FROM table명 ----- 1
                    [
                        WHERE 조건절 ----- 2
                        GROUP BY 그룹컬럼 ----- 3
                        HEVING 그룹 조건 => GROUP BY가 있는 경우에만 사용 가능 ----- 4
                        ORDER BY 정렬(ASC|DESC) ----- 6
                    ]
   Book 테이블
   컬럼(자바의 멤버변수)		데이터형
   BOOKID                                    	NOT NULL NUMBER(2)
   BOOKNAME                               	VARCHAR2(40)
   PUBLISHER                                 	VARCHAR2(40)
   PRICE                                       	NUMBER(8)
*/
-- select LENGTHB('홍길동') FROM dual;
-- 저장된 전체 데이터를 읽어온다
-- SELECT * FROM book;
-- 원하는 데이터만 출력
-- SELECT bookid,bookname FROM book;
-- 책이름,가격
-- SELECT bookname,price FROM book;
-- 컬럼 / 테이블
/*
   emp 테이블 => 사원 정보
   1) 컬럼
       empno : 사번
       ename : 이름
       job : 직위
       hiredate : 입사일
       mgr : 사수번호
       sal : 급여
       comm : 성과급
       deptno : 부서번호
       ===============> 14명 저장
*/
-- 사원에서 사번,이름,직위 출력
-- SELECT empno,ename,job FROM emp;
-- 사원 전체 정보를 출력
-- SELECT * FROM emp;
-- sal값이 2000이상인 사원의 모든 정보
-- SELECT * FROM emp WHERE sal>=2000;
-- sal값이 1500이하인 사원의 이름,급여,입사일 출력
-- SELECT ename,sal,hiredate FROM emp WHERE sal<=1500;
-- 문자열 => ''(싱글), ""는 인용부호로만 사용 가능 => CHAR, VARCHAR2
-- 사원이름이 SCOTT인 사원의 모든 정보를 출력
-- SELECT * FROM emp WHERE ename='SCOTT';
-- 오라클의 SQL문장은 대소문자를 구분하지 않는다(단, 저장된 데이터는 대소문자를 구분한다)
-- 날짜나 문자열은 ''(싱글)를 이용해야된다, 숫자는 그냥 사용이 가능
-- SELECT hiredate FROM emp;
-- SELECT * FROM emp WHERE hiredate='81/11/17';
/*
   데이터베이스 언어 => 검색, 추가, 수정, 삭제
                                 | SELECT
   => 데이터 검색
        1) 테이블명 확인
        2) 컬럼명
        3) 데이터형 : 숫자형(정수, 실수), 문자형(문자, 문자열), 날짜형
                                                  --------------------------------
                                                  | ''를 이용한다, 날짜형 => YY/MM/DD
                                                                                     23/11/06
        4) SELECT 문법 => 목록 출력 / 상세보기 / 검색 데이터 출력
        
        테이블
        member => 2차원 형식(ROW + COLUMN)
        ----------------------------------------------
	id	pwd	name	sex => 컬럼, 속성, 필드 => 자바(멤버변수)
        ----------------------------------------------
	aaa	1234	홍길동	남자 => ROW, Record, Tuple => new Member()
             => 인스턴스(저장된 데이터)
	bbb	1234	심청이	여자
	ccc	1234	이순신	남자
        ROW => 한명의 모든 정보가 저장되어있다(단위 ROW)
        
        47page
        데이터베이스 사용자
        일반 사용자 : 이미 만들어진 프로그램을 사용(USER)
        SQL 사용자 : 프로젝트 시 주로 SQL을 담당
        응용 프로그래머 => 이미 만들어진 테이블을 이용하여 데이터를 조작한다(SELECT, INSERT, UPDATE, DELETE)
        데이터베이스 관리자(DBA) => 요구사항 분석 => 필요한 데이터를 테이블로 제작

        49page 기능
        --------------
        데이터 정의 : DDL(CREATE, ALTER, DROP, TRUNCATE, RENAME)
                          => 저장 공간 제작, 함수 제작, 자동 증가 번호, 테이블 별칭, 자동 수행
                                  | table             | function  | sequence        | 시노임     | 트리거
        데이터 조작 : DML(SELECT, INSERT, UPDATE, DELETE)
                                  | 검색    | 추가   | 수정    | 삭제
        데이터 제어 : DCL(GRANT, REVOKE)
                                  | 권한 부여  | 권한 해제
        저장(트랜잭션 => 일괄 처리) : COMMIT, ROLLBACK
                                                 | 정상 저장   | 비정상 종료 => 명령문 취소
        50page 데이터 모델
        -----------------------
        계층 데이터 모델(절차적)
        네트워크 모델(C/S)
        객체 모델(자바)
        객체 관계형 모델 => 테이블간의 관계 => JOIN => RDBMS => ERD
                                    1:1 / 1:N

        53page 데이터베이스 개념적 구조
        ---------------------------------------
        개념스키마 : 설계만 한 상태 => 어떤 데이터가 있는지 확인
                         예) 맛집 => 이름, 전화, 주소, 메뉴 => 데이터 추출
        논리스키마 : 데이터형 설정(이름 : 문자열, 번호 : 정수...)
        물리스키마 : 저장메모리 크기 지정(name VARCHAR2(100))

        DDL
        ------------------------------------------------------------------------------
	컬럼명		id		sex
        ------------------------------------------------------------------------------
	키종류		pk		ck
        ------------------------------------------------------------------------------
	참조테이블	X		X
        ------------------------------------------------------------------------------
	참조컬럼		X		X
        ------------------------------------------------------------------------------
	체크속성		X		CHECK('남자','여자')
        ------------------------------------------------------------------------------
	데이터형		VARCHAR2	CHAR
        ------------------------------------------------------------------------------
	데이터크기	20		6
        ------------------------------------------------------------------------------
*/

-- C:\app\parkh\product\21c\dbhomeXE\bin