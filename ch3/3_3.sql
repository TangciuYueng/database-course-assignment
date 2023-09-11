-- 老师涨工资
update instructor
set salary = salary * 1.1;

-- 删除section中没有的课程
delete from course
where course_id not in (
    select course_id
    from section
);

-- 从其他表中选择合适的元组插入
insert into instructor(ID, name, dept_name, salary)
select ID, name, dept_name, 10000
from student
where tot_cred > 100;