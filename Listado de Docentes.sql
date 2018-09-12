/*Listado de Docentes*/

SELECT distinct u.id id_usuario ,
       u.username,
       u.lastname apellido, 
       u.firstname nombre,
       u.email
  FROM mdl_course c,
       mdl_context co, 
       mdl_role_assignments ra, 
       mdl_user u
 WHERE c.id = co.instanceid
   AND u.id = ra.userid
   AND ra.contextid = co.id
   AND co.contextlevel = 50
   AND ra.roleid = 3