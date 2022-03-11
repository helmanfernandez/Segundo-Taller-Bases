# Segundo-Taller-Bases
# Segundo Taller Bases de datos 2
## Video explicativo https://youtu.be/4BsQvQVOu5o
# Integrantes: Diego Mogollon, Luis Ospina, Helman Fernandez.
# En este taller se vamos a utilizar: TRIGGER, funciones, y procesamientos almacenados.
# En el primer disparador (TRIGGER), este creara un backup en la tabla product_audit donde el aparece los determinados articulos en este caso es un Iphone con sus determinadas caracteristicas, donde satisfactoriamente agrego el articulo que en este caso era Iphone70.
# En el siguiente (TRIGGER) es para la modificacion de un producto donde se modificara en su tabla determinada con su determinado nombre  en product_audit. Tambien en el proceso donde se elimanara aparecera en la tabla product.audit, en la misma logica en la variable del articulo
# En el segundo punto se tenia que evaluar si dos ordenes de un carrito no debe ser la misma donde se realizara una accion de deterner por medio del TRIGGER, donde creamos con un before insert para el carrito de compra donde se llamara asi call unica_orden(Id) donde esto nos va a impedir que se logre generar un mismo carrito de compras.
# En el tercer punto se realiza almacenamiento almacenado donde vamos a calcular la reputacion del vendedor por medio del ID del articulo donde  hacemos un CREATE EVENT.
# Modelo: https://drive.google.com/file/d/1AASWDSVLHMZonQNA0_H7c2lHwlsLycgD/view?usp=sharing
