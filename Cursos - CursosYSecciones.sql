select c.id, shortname, fullname, count(cs.course)
from mdlua_course c,
mdlua_course_sections cs
where c.id = cs.course
group by  c.id, c.shortname, c.fullname
having count(*) > 5