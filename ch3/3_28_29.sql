-- 找老师，老师讲授了其所在系的所有课程，按照姓名排序
-- 系的所有课 - 教师讲得所有课 = 空集
select I.name
from instructor as I
where not exist(
    (
        select course_id
        from course
        where I.dept_name = course.dept_name
    )
    except
    (
        select course_id
        from teaches
        where teaches.ID = I.ID
    )
)
order by I.name;

-- 找历史系的学生，姓名以D开头，没有选过至少五门Music课程
select S.ID, S.name
from student as S
where   S.dept_name = 'History'
    and S.name like 'D%'
    and 5 >= (
        select count(*)
        from takes, course
        where   S.ID = takes.ID
            and takes.course_id = course.course_id
            and course.dept_name = 'Music'
    );