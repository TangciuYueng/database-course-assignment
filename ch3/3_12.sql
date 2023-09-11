-- 创建一门新课程'CS-001',名称为'xxx',学分为0
insert into course
values('CS-001', 'xxx', 'Comp. Sci.', 0);

-- 创建2017年秋季课程段， sec_id为1
insert into section
values('CS-001', 1, 'Fall', 2017, null, null, null)

-- 为每个计算机科学的学生选这门课
insert into takes
select ID, 'CS-001', 1, 'Fall', 2017, null
from student
where dept_name = 'Comp. Sci.'

-- 删除选修信息中ID='12345'的学生信息
delete from takes
where ID = '12345' and course_id = 'CS-001';