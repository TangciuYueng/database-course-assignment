-- 选修了至少一门计算机科学的课的ID和姓名
select distinct S.ID, S.name
from student as S, takes as T, course as C
where   S.ID = T.ID
    and T.course_id = C.course_id
    and C.dept_name = "Comp. Sci.";

-- 找出没有选修2017年之前开设的任何课程的学生ID和姓名
-- 该学生上的课 ∩ 2017之前的课 = 空集
select distinct S.ID, S.name
from student as S
where not exists(
    (
        select course_id
        from takes
        where S.ID = takes.ID
    )
    intersect
    (
        select course_id
        from section
        where year < 2017
    )
);
select distinct S.ID, S.name
from student as S
where not exists(
    select *
    from takes
    where takes.ID = S.ID
        and year < 2017
);

-- 每个系的教师最高工资值
select dept_name, max(salary)
from instructor
group by dept_name;

-- 从上述查询所计算出的每个系的最高工资中选出所有系中的最低值
select min(max_salary)
from (
    select dept_name, max(salary)
    from instructor
    group by dept_name
) as dept_max_salary(dept_name, max_salary);