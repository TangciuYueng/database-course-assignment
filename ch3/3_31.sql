-- 找出没有给过A等级的教师
-- 包括没教过课的教师
-- 将teaches和takes连接，找出I.ID是否给过A
select I.ID, I.name
from instructor as I
where not exist (
    select *
    from teaches
    where teaches.ID = I.ID
) 
or 
not exist(
    select *
    from teaches, takes
    where   I.ID = teaches.ID
        and teaches.course_id = takes.course_id
        and teaches.sec_id = takes.sec_id
        and teaches.semester = takes.semester
        and teaches.year = takes.year
        and takes.grade = 'A'
)