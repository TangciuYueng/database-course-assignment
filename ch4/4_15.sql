select c.building,c.room_number,course_id,sec_id,semester,year,time_slot_id,capacity
from section join classroom c 
USING (building, room_number); 