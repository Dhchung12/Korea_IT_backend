SELECT * FROM movie;

-- desc : 테이블의 정보를 보여주는 명령어
DESC movie

-- insert
INSERT INTO movie values('파묘','20240222',12,'Horror');
INSERT INTO movie values('오리엔트특급살인','20171129',12,'Drama');
INSERT INTO movie(movie_name, genre) values('반지의제왕','Comedy');

-- select
SELECT *
FROM movie
WHERE 1=1
;

SELECT movie_name  -- 영화제목
    , open_date   -- 개봉일자    
    , genre      -- 장르
FROM movie
;

SELECT * 
FROM   movie
LIMIT 1  -- oracle인 경우 WHERE rownum = 1
;

-- where 절 연습
SELECT * 
FROM   movie
WHERE   open_date >= '20240101'
-- AND      open_data != '99991231'
-- or      genre = 'Drama'
;

-- update
update movie
set    open_date = '20240914'
where movie_name = '반지의제왕'
;

update movie
set    rating = 10
where  rating = 12
;

select * from movie;

-- delete
insert into movie(movie_name, open_date)
values('베테랑2','20240913');

delete from movie
-- where genre = '' -- null을 선택하지 못함
where genre is null

select * from movie
where rating is not null 
;

-- Advanced SQL
insert into movie
values('아바타3','20241003',12,'Fantasy');
insert into movie
values('아바타4','20261003',12,'Fantasy');
insert into movie
values('아바타5','20281003',19,'Fantasy');
insert into movie
values('아바타6','20301003',0,'Fantasy');

select *
from   movie
;

-- rating이 12부터 19인 것
select *
from movie
where rating between 12 and 19
;

-- 개봉일자가 2024.1.1부터 2028.1.1 사이인 영화
select *
from movie
where open_date between '20240101' 
             and     '20280101'
;

-- concat
-- Fantasy 장르의 영화 데이터를 '|' 구분자로 출력하시요.
select concat(movie_name,'|'
          ,open_date,'|'
          ,rating,'|'
          ,genre) as '니가요청한데이터'
from movie
where genre = 'Fantasy'
;

select concat('한화의 돌아온',' 에이스','-류현진')
from dual
;
