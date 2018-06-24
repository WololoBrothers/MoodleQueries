SELECT course.id AS CourseID, course.fullname AS CourseFullName, course.shortname AS CourseShortName, course.filename, course.filesize AS CourseSizeBytes
FROM (

SELECT c.id, c.fullname, c.shortname, cx.contextlevel,f.component, f.filearea, f.filename, f.filesize
FROM mdlua_context cx
JOIN mdlua_course c ON cx.instanceid=c.id
JOIN mdlua_files f ON cx.id=f.contextid
WHERE f.filename <> '.'
/*AND f.component NOT IN ("private", "automated", "backup","draft")*/

UNION

SELECT cm.course, c.fullname, c.shortname, cx.contextlevel,f.component, f.filearea, f.filename, f.filesize
FROM mdlua_files f
JOIN mdlua_context cx ON f.contextid = cx.id
JOIN mdlua_course_modules cm ON cx.instanceid=cm.id
JOIN mdlua_course c ON cm.course=c.id
WHERE filename <> '.'

UNION

SELECT c.id, c.shortname, c.fullname, cx.contextlevel, f.component, f.filearea, f.filename, f.filesize
from mdlua_block_instances bi
join mdlua_context cx on (cx.contextlevel=80 and bi.id = cx.instanceid)
join mdlua_files f on (cx.id = f.contextid)
join mdlua_context pcx on (bi.parentcontextid = pcx.id)
join mdlua_course c on (pcx.instanceid = c.id)
where filename <> '.'

) AS course
where id = 75;