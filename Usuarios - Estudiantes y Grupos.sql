SELECT cc.id id_categoria, 
       cc.name categoria, 
       c.id id_curso, 
       c.shortname nombre_corto, 
       c.fullname nombre,  
       u.id id_usuario ,
       u.lastname apellido, 
       u.firstname nombre,
       g.name
  FROM mdlua_course c,
       mdlua_course_categories cc, 
       mdlua_context co, 
       mdlua_role_assignments ra, 
       mdlua_user u,
       mdlua_groups g,
       mdlua_groups_members gm
 WHERE c.category = cc.id
   AND c.id = co.instanceid
   AND u.id = ra.userid
   AND ra.contextid = co.id
   and g.courseid = c.id
   and gm.groupid = g.id
   and gm.userid = u.id
   AND co.contextlevel =50
   AND ra.roleid IN ( 5)
   and c.id = 554
order by cc.id, c.id