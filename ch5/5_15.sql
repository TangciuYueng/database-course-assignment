-- 编写函数，以公司名作为参数，查找该公司平均工资
create function avg_salary(company_name varchar(20))
    returns real
    begin
        declare ans real;
        select avg(salary) into ans
        from works
        where works.company_name = company_name;
        return ans;
    end;

-- 找出员工平均工资高于'First Bank'的公司
select company_name
from works
group by company_name
having avg_salary(salary) > avg_salary('First Bank')