select customer.ID, customer_name
from customer, depositor
where customer.ID = depositor.ID
    and not exist(
        (
            select branch_name
            from branch
            where branch_city = 'Brooklyn'
        )
        except
        (
            select branch_name
            from account
            where account_number = depositor.account_number
        )
    );
-- ???
select sum(amount)
from loan;

select branch_name
from branch as B1
where assets > some(
    select assets
    from branch as B2
    where branch_city = 'Brooklyn'
);