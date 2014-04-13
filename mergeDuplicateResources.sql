update hrtips.brochures_resources as BR set BR.resource_id=
(select rid from
(select A.id,min(B.id) as rid from (SELECT BR.id,BR.resource_id,R.name,R.language FROM 
hrtips.brochures_resources as BR join hrtips.resources as R on BR.resource_id=R.id)
as A join hrtips.resources as B on A.name=B.name and A.language=B.language
group by A.id,A.resource_id,A.name,A.language) as RES where RES.id=BR.id)

delete from hrtips.resources where id IN
(select A.id from
(select R.id,R.name,R.language, min(R1.id) as result
from hrtips.resources as R join hrtips.resources as R1
on R.name=R1.name and R.language=R1.language
group by R.id,R.name,R.language) as A
where A.id!=A.result)