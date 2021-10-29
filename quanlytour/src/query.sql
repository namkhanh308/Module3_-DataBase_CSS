
use quanlytourdulich;
select t2.cityID,t2.tdName, count(t.tID)
from tour t join traveldestinations t2 on t.tID = t2.tID
group by t2.cityID,t2.tdName;

# b2
select t.tCode ,count(tID) as SL
from tour t
where month(t.tStartDate) = 3 and year(t.tStartDate) >= 2021
group by t.tCode;

#b3
select t.tCode ,count(tID) as SL
from tour t
where month(t.tEndDate) = 4 and year(t.tEndDate) >= 2021
group by t.tCode;
