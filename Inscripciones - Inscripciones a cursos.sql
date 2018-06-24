select cc.id id_categoria, 
       cc.name categoria, 
       c.id id_curso, 
       c.shortname nombre_corto, 
       c.fullname nombre
  from mdl_course c,
       mdl_course_categories cc,
       mdl_context co
 where c.category = cc.id
   and c.id = instanceid
   and co.contextlevel = 50
;

select u.id, u.lastname, u.firstname, ra.*
  from mdl_user u, 
       mdl_role_assignments ra 
 where u.id = ra.userid
   and ra.roleid in (3,4,7)
;

SELECT cc.id id_categoria, 
       cc.name categoria, 
       c.id id_curso, 
       c.shortname nombre_corto, 
       c.fullname nombre,  
       u.id id_usuario ,
       u.username,
       u.lastname apellido, 
       u.firstname nombre,
       ra.roleid,
       r.shortname
  FROM mdlua_course c,
       mdlua_course_categories cc, 
       mdlua_context co, 
       mdlua_role_assignments ra, 
       mdlua_user u,
       mdlua_role r
 WHERE c.category = cc.id
   AND c.id = co.instanceid
   AND u.id = ra.userid
   AND ra.contextid = co.id
   AND co.contextlevel = 50
   and r.id = ra.roleid
order by cc.id, c.id
