-- 每位老师不能在同一个学期的同一个时间段在两个不同教室
-- a.返回违反上述的
-- 一门课可能多个上课时间段在同样的classroom，使用distinct
select id, name, semester, year, time_slot_id, count(distinct(buiding, room_number))
from instructor natural join teaches natural join section
group by id, name, semester, year, time_slot_id
having count(distinct(buiding, room_number)) > 1