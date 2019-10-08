var mysql = require('mysql');
var express = require('express');
var app = express();

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

//Conecta con la base de datos
var con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "1234",
	database : 'tempus_fugit'
});


con.connect(function(err) {
	if (err) throw err;
	console.log('connected!');
});

app.post('/login', function (req, res) {
	con.query("SELECT * FROM tusuarios WHERE email= '"+req.body.usuario+"'", function (err, result, fields) {
		if (err) throw err;	
		
		//Si existe el usuario compara el password
		if(result.length != 0){
			if(result[0].password == req.body.password){
				//Elimina el password
				result[0].password='';
				rta = JSON.stringify(result);
			}else{
				rta = 'ko';
			}
		}else{
			rta = 'ko';
		}	
		//Devuelve la respusta 
		res.send(rta);
	});	
});

app.post('/busca_usuarios', function (req, res) {
	// Si la petición es de de todos los registros (id=*) la condición de búsqueda
	// mySQL es WHERE 1, de lo contrario es WHERE id=número de registro
	var condicion = '1';
	if(req.body.idusuarios != "*"){
		condicion = "idusuarios="+req.body.idusuarios;
	}
	// // console.log('condición de busqueda mySQL es WHERE : '+condicion);
	
	con.query("SELECT tusuarios.idusuarios, tusuarios.nombre, tusuarios.apellidos, tusuarios.telefono, tusuarios.email,tusuarios.direccion, tusuarios.pais, tusuarios.cp, tusuarios.ciudad, tusuarios.foto, tusuarios.fechaNacimiento, tposition.position  FROM tusuarios INNER JOIN tposition on tusuarios.position = tposition.idposition WHERE " + condicion, function (err, result, fields) {
		if (err) throw err;
		// console.log(result)
		//Si busca todos los alumnos
		if(condicion=='1'){
			//Inicio tabla
			rta = '<table id="miTabla" class="table table-hover table-condensed">';
			//Cabecera tabla
			rta += '<thead><tr><th>Nombre</th><th>Position</th><th>Phone</th><th>Email</th><th>Weekly hours</th></tr></thead>';

			//Filas tabla
			for(var i=0; i<result.length; i++){				
				rta += '<tr data-toggle="modal" data-target="#myModal" id="'+ result[i].idusuarios+'"><td>'+result[i].nombre + ' '+ result[i].apellidos + '</td><td>' +result[i].position +'</td><td>' + result[i].telefono + '</td><td>' + result[i].email + '</td><td>' + result[i].idusuarios + '</td></tr>';
				// console.log(i+"--"+rta);
			}
			//Fin tabla
			rta += '</table>';
		}else{
			//Si busca la información de un solo alumno
			//Elimina el password
			result[0].password='';
			rta = JSON.stringify(result);
			// console.log(rta);
		}		
		//Devuelve la respuesta
		res.send(rta);
	});
});

app.post('/busca_proyectos', function (req, res) {
	
	condicion = req.body.idusuarios;	

	con.query("SELECT tusuarios.idusuarios, tusuarios.nombre, tproyectos.nombreproyecto, tproyectos.inicio FROM tusuarios JOIN tuserproject ON tuserproject.idusuarios = tusuarios.idusuarios JOIN tproyectos ON tproyectos.idproyectos = tuserproject.idproyectos WHERE tusuarios.idusuarios=" + condicion, function (err, result, fields) {
		if (err) throw err;
		//Si busca todos los alumnos

		var rta2 = '<table id="miTabla2">';
		for(var i=0; i<result.length; i++){				
			rta2 += '<tr id="'+ result[i].fichajes+'"><td>'+result[i].nombreproyecto + '</td><td>' + result[i].inicio + '</td></tr>';
			// console.log(i+"--"+rta);
		}
		rta2 += '</table>';
		// console.log(rta2);
		
		//Devuelve la respuesta
		res.send(rta2);
	});
});

app.post('/busca_fichajes', function (req, res) {
	// Si la petición es de de todos los registros (id=*) la condición de búsqueda
	
	// Calculamos la fecha de hoy
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = yyyy+ '-' + mm + '-' + dd ;
	// console.log(today + "<<----");
	
	
	// Variables que necesitamos para la sentencia SQL
	condicion = req.body.idusuarios; //id usuario seleccionado
	if ( req.body.fecha!=null) {
		condicion2 = req.body.fecha;
	} else{
		condicion2 = today;
	}

	sql="SELECT * FROM tfichajes WHERE fecha='" + condicion2 + "' and usuario='" + condicion+"'";

	// console.log(condicion + '-->>' + sql);
	
	con.query(sql, function (err, result, fields) {
		if (err) throw err;
		//Si busca todos los alumnos

		// console.log(result)
		var rtafichaje = '<table id="tablaFichajes">';
		for(var i=0; i<result.length; i++){				
			rtafichaje += '<tr id="'+ result[i].idfichajes+'"><td>'+ (result[i].tipo == 0 ? "IN" : "OUT") + '</td><td>' + result[i].hora + '</td></tr>';
		}
		rtafichaje += '</table>';
		// console.log(rtafichaje);
		

		//Devuelve la respuesta
		res.send(rtafichaje);
	});
});

app.use("/", express.static("./../public"));

app.listen(8080, function () {
	console.log('Example app listening on port 8080!');
});

// JavaScript Document