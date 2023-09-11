-- r的外码B引用s的主码A，触发器级联删除s.A
create trigger cascade_delete_a after delete on s
referencing old row as orow
for each row
delete r
where r.B = orow.A