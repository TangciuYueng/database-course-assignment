-- 求总绩点
select sum(G.points * C.credits)
from takes as T, grade_points as G, course as C
where T.grade = G.grade 
    and T.course_id = C.course_id
    and T.ID = '12345';

-- 求平均绩点
select sum(G.points * C.credits) / sum(C.credits)
from takes as T, grade_points as G, course as C
where T.grade = G.grade 
    and T.course_id = C.course_id
    and T.ID = '12345';

-- 每个学生的GPA
select T.ID, sum(G.points * C.credits) / sum(C.credits)
from takes as T, grade_points as G, course as C
where T.grade = G.grade 
    and T.course_id = C.course_id
group by T.ID;