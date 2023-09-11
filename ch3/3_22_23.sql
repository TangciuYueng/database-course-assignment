-- 改写unique(select title from course)
where (select count(title) from course) = (select count(distinct title) from course);

-- 不用with改写
-- 找出某个系的老师总工资和，判断是否大于系总平均工资
select dept_name
from department
where (select sum(salary)
	   from instructor
	   where department.dept_name = instructor.dept_name
	   ) >= (   select sum(salary)
			   	from instructor
			) / 
            (   select count( *)
				from department
			);