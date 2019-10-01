// Carga los módulos empleados
var http = require('http');
var url = require('url');
var fs = require('fs');
var mysql = require('mysql');
var qs = require('querystring');

//Inicializa variables globales
var tabla = '';
var cond = '';

//Conecta con la base de datos
var con = mysql.createConnection({
	host: "localhost",
	user: "antia",
	password: "1234",
	database : 'tempus_fugit'
});

con.connect(function(err) {
	if (err) throw err;
	console.log('connected!');
});

//Crea el servidor web en el puerto 8080
http.createServer(function (req, res) {
	
	var q = url.parse(req.url, true);
	
	//muestra el path del archivo solicitado
	console.log('path '+q.pathname);
	
	//si no se ha especificado el archivo, toma index.html por defecto	
	if(q.pathname=='/'){
		q.pathname='/index.html';
	}

	// Actuamos en función del método (POST, GET)
	if (req.method != 'POST') {//Si el método no es POST, devuelve la página solicitada
		console.log('default '+'.' + q.pathname);	
		//lee el archivo especificado	
		fs.readFile('.'+q.pathname, function(err, data) {
			if (err) { // Si no eiste o se produce un error, lo indica
			  res.writeHead(404, {'Content-Type': 'text/html'});
			  res.write(q.pathname+' - error 404 - File not found');
			  res.end();
			}else{ // Si existe lo lee y lo envía
			  res.writeHead(200, {'Content-Type': 'text/html'});
			  res.write(data);
			  res.end();		  
			}
		});
				
	}else{//Si el método es POST, espera a recibir los datos
		//Cuando recibe los datos los convierte en string que usamos como condición de búsqueda
        req.on('data', function(chunk){
//            cond = chunk.toString();
			cond = chunk.toString();
			console.log('la condicion es: '+cond);
        })
		//Cuando termina de recibir los datos los procesa
        req.on('end', function(){
			//decide la acción en funcion de la url
			switch(q.pathname){
				case '/busca_usuarios':
					console.log('voy a buscar buscar usuarios con '+ cond);
					busca_usuarios(cond);
					break
				case '/actualiza_usuario':
					console.log('voy a actualizar el usuario '+ cond);
					actualiza_usuario(cond);
					break
				case '/inserta_usuario':
					console.log('voy a insertar el usuario '+ cond);
					inserta_usuario(cond);
					break
				case '/borra_usuario':
					console.log('voy a borrar el usuario '+ cond);
					borra_usuario(cond);
					break	

				/* Otras acciones que se necesiten*/
				default:
					break;
			}
        })	
	}
	
	function busca_usuarios(cond){
		// Si la petición es de de todos los registros (id=*) la condición de búsqueda
		// mySQL es WHERE 1, de lo contrario es WHERE id=número de registro
		var condicion = '1';
		if(cond != "id=*"){
			condicion = cond ;
		}
		console.log('condición de busqueda mySQL es WHERE : '+condicion);
		
		con.query("SELECT * FROM usuarios WHERE " + condicion, function (err, result, fields) {
			if (err) throw err;
			
			//Si busca todos los usuarios
			if(condicion=='1'){
				//Inicio tabla
				rta = '<table id="miTabla">';
				//Cabecera tabla
				rta += '<thead><tr><th>&nbsp;</th><th>Foto</th><th>Nombre</th><th>Apellidos</th><th>DNI</th><th>Teléfono</th><th>email</th><th>Contraseña</th><th>Dirección</th><th>Ciudad</th><th>CP</th><th>País</th><th>Nivel</th><th>Fecha Nacimiento</th><th>Privilegio</th><th>&nbsp;</th></tr></thead>';
				//Filas tabla
				
				
				for(var i=0; i<result.length; i++){
					rta += '<tr><td class="edit" id="edit_'+result[i].idusuarios+'"><i class="far fa-edit"></i></td><td>'+result[i].nombre + '</td><td>'+ result[i].apellidos + '</td><td>'+ result[i].dni + '</td><td>' + result[i].telefono + '</td><td>' + result[i].email +'</td><td>'+ result[i].contrasena +'</td><td>'+ result[i].direccion +'</td><td>'+ result[i].ciudad +'</td><td>'+ result[i].cp +'</td><td>'+ result[i].pais +'</td><td>'+ result[i].nivel +'</td><td>'+ result[i].fechaNacimiento +'</td><td>'+ result[i].privilegio + '</td><td class="borrado" id="del_'+result[i].id+'"><i class="far fa-trash-alt"></i></td></tr>';
				}
				//Fin tabla
				rta += '</table>';
			}else{
				//Si busca la información de un solo usuario
				rta = JSON.stringify(result);
			}
			
			//Devuelve la respusta información actualizada con éxito
			res.writeHead(200, {'Content-Type': 'text/html', 'charset': 'utf-8'});
			res.write(rta);
			res.end();	
		});
	}
	
	function actualiza_usuario(cond){
		var datos = qs.parse(cond);
		con.query("UPDATE usuarios SET nombre='"+datos.fnombre+"',apellidos='"+datos.fapellidos+"',dni='"+datos.fdni+"',telefono='"+datos.ftelefono+"',email='"+datos.femail+"',contrasena='"+datos.fcontrasena+"',direccion='"+datos.fdireccion+"',ciudad='"+datos.fciudad+"',cp='"+datos.fcp+"',pais='"+datos.fpais+"',nivel='"+datos.fnivel+"',fechaNacimiento='"+datos.ffechaNacimiento+"',privilegio='"+datos.privilegio+"' WHERE id='"+datos.fid+"'", function (err, result, fields) {
			if (err) throw err;
		
			//Devuelve la respusta (toda la tabla o los datos de un usuario
			res.writeHead(200, {'Content-Type': 'text/html', 'charset': 'utf-8'});
			res.write('¡Información actualizada con éxito!');
			res.end();	
		});
	}

	// Definimos la función de borrar usuarios
	function borra_usuario(cond){
		console.log ("voy a borrarlo")
		con.query("DELETE FROM usuarios WHERE "+cond, function (err, result, fields) {
			if (err) throw err;
		
			//Devuelve la respusta (toda la tabla o los datos de un usuario
			res.writeHead(200, {'Content-Type': 'text/html', 'charset': 'utf-8'});
			res.write('¡Información actualizada con éxito!');
			res.end();	
		});
	}

	function inserta_usuario(cond){

	}


}).listen(8080); 

