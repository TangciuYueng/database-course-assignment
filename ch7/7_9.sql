not exists (
    select r1.B
    from r r1
    where r1.C != (
        select r2.C
        from r r2
        where r1.B = r2.B
    )
)

create assertion b_to_c check (
    not exists (
        select B
        from r
        group by B
        having count(distinct C) > 1
    )
)