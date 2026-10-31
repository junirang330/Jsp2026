create schema infoTest03 default character set utf8mb4 collate utf8mb4_general_ci;
-- 테이블 생성 --
create table TBL_TEACHER_202201(
TEACHER_CODE char(3) primary key,
TEACHER_NAME varchar(15),
CLASS_NAME varchar(20),
CLASS_PRICE int(8),
TEACHER_REGIST_DATE varchar(8)
);
create table TBL_MEMBER_202201(
C_NO char(5) primary key,
C_NAME varchar(15),
PHONE varchar(11),
ADDRESS varchar(50),
GRADE varchar(6)
);
create table TBL_CLASS_202201(
REGIST_MONTH varchar(6),
C_NO char(5),
CLASS_AREA varchar(15),
TUITION int(8),
TEACHER_CODE char(3),
PRIMARY KEY(REGIST_MONTH, C_NO)
);

drop table TBL_CLASS_202201;

-- 개별 데이터 입력 --
insert into TBL_TEACHER_202201 values
('100', '이초급', '초급반', 100000, '20220101'),
('200', '김중급', '중급반', 200000, '20220102'),
('300', '박고급', '고급반', 300000, '20220103'),
('400', '정심화', '심화반', 400000, '20220104');

insert into TBL_MEMBER_202201 values
('10001', '홍길동', '01011112222', '서울시 강남구', '일반'),
('10002', '장발장', '01022223333', '성남시 분당구', '일반'),
('10003', '임꺽정', '01033334444', '대전시 유성구', '일반'),
('20001', '성춘향', '01044445555', '부산시 서구', 'VIP'),
('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

insert into TBL_CLASS_202201 values
('202203', '10001', '서울본원', 100000, '100'),
('202203', '10002', '성남분원', 100000, '100'),
('202203', '10003', '대전분원', 200000, '200'),
('202203', '20001', '부산분원', 150000, '300'),
('202203', '20002', '대구분원', 200000, '400');
