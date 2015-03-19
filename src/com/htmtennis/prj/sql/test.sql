
SELECT COUNT(*) CNT, 'TITLE' FROM PHOTOBOARDS WHERE writer like '%dei%';

select * from photoboards where Writer like 'deian';




select * from authoritylists

select * from members

select * from photofiles

INSERT INTO Members(mid, pwd, name, email, phone, studentnum, authority) 
	VALUES('BBBBB','0000','ぞぞぞぞ','ABC@DEF.COM','012-364-7890','0','Associate')

select * from photoboards where code = '19'

SELECT F.* FROM (SELECT(ROW_NUMBER() OVER ( ORDER BY REGDATE DESC)) NUM, FREEBOARDS.* FROM FREEBOARDS WHERE TITLE LIKE '%%') F WHERE F.NUM BETWEEN 21 AND 25; 

INSERT INTO PHOTOBOARDS(CODE, WRITER, REGDATE, TITLE, CONTENTS, HIT, THUMB, AUTHORITY) 
	VALUES(#{code}, #{writer}, GETDATE(), #{title}, #{contents}, 0, 0, 'B')
	
UPDATE PHOTOBOARDS SET code = #{title}, #{contents} WHERE CODE='19';

select AA.*, BB.* from FreeBoards as AA inner join PhotoBoards as BB on AA.writer = BB.writer; 


SELECT  fr.*, info.*, noti.*, ph.*
FROM     FreeBoards fr INNER JOIN
               InformationBoards info ON FreeBoards.Code = InformationBoards.Code INNER JOIN
               NoticeBoards noti ON FreeBoards.Code = NoticeBoards.Code INNER JOIN
               PhotoBoards ph ON FreeBoards.Code = PhotoBoards.Code


               
			


create view history as 
			select code, writer, regdate, title, contents, hit from freeboards where writer like '%aa%'
			union all
			select code, writer, regdate, title, contents, hit from informationboards where title like '%aa%'
			union all
			select code, writer, regdate, title, contents, hit from photoboards where title like '%aa%'
			union all
			select code, writer, regdate, title, contents, hit from videoboards where title like '%aa%'
			union all
			select code, writer, regdate, title, contents, hit from noticeboards where title like '%aa%'
		

select * from histroy order by regdate desc

	
	