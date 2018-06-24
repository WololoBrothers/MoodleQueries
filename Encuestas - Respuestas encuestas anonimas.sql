/*Respuestas de Encuestas anonimas*/

SELECT component, action, target, userid, u.lastname, u.firstname, courseid, c.shortname, c.fullname, q.name, from_unixtime(l.timecreated) timecreated 
FROM `mdlua_logstore_standard_log` l,
mdlua_course c,
mdlua_user u,
mdlua_course_modules cm,
mdlua_questionnaire q
WHERE u.id = l.userid
and c.id = l.courseid
and cm.course = c.id
and cm.id = l.contextinstanceid
and q.id = cm.instance 
and `courseid` in ('606', 605) 
AND `anonymous` = '1' 
