/*Actividades por curso*/

SELECT
        cc.`name` categoria,
	mc.`shortname` nombre_corto,
	mc.`fullname` nombre_completo,
	COUNT(mm.`id`) AS `cant_modulos`
FROM
	`mdlua_course` mc
	INNER JOIN `mdlua_course_modules` mcm ON (mc.`id` = mcm.`course`)
	INNER JOIN `mdlua_modules` mm ON (mcm.`module` = mm.`id`)
	INNER JOIN `mdlua_course_categories` cc ON (mc.`category` = cc.`id`)
WHERE
	(mc.`id` <> 1)
GROUP BY
	mc.`fullname`,
	mc.`shortname`
ORDER BY
4 ASC