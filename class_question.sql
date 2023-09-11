-- An instructor cannot teach in two different classrooms in a semester in the same time slot
-- 固定ID、semester、year、time_slot_id，寻找有无多个教室
create assertion teach_constraint
check not exist(
    select *
    from teaches as T1 natural join section as S1
    where not unique(
        select semester, year, time_slot_id
        from teaches as T2 natural join section as S2
                -- 限定某一个老师
        where   T1.ID = T2.ID
            and S1.semester = S2.semester
            and S1.year = S2.year
            and S1.time_slot_id = S2.time_slot_id
    )
);

-- For each tuple in the student relation, the value of the attribute tot_cred must equal the sum of credits of courses that the student has completed successfully.
-- 检查每个tot_cred是否等于所修成功的分数总和
create assertion student_credits_constraint
check not exist(
    select *
    from student
    where tot_cred <> (
        select sum(credits)
        from takes natural join course
        where   student.ID = takes.ID
            and grade is not null 
            and grade <> 'F'
    )
)
