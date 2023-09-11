-- 找到physicsxi教师指导Accounting系的学生的姓名和ID
select s_id, name
from advisor, student, instructor
where   s_id = student.ID
    and student.dept_name = 'Accounting'
    and i_id = instructor.ID
    and instructor.dept_name = "Physics";

-- 查找高于philosophy系的预算的系，按照字母顺序排列
select dept_name
from department
where budget > (
    select budget
    from department
    where dept_name = 'Philosophy'
)
order by dept_name;

-- 显示课程ID和学生ID，至少重修过一门课程两次(选修三次)
-- 外层限定学生和该名学生对应的某一课程
-- 内层找对应(学生，课程)的元素条数
select distinct S.ID, S.name, T.course_id
from student as S, takes as T
where S.ID = T.ID
and 3 <= (
        select count(*)
        from takes as T2
        where   T2.course_id = T.course_id
            and T2.ID = S.ID
    );

-- 查询至少选修过三门不同课程、每门重修过一次(选修两次)
-- 先找出按照ID, course_id分组count的表，找出选修次数满足的
with tempA(ID, course_id, times) as (
    select ID, course_id, count(*)
    from takes
    group by ID, course_id
    having count(*) >= 2
)
-- 再找特定某个学生是否拥有三个不同选修课程
select S.ID, S.name
from student as S
where 3 <= (
    select count(*)
    from tempA
    where   S.ID = tempA.ID
    )