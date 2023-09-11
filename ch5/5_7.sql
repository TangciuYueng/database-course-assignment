-- 检查还有没有其他账户，若没有在depositor里面也删了
create trigger delete_account_check after delete on account
referencing old row as orow
for each row
delete from depositor
-- 一个人可能有很多账户，找出不同于该账户的所有人名字，没有ta才是没有多个账户
where depositor.customer_name not in (
    select customer_name
    from depositor
    where account_number <> orow.account_number
)
