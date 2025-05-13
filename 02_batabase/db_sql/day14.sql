-- Sequence
create sequence seq_test2 nocache;

select nextval(seq_test2)
from   dual;

drop view hptl_mast_v;

create view hptl_mast_v as
select hptl_nm, typ_cd
from   hptl_mast 
where  typ_cd = '1'
;

select *
from   hptl_mast_v
;

-- 사용자의 편의성을 위해 타입코드명을 보여주기로 한다.
create view hptl_mast_v2 as 
select  hptl_nm, typ_cd_nm
from    hptl_mast m
	  , typ_cd_dtl t
where   m.typ_cd  = t.typ_cd 
;

select * 
from   hptl_mast_v2
where  hptl_nm = '강북삼성병원'
;