2 Mediante consultas MySQL, relacionadas con el diseño de la base de datos de la aplicación creada anteriormente, realizar las siguientes consultas

A.) Obtener el número de personas que han consultado itinerarios con un valor mayor a mil dólares
SELECT COUNT(DISTINCT cliente_id) AS numerPersonas FROM Reserva WHERE precio > 1000;

B. Identificar a las personas mayores de 40 años que viven en la ciudad de Bogotá y han realizado reservas.
SELECT DISTINCT c.idCliente, c.nombre, c.telefono, c.direccion, c.correo, c.fechaNacimiento
FROM Cliente c
inner JOIN Reserva r ON c.idCliente = r.cliente_id
inner JOIN Reserva ciu ON c.idCiudad = ciu.idCiudad
WHERE YEAR(CURDATE()) - YEAR(c.fechaNacimiento) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(c.fechaNacimiento, '%m%d')) > 40
AND ciu.nombre = 'Bogotá';

C. Listar las reservas que se realizaron con pago mediante tarjeta de crédito.
SELECT * FROM Reserva WHERE metodoPago = 1;

D. Listar las reservas que se hicieron con pago en destino.
SELECT * FROM Reserva WHERE metodoPago = 2;

E. Mostrar las reservas activas y canceladas.
SELECT * FROM Reserva WHERE estado = 0 OR estado = 1;
