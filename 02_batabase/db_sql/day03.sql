-- table creation
create table movie 
(
	movie_name	varchar(100),
	open_date	varchar(8) default '99991231',
	rating		int(2)
);

select * from movie;

-- 장르(genre) 추가해달라고 함
-- alter 
alter table movie add column genre varchar(20);

-- 100세 관람사 => rating이 3으로 변경되어야 함
alter table movie modify column rating int(3);




