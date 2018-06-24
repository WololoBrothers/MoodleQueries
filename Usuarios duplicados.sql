select u.lastname, u.firstname, u.minid, u2.username, u2.email, from_unixtime(u2.lastaccess) minlastaccess, u.maxid, u3.username, u3.email, from_unixtime(u3.lastaccess) maxlastaccess
from mdlua_user u2,
         mdlua_user u3,
          (
          select u.lastname, u.firstname,  min(u.id) minid, max(u.id) maxid
            from mdlua_user u
          where u.deleted = 0
          group by u.lastname, u.firstname
         having count(*) > 1
          ) u
where u2.id = u.minid
and u3.id = u.maxid
and u.firstname != ''
;