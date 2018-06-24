SELECT         (select cc2.name
            from mdl_course_categories cc2
           where TRIM(LEADING '/' FROM SUBSTRING_INDEX(cc.path, '/', 2)) != cc.id
               and TRIM(LEADING '/' FROM SUBSTRING_INDEX(cc.path, '/', 2)) = cc2.id
        ) cat_padre_1,
       ( select   cc3.name
            from mdl_course_categories cc3
           where cc3.id = SUBSTRING_INDEX(SUBSTRING_INDEX(cc.path, '/', 3), '/', -1)    
                 and cc3.id != cc.id
       ) as categoria2,
       ( select   cc4.name
            from mdl_course_categories cc4
           where cc4.id = SUBSTRING_INDEX(SUBSTRING_INDEX(cc.path, '/', 4), '/', -1)    
              and cc4.id != cc.id
       ) as categoria3,
       ( select   cc5.name
            from mdl_course_categories cc5
           where cc5.id = SUBSTRING_INDEX(SUBSTRING_INDEX(cc.path, '/', 5), '/', -1)    
              and cc5.id != cc.id
       ) as categoria4,
       ( select   cc6.name
            from mdl_course_categories cc6
           where cc6.id = SUBSTRING_INDEX(SUBSTRING_INDEX(cc.path, '/', 6), '/', -1)    
              and cc6.id != cc.id
       ) as categoria6,
       cc.id id_categoria,       
       cc.name categoria, 
       c.id id_curso,
       c.shortname nombre_corto, 
       c.fullname nombre
  FROM mdl_course c,
       mdl_course_categories cc
 WHERE c.category = cc.id
 order by cc.id, c.id;