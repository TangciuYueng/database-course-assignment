select name 
from course
where dept_name = 'Comp. Sci. '
    and credits = 3;

select distinct takes.ID
from takes, instructor, teaches
where instructor.name = 'Einstein'
    and instructor.ID = teaches.ID
    and teaches.course_id = takes.course_id
    and teaches.sec_id = takes.sec_id
    and teaches.semester = takes.semester
    and teaches.year = takes.year;

select max(salary) 
from instructor;

select name 
from instructor
where salary = (select max(salary)
                from instructor);

select count(*) as numOfStudent, course_id, sec_id
from section
where semester = 'Fall' 
    and year = 2017
group by course_id, sec_id;

select max(numOfStudent)
from (  select count(*) as numOfStudent, course_id, sec_id
        from section
        where semester = 'Fall' 
            and year = 2017
        group by course_id, sec_id);

select course_id, sec_id
from (  select count(*) as numOfStudent, course_id, sec_id
        from section
        where semester = 'Fall' 
            and year = 2017
        group by course_id, sec_id)
where numOfStudent = (  select max(numOfStudent)
                        from (  select count(*) as numOfStudent, course_id, sec_id
                                from section
                                where semester = 'Fall' 
                                    and year = 2017
                                group by course_id, sec_id)
                    );

-- 上述语句可以修改为
with stat(numOfStudent, course_id, sec_id) as 
    (   select count(*) as numOfStudent, course_id, sec_id
        from section
        where semester = 'Fall' 
            and year = 2017
        group by course_id, sec_id)
select course_id, sec_id
from stat
where numOfStudent = (  select max(numOfStudent)
                        from stat
                    );