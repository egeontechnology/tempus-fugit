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
	database : 'practicas_eoi'
});


con.connect(function(err) {
	if (err) throw err;
	console.log('connected!');
});

app.post('/busca_alumnos', function (req, res) {
	// Si la petición es de de todos los registros (id=*) la condición de búsqueda
	// mySQL es WHERE 1, de lo contrario es WHERE id=número de registro
	var condicion = '1';
	if(req.body.id != "*"){
		condicion = "id="+req.body.id;
	}
	console.log('condición de busqueda mySQL es WHERE : '+condicion);
	
	con.query("SELECT * FROM alumnos WHERE " + condicion, function (err, result, fields) {
		if (err) throw err;
		
		//Si busca todos los alumnos
		if(condicion=='1'){
			//Inicio tabla
			rta = '<table id="miTabla">';
			//Cabecera tabla
			rta += '<thead><tr><th>&nbsp;</th><th>Nombre</th><th>Apellidos</th><th>Teléfono</th><th>email</th><th>&nbsp;</th></tr></thead>';
			//Filas tabla
			for(var i=0; i<result.length; i++){
				rta += '<tr><td class="edit" id="edit_'+result[i].id+'"><i class="far fa-edit"></i></td><td>'+result[i].nombre + '</td><td>'+ result[i].apellidos + '</td><td>' + result[i].telefono + '</td><td>' + result[i].email + '</td><td class="borrado" id="del_'+result[i].id+'"><i class="far fa-trash-alt"></i></td></tr>';
			}
			//Fin tabla
			rta += '</table>';
		}else{
			//Si busca la información de un solo alumno
			//Elimina el password
			result[0].password='';
			rta = JSON.stringify(result);
		}		
		//Devuelve la respuesta
		res.send(rta);
	});

});

app.post('/actualiza_alumno', function (req, res) {
	var datos = req.body;
	con.query("UPDATE alumnos SET nombre='"+datos.fnombre+"',apellidos='"+datos.fapellidos+"',telefono='"+datos.ftelefono+"',email='"+datos.femail+"',descripcion='"+datos.fdescripcion+"' WHERE id='"+datos.fid+"'", function (err, result, fields) {
		if (err) throw err;
	
		//Devuelve la respusta 
		res.send('¡Información actualizada con éxito!');
	});
});

app.post('/inserta_alumno', function (req, res) {
	datos = req.body;
	datos.ffoto = 'none';
	con.query("INSERT INTO alumnos (nombre, apellidos, telefono, email, foto, descripcion) VALUES (?,?,?,?,?,?)",[datos.fnombre, datos.fapellidos,datos.ftelefono,datos.femail,datos.ffoto,datos.fdescripcion], function (err, result, fields) {

		if (err) throw err;		
		//Devuelve la respusta 
		res.send('¡Usuario añadido con éxito!');
	});
});

app.post('/borra_alumno', function (req, res) {
	cond = "id="+req.body.id;
	con.query("DELETE FROM alumnos WHERE "+cond, function (err, result, fields) {
		if (err) throw err;		
		//Devuelve la respusta 
		res.send('¡Usuario añadido con éxito!');
	});
});


app.post('/login', function (req, res) {
	con.query("SELECT * FROM alumnos WHERE email= '"+req.body.usuario+"'", function (err, result, fields) {
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


app.use(express.static('probando'));


app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});

// JavaScript Document