-- 有marks(ID, score), 每名学生的等级
-- 使用case end在后面重命名
select ID,  case
                when score < 40 then 'F'
                when score < 60 then 'C'
                when score < 80 then 'B'
                else 'A'
            end as grade
from marks

-- 统计各个等级的学生人数
with grades(ID, grade) as(
    select ID,  case
                    when score < 40 then 'F'
                    when score < 60 then 'C'
                    when score < 80 then 'B'
                    else 'A'
                end as grade
    from marks
)
select grade, count(*)
from grades
group by grade

-- 使用lower函数匹配包含'sci'子串的系
select dept_name
from department
where lower(dept_name) like '%sci%';