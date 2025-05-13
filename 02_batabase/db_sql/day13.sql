select * 
from   stadium 
;

select * 
from   schedule 
;

select *
from   team 
;

-- 1. schedule 테이블에서 3개 데이터만 한 번 살펴보시오
select *
from   schedule
limit  3
;

-- 2. schedule 테이블의 총 건수를 구하시오
select count(*)
from   schedule 
;

-- 3. 2012년 7월의 schedule은 몇개인지 구하시오
select count(*)
from   schedule 
-- where  SCHE_DATE between '20120701' and '20120731'
where SCHE_DATE like '201207%'
;

-- 4. 각 팀별로 schedule 건수를 구하시오.(홈팀기준)
select HOMETEAM_ID ,count(*)
from   schedule 
group by HOMETEAM_ID 
;

-- 5. 원정 팀이 승리한 경기의 개수를 구하시오.
select count(*) 
from   schedule 
where  HOME_SCORE < AWAY_SCORE 
;

-- 6. 원정 팀이 이긴 경기의 경기일자, 승리팅과 패배팀을 구하시오
--    승리팀과 패배팀은 코드로 표시
select SCHE_DATE,HOMETEAM_ID as '패배팀',AWAYTEAM_ID as '승리팀'
from   schedule 
where  HOME_SCORE < AWAY_SCORE 
;

-- 7. 원정 팀이 이긴 경기의 경기일자, 승리팅과 패배팀을 구하시오
--    승리팀과 패배팀은 팀명로 표시
SELECT 
    s.SCHE_DATE,
    t_home.TEAM_NAME AS '패배팀',
    t_away.TEAM_NAME AS '승리팀'
FROM 
    schedule s
JOIN 
    team t_home ON s.HOMETEAM_ID = t_home.TEAM_ID 
JOIN 
    team t_away ON s.AWAYTEAM_ID = t_away.TEAM_ID 
WHERE 
    s.HOME_SCORE < s.AWAY_SCORE;

select sche_date
--      , AWAYTEAM_ID 
--      , HOMETEAM_ID 
     , (select team_name from team 
        where  team_id = s.AWAYTEAM_ID) as "승리팀"
     , (select team_name from team 
        where  team_id = s.HOMETEAM_ID) as "패배팀"
from   schedule s 
where  AWAY_SCORE > HOME_SCORE 
;

-- 8. 전체 경기 중 홈팀이 승리한 경기의 비율, 무승부인 비율,
--    원정팀 승리 비율을 구하시오.
select tab.home_win/tab.total as '홈팀 승리 비율' , tab.draw/tab.total as '비긴 경기 비율', tab.away_win/tab.total as '어웨이팀 승리 비율'
from 
(
select count(*) as total
	 , (select count(*) from schedule 
	    where  AWAY_SCORE < HOME_SCORE) as 'home_win' 
	 , (select count(*) from schedule 
	    where  AWAY_SCORE = HOME_SCORE) as 'draw' 
	 , (select count(*) from schedule 
	    where  AWAY_SCORE > HOME_SCORE) as 'away_win' 
from   schedule 
) as tab
;

-- 유니온 사용
with tot_game as (
	select count(*) as tot
	from   schedule 
)	
select
	(select count(*)
	from    schedule  
	where   HOME_SCORE > AWAY_SCORE) / tot * 100 as hw_ratio
  , (select count(*)
	from    schedule  
	where   HOME_SCORE = AWAY_SCORE)  / tot * 100 as dr_ratio
  , (select count(*)
	from    schedule  
	where   HOME_SCORE < AWAY_SCORE)  / tot * 100 as aw_ratio	
from tot_game
;

-- 방법2 : case 사용
with stat as (
select count(*) tot
	 , sum(case when home_score > away_score 
	            then 1 else 0 end) hw
	 , sum(case when home_score = away_score 
	 			then 1 else 0 end) dr
	 , sum(case when home_score < away_score 
	 			then 1 else 0 end) aw
from   schedule 
)
select hw/tot*100 as hw
	 , dr/tot*100 as dr
	 , aw/tot*100 as aw
from stat
;

-- 방법3 : 더 간단하게
select count(*) tot
	 , sum(case when home_score > away_score 
	            then 1 else 0 end) / count(*) hw
	 , sum(case when home_score = away_score 
	 			then 1 else 0 end) / count(*) dr
	 , sum(case when home_score < away_score 
	 			then 1 else 0 end) / count(*) aw
from   schedule 
;

-- 9. 가장 경기를 많이 한 팀을 구하고 그 팅의 평균 득점을 구하시오
select total.team,count(*) 'cnt', avg(score)
from
(
	select HOMETEAM_ID as team ,home_score as score
	from   schedule
	union all
	select AWAYTEAM_ID , away_score
	from   schedule 
) as total
group by team
order by cnt desc 
limit 1
;

-- 강사님 코드
with schedule_new as (
	select  hometeam_id as team_id
	      , home_score as score from schedule 
	union all
	select  AWAYTEAM_ID,away_score from schedule 
), schedule_t as (
	select team_id, avg(score), count(*) as cnt
	from   schedule_new
	group by team_id
	order by cnt desc
	-- limit 1
)
select * 
from   schedule_t
where  cnt = (select max(cnt) from schedule_t)
;
-- 10. 승률 1위 팀의 팀명과 승률을 구하시오.
