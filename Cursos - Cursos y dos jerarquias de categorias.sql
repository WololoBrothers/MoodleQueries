SELECT cc.id id_categoria, 
       (select cc2.name
            from mdlua_course_categories cc2
           where TRIM(LEADING '/' FROM SUBSTRING_INDEX(cc.path, '/', 2)) != cc.id
               and TRIM(LEADING '/' FROM SUBSTRING_INDEX(cc.path, '/', 2)) = cc2.id
        ) cat_padre,
       cc.name categoria, 
       c.id id_curso,
       c.shortname nombre_corto, 
       c.fullname nombre
  FROM mdlua_course c,
       mdlua_course_categories cc
 WHERE c.category = cc.id
 order by cc.id, c.id;