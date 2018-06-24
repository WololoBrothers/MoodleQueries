

SELECT cc.id id_categoria, 
       cc.name categoria, 
       c.id id_curso, 
       c.shortname nombre_corto, 
       c.fullname nombre,  
       e.enrol,
       e.status,
       e.roleid,
       r.shortname
  FROM mdlua_course c,
       mdlua_course_categories cc,
       mdlua_enrol e,
       mdlua_role r
 WHERE c.category = cc.id 
   and e.courseid = c.id
   and r.id = e.roleid
order by cc.id, c.id
;
