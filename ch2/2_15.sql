-- 找出贷款额度超过10 000的每个贷款号
select loan_number
from loan
where amount > 10000;

-- 找出每个存款人的ID，它拥有一个存款余额大于6000的账户
select ID
from depositor, account
where   depositor.account_number = account.account_number
    and balance > 6000;

-- 找出每个存款人ID，他在'Uptown'支行拥有一个存款余额大于6000的账户
select ID
from depositor, account
where   depositor.account_number = account.account_number
    and balance > 6000
    and branch_name = 'Uptown';