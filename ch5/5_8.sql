-- S(student, subject, marks)找出总分前十(包括并列)
with total(student, tot_marks) as (
    select student, sum(marks) tot_marks
    from S
    group by student
)
select student, tot_marks
from total T1
-- 比T1中某个学生分高的人数不超过10个
where 10 >= (
    select count(tot_marks)
    from total T2
    -- 使用大于保证最后同分的都来了
    where T2.tot_marks > T1.tot_marks
)
order by desc