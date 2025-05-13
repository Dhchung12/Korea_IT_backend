-- 11.경기일자, 홈팀이름, 원정팀이름을 구하고 마지막 컬럼에
--    홈팀이 3점차 이상으로 이긴 경우 "대승리"
--    홈팀이 2점파 이하로 이긴 경우 "승리"
--    비긴 경우 "무승부"
--    진 경우 "망신"
select SCHE_DATE 
	 , (select team_name from team where team_id = HOMETEAM_ID) as hometeam 
	 , (select team_name from team where team_id = AWAYTEAM_ID) as awayteam 
-- 	 , HOME_SCORE 
-- 	 , AWAY_SCORE 
	 , (case when HOME_SCORE - AWAY_SCORE >= 3
	    	then "대승리"
	    	when HOME_SCORE - AWAY_SCORE between 1 and 2
	    	then "승리"
	    	when HOME_SCORE - AWAY_SCORE=0 
	    	then "무승부"
	    	else "망신" end) as '경기결과'
from schedule s
;

-- 12. 11번의 결과를 바탕으로 
--	   대승리, 승리, 무승부, 망신이 각각 몇 경기인지 구하시오.
--     순서는 대승리 > 승리 > 무승부 > 망신 순으로 정렬하시오.
with res_tab as (
	select SCHE_DATE 
		 , (select team_name from team where team_id = HOMETEAM_ID) as hometeam 
		 , (select team_name from team where team_id = AWAYTEAM_ID) as awayteam 
	-- 	 , HOME_SCORE 
	-- 	 , AWAY_SCORE 
		 , (case when HOME_SCORE - AWAY_SCORE >= 3
		    	then "1.대승리"
		    	when HOME_SCORE - AWAY_SCORE  >= 1
		    	then "2.승리"
		    	when HOME_SCORE - AWAY_SCORE   = 0 
		    	then "3.무승부"
		    	else "4.망신" end) as res
	from schedule s
) 
select res, count(*)
from   res_tab
group by res
order by res
;

-- 13. 승점제로 승리는 2점, 무승부는 1점, 패배는 0점으로 했을 때
--     팀을 승점 순으로 나열하시오.
with full_sche as (
	select sche_date
		 , case when home_score > away_score then hometeam_id
			    else awayteam_id end as wt
		 , case when home_score < away_score then hometeam_id
			    else awayteam_id end as lt
	from   schedule 
	where  home_score <> AWAY_SCORE 
), wstat as (
	select wt, count(*) cnt
	from   full_sche
	group by wt
), lstat as (
	select lt, count(*) cnt
	from   full_sche
	group by lt
), drstat as (
	select teamname,count(*) draw
	from 
	(
	select (select team_name from team where team_id = HOMETEAM_ID) as teamname
	from   schedule  
	where  home_score = AWAY_SCORE 
	union  all
	select (select team_name from team where team_id = AWAYTEAM_ID) 
	from   schedule  
	where  home_score = AWAY_SCORE
	) as dr_all
	group by teamname
), base as (-- 전승팀 또는 전패팀이 있을 수 있어 기준 팀 리스트를 구성한다.
	select wt as teamid from wstat
	union
	select lt from lstat
)
select (select team_name from team where team_id = b.teamid) as teamname
	 , nvl(w.cnt,0) as wins
	 , nvl(l.cnt,0) as loses
from   base b left outer join wstat w on b.teamid = w.wt
			  left outer join lstat l on b.teamid = l.lt
;

-- 강사님 코드
with new_stat as (
	select hometeam_id as team_id
		 , case when home_score > away_score then 2
		 		when home_score = away_score then 1
		 		else 0 end as pt
	from   schedule 
	union all
	select AWAYTEAM_ID 
		 , case when away_score > home_score then 2
		 		when away_score = home_score then 1
				else 0 end as pt
	from   schedule 
)
select (select team_name 
		from team 
		where team_id = s.team_id) as team_name
	 , sum(pt)
from   new_stat s
group by team_id
order by sum(pt) desc
;

