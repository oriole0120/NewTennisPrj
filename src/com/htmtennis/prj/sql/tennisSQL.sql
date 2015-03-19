select * from members;

select F.* from (
		select(row_number() over (order by regdate desc)) num, freeboards.* 
			from freeboards where title like '%a%') F where F.num between 1 and 10

select * from LinkCourts;

SHOW VARIABLES LIKE 'c%';

select [name] collection korean_Wansung_ci_as from [linkcourts];

select * from schedules;


INSERT INTO Schedules(CODE, WRITER, REGDATE, EVENTDATE, TITLE, CONTENTS,  AUTHORITY)
	VALUES(15, 'admin', GETDATE(), '2015-03-31', 'aaa', 'bbb','A')
	