-- 定义视图，除数不能为零，考虑学生没选课
create view student_grades(ID, GPA) as
    select  ID, 
            credit_points / (
                case 
                    when credit_sum = 0 then null
                    else credit_sum
                end
            )
    from(
        (
            -- 找出每个学生对应得总分和绩点加权sum
            select
                ID,
                sum (
                    case 
                        when grade is null then 0
                        else credits
                    end
                ) as credit_sum,
                sum (
                    case 
                        when grade is null then 0
                        else credits * points
                    end
                ) as credit_points
            -- 第一个自然连接获得学分，第二个可能会有没分的grade is null也要连起来
            from (takes natural join course) natural left outer join grade_points
            group by ID
        )
        union
        -- 找根本没选课的
        (
            select ID, null, null
            from student
            where ID not in (
                select ID
                from takes
            )
        )
    )