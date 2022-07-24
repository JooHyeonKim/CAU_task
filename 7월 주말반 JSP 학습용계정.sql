-- 주석처리

-- 오라클 자료형
-- 문자 데이터타입
-- char(n) : 고정길이 문자. n : 길이
-- varchar2(n) : 가변길이 문자
-- 예) char(3), varchar2(3) : 최대 3바이트까지 저장할 수 있는 문자열
-- 가변길이의 경우 지정사이즈보다 작은 데이터가 입력되더라도,
-- 저장공간을 낭비하지 않는다는 특징이 있다.

-- nchar(n) : 고정길이 유니코드 문자
-- nvarchar2(n) : 가변길이 유니코드 문자
-- 예) nchar(3), nvarchar2(3) : 3글자까지 저장할 수 있는 문자열

-- n의 유무차이 : 유니코드 지원 하냐 안하냐 > 유니코드는 모든 문자를 2바이트로 저장
-- 한글을 쓸때는 -> n을 붙인다.

-- 숫자 데이터 타입
-- number(p,s) : +-38자릿수의 숫자를 저장
-- 예) number(3) : 최대 3자리까지 표현가능한 숫자 (-999 ~ 999)
-- 예) number(4,2) : 최대 4자리, 소수 이하자리 포함(-99.99~99.99)


-- LOB 데이터타입 (최대 4GB) Large Object
-- CLOB : 문자형 대용량 타입
-- NCLOB : 유니코드를 포함한 문자형 대용량 타입
-- BLOB : 동영상, 사진 등 대용량의 바이너리 데이터타입

-- 날짜형 데이터타입
-- DATE : 날짜형식의 자료형으로 시, 분, 초까지 표현 가능
-- TIMESTAMP : 밀리초까지 표현 가능

-- SQL : 데이터페이스 질의언어이다.

-- SELECT : 검색(보여주는 것)
-- WHERE : 조건
-- * : 모든 것
-- INSERT : 데이터 삽입(저장)
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제
-- COMMIT : 최종저장
-- ROLLBACK : 취소(되돌리기)

--COMMIT, ROLLBACK은 INSERT, UPDATE, DELETE 에서만 적용가능

-- 테이블 만들기
-- CREATE TABLE {테이블명} ( {컬럼명} {데이터타입} {기본값-생략가능} {NULL허용여부 - 생략가능} . . . );

CREATE TABLE member ( 
    name NVARCHAR2(10) NOT NULL, --이름 필수
    id VARCHAR2(10) PRIMARY KEY, --무결성 제약 조건(유일한 키), 널값 허용 안됨. 멤버들 중 유일하게 검색할 수 있는 키
    pw VARCHAR2(10) NOT NULL,
    phone char(13),     -- 010-1111-1111 -> - 포함 13글자
    admin number(1) default 0 --0은 사용자, 1은 관리자
);


SELECT * from tab;
-- 해당 데이터상의 모든 테이블 목록이 출력된다.

-- 데이터 추가하기
-- INSERT INTO {테이블명} {칼럼명1, 칼럼명2, ...} VALUES {데이터1, 데이터2, . . .};
-- 칼럼명을 생략할 수 있는데 생략 시 순서대로 컬럼값을 넣어주면 된다.
-- 오라클 데이터베이스는 문자컬럼의 값은 작은따옴표를 사용한다.

INSERT INTO member(name, id, pw, phone, admin) VALUES ('홍길동', 'hong', '1234', '010-1231-1111',1);
INSERT INTO member VALUES ('성춘향', 'sung', '5678', '010-1231-2111',0);
INSERT INTO member VALUES ('이순신', 'lee', '8888', '010-1231-8888',0);

--데이터를 넣은 후에는 최종저장을 해주어야 한다. (수정, 삭제)
COMMIT;

-- 데이터 전체 조회하기
SELECT * from member;

-- 조건에 맞게 조회하기
-- SELECT [컬럼명] FROM [테이블명] WHERE [조건]

SELECT * FROM member where admin=1;

-- 아이디가 sung인 멤버의 모든 데이터 조회하기
select * from member where id='sung';

-- 데이터 수정하기
-- UPDATE {테이블명} SET {컬럼명} = {변경할 값} WHERE {조건}

UPDATE member SET phone='010-1234-1234' where name='성춘향';
COMMIT;
SELECT * FROM member;

-- 데이터 삭제하기
-- DELETE FROM {테이블명} WHERE {조건}
DELETE FROM member WHERE id='lee';
COMMIT;

select *from member;

-- DROP : 테이블 자체를 삭제
-- DROP TABLE {테이블명}

DROP table member;
select * from tab;

-- member2 테이블 생성하기 > 데이터 넣기 > (조건에 맞게) 데이터 조회하기> 데이터 수정하기 > 데이터 삭제하기 > 테이블 삭제

CREATE TABLE member2(
    name NVARCHAR2(10) NOT NULL,
    id VARCHAR2(30) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    studentId number(8)
);
COMMIT;

INSERT INTO member2(name, id, pw, studentId) VALUES ('김주현', 'joohyun282', 'kk1234', 11112222);
INSERT INTO member2 VALUES('김진성', 'jinsang123', 'kk1234', 22223333);
INSERT INTO member2 VALUES('윤혜미', 'yunhmg345', 'kk121234', 11113333);

COMMIT;

SELECT * FROM member2;

SELECT * FROM member2 where name='김주현';

DELETE FROM member2 where name='김진성';
COMMIT;

