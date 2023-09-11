-- 找出2017年出过交通事故的总人数
select count(driver_id)
from owns natural join participated natural join accident
where year = 2017;

-- 删除ID='12345'的人拥有的年份为2010的所有汽车
delete from car
where year = 2017
    and license_plate in (
        select license_plate
        from owns
        where driver_id = '12345'
    );