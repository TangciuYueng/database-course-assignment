-- 触发器保证一个教师不能在一学期的同一个时段讲授两门不同课
create trigger onesec before insert on section
referencing new row row as nrow
for each row
when (
    -- 插入之前检查是否已经有了这个time_slot_id
    nrow.time_slot_id in (
        select time_slot_id
        from teaches natural join section
        where id in (
            select id
            from teaches natural join section
            where   sec_id = nrow.sec_id
                and course_id = nrow.course_id
                and semester = nrow.semester
                and year = nrow.year
        )
    )
)
begin
    rollback
end;