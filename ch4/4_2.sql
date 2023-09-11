-- a.显示所有教师列表，ID、所讲授课程段段号，没讲课的sec_id为0，使用外连接
-- 找到教师对应上课的sec_id，每位老师对应的属性聚集-->group
select ID, count(sec_id) as Number_of_sections
from instructor natural left outer join teaches
group by ID;

-- b.用子查询完成a
select ID, (
    select count(*) as Number_of_sections
    from teaches as T
    where T.ID = I.ID
)
from instructor as I;

-- c.2018春季开设的所有课程段的列表，包括教师ID和name
-- 使用decode函数对name空值处理，也可以使用coalesce(name, '-')
select course_id, sec_id, ID, decode(name, null, '-', name) as name
from (section natural left outer join teaches)
    natural left outer join instructor
where   semester = 'Spring'
    and year = 2018

-- d.所有系，系教师总数
select dept_name, count(ID) as Num_of_instructor
from department natural left outer join instructor
group by dept_name