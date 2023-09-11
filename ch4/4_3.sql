-- 不使用外连接重写
-- a.select * from student natural left outer join takes
select * from student natural join takes
union
select *, null, null, null, null, null
from student
where ID not in (
  select ID
  from takes
);

-- b.select * from student natural full outer join takes
select * from student natural join takes
union
select *, null, null, null, null, null
from student
where ID not in (
  select ID
  from takes
)
union
select ID, null, null, null, course_id, sec_id, semester, year, grade
from takes
where ID not in (
    select ID
    from student
);