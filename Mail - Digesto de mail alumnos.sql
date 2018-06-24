Digesto de mail alumnos 

select u.id, u.firstname, u.lastname, u.email, u.maildigest
  FROM mdl_user u
 WHERE exists (select 1 from mdl_role_assignments ra where u.id = ra.userid AND ra.roleid = 5) 
   and not exists (select 1 from mdl_role_assignments ra2 where u.id = ra2.userid AND ra2.roleid = 3)

update mdl_user u
   set u.maildigest = 2  
 WHERE exists (select 1 from mdl_role_assignments ra where u.id = ra.userid AND ra.roleid = 5)  --alumno
   and not exists (select 1 from mdl_role_assignments ra2 where u.id = ra2.userid AND ra2.roleid = 3) --docente
   and maildigest != 2