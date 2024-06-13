SELECT `productos`.`ID_PRODUCTO`, `productos`.`NOMBRE_PRODUCTO`, `productos`.`PRECIODEVENTA_PRODUCTO`, `categorias`.`NOMBRE_CATEGORIA`
FROM `productos` 
	LEFT JOIN `categorias` ON `productos`.`ID_CATEGORIA` = `categorias`.`ID_CATEGORIA`
WHERE `productos`.`ID_PRODUCTO` = '01' OR `productos`.`NOMBRE_PRODUCTO` = 'mani';