-- 14. 원정경기에서 2점차 이상으로 기긴 팀 중
--     홈 경기에서 2점차 이상으로 진 적 없는 팀

select distinct AWAYTEAM_ID 
from   schedule 
where  AWAY_SCORE - HOME_SCORE >=2 ;
intersect 

select distinct hometeam_id 
from   schedule
where  AWAY_SCORE - HOME_SCORE < 2
;

-- 강사님 코드
select distinct AWAYTEAM_ID 
from   schedule s
where  AWAY_SCORE >= HOME_SCORE + 2
and    not exists (select 1 
				   from   schedule 
				   where  HOMETEAM_ID = s.AWAYTEAM_ID 
				   and    AWAY_SCORE >= HOME_SCORE +2 
				   )
				   
-- 15. 13번에서 팀별로 승점을 구했는데
--     컬럼 하나를 추가하여 윗 팀과의 승점 차이를 구해보시오.
with new_stat as (
	select hometeam_id as team_id
		 , case when home_score > away_score then 2
		 		when home_score = away_score then 1
		 		else 0 end as pt
	from   schedule 
	union all
	select AWAYTEAM_ID 
		 , case when away_score > home_score then 2
		 		when away_score = home_score then 1
				else 0 end as pt
	from   schedule 
), res as(
	select (select team_name 
			from team 
			where team_id = s.team_id) as team_name
		 , sum(pt) pt
	from   new_stat s
	group by team_id
	order by sum(pt) desc
)
select team_name
	 , pt
	 , lead(pt) over(partition by null 
	 				 order by pt desc) as ld
	 , lag(pt)  over(partition by null 
	 				 order by pt desc) as lg
	 , lag(pt,2)  over(partition by null 
	 				 order by pt desc) - pt as '승점차'
from   res
;

-- 만약 팀별로 경기마다 경기가 오래된 순서대로 1부터 최종까지 매긴다면?
-- row_number : 동률일때도 숫자가 달리 매겨진다.
-- rank : 동률이면 같은 숫자가 매겨지며, 그 뒤 순위는
--        1등이 공동이면 그 뒤는 3등
-- dense_rank : 동률이면 같은 숫자가 매겨지며, 그 뒤 순위는 바로 이어서 
--              1등이 
select s.* 
	 , row_number() over(partition by hometeam_id
	 					 order by sche_date) as rn
from   schedule s
;

-- 16. 팀별로 최근 홈 3경이만 가져오시오.
with tab as(
	select s.* 
		 , row_number() over(partition by hometeam_id
		 					 order by sche_date desc ) as rn
	from   schedule s
)
select * 
from   tab
where  rn<=3
;

-- 17. 2012년 7월 일정을 홈팀 기준으로 가로로 표기하시오.
-- 예) K02	20120701	20120713	20120731
--    K03	20120702	20120720	(null)

select hometeam_id, SCHE_DATE 
from   schedule 
where  SCHE_DATE like '201207%'
group by HOMETEAM_ID 
;

with base as(
	select 1 as n from dual
	union all
	select 2 as n from dual
	union all
	select 3 as n from dual
	union all
	select 4 as n from dual
	union all
	select 5 as n from dual
)
select * 
from   base;

with new_schedule as (
	select HOMETEAM_ID 
		 , SCHE_DATE 
		 , row_number() over(partition by HOMETEAM_ID
		 					 order by sche_date) as rn
	from   schedule 
	where  SCHE_DATE like '201207%'
), new_schedule2 as (
	select hometeam_id
		 , case when rn = 1 then sche_date else null end as g1
		 , case when rn = 2 then sche_date else null end as g2
		 , case when rn = 3 then sche_date else null end as g3
		 , case when rn = 4 then sche_date else null end as g4
		 , case when rn = 5 then sche_date else null end as g5
	from   new_schedule
)
select hometeam_id
	 , max(g1) as g1
	 , max(g2) as g2
	 , max(g3) as g3
	 , max(g4) as g4
	 , max(g5) as g5
from   new_schedule2
group by hometeam_id
;