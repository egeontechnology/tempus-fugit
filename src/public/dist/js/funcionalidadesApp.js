var editando = 0;
$('#presentProyectos').html("hi");
function send_post(accion, datos) {
    $.ajax({
        type: "POST",
        url: accion,
        data: datos,
        success:
            function (data, status) {
                procesa_datos_recibidos(data, status, accion, datos);
            },
        error:
            function (err) {
                console.log("error " + err.status + ' ' + err.statusText);
            }
    });
}

send_post("busca_usuarios", "idusuarios=*");
send_post("busca_position", "idposition=*");
send_post("busca_fichajesUser", "idusuarios="+ parseInt(sessionStorage.getItem("idusuario")));


function procesa_datos_recibidos(data, status, accion, datos) {
    // console.log(data);                

    switch (accion) {
        case 'busca_usuarios':
            if (datos == "idusuarios=*") {
                // muestra la tabla en el div "procesado"
                $('#tusuarios').html(data);
                // al hacer click en una fila aparece un mesaje resumen con todos los datos del alumno
                $("#miTabla tbody tr").off('click').on('click', function () {
                    send_post('busca_usuarios', 'idusuarios=' + this.id);
                    send_post('busca_proyectos', 'idusuarios=' + this.id);
                    send_post('busca_fichajes', 'idusuarios=' + this.id);
                    editando = this.id;

                    $("#selectDay").off('change').on('change', function () {
                        var estaFecha = $("#selectDay").val()
                        send_post('busca_fichajes', 'fecha=' + estaFecha + '&idusuarios=' + $('#fidusuario').val());
                    });
                });
                // aplica formato dataTable	
                // $('#miTabla').DataTable({
                //     "order": [[2, "asc"]]
                // });
            } else {
                // FICHA
                usuario = JSON.parse(data);
                // FICHA USUARIO
                $('#nombre').html(usuario[0].nombre);
                $('#apellidos').html(usuario[0].apellidos);
                $('#email').html(usuario[0].email);
                // Calculo de años para el usuario
                var fechaini = new Date(usuario[0].fechaNacimiento);
                var fechafin = new Date()
                var diasdif = fechafin.getTime() - fechaini.getTime();
                var contannos = Math.round(diasdif / (1000 * 60 * 60 * 24 * 365));
                
                // FORMULARIO EDITABLE
                $('#edad').html(contannos);
                $('#email').html(usuario[0].email);
                $('#fidusuario').val(usuario[0].idusuarios);
                $('#fnombre').val(usuario[0].nombre);
                $('#fapellido').val(usuario[0].apellidos);
                $('#ffecha').val(usuario[0].fechaNacimiento);
                $('#fpais').val(usuario[0].pais);
                $('#fciudad').val(usuario[0].ciudad);
                $('#fcp').val(usuario[0].cp);
                $('#fdireccion').val(usuario[0].direccion);
                $('#femail').val(usuario[0].email);
                $('#ftel').val(usuario[0].telefono);
                $('#fpuesto').val(usuario[0].position);

                // Actualizamos fecha actual
                // Calculamos la fecha de hoy
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                today = yyyy + '-' + mm + '-' + dd;
                $("#selectDay").val(today);
            }
            break;
        case 'inserta_usuario':
            $('#formUser').trigger("reset");
            $('#success').show()
            break;
        case 'eliminar_usuario':
            send_post("busca_usuarios", "idusuarios=*");
            window.location.href = 'tablaUsuarios.html';
            break;
            case 'editar_usuario':
            send_post('busca_usuarios', 'idusuarios=*');
            console.log(data);
            // FICHA
            usuario = JSON.parse(data);
            console.log(usuario[0]);
            // FICHA USUARIO
            $('#nombre').html(usuario[0].nombre);
            $('#apellidos').html(usuario[0].apellidos);
            $('#email').html(usuario[0].email);
            // Calculo de años para el usuario
            var fechaini = new Date(usuario[0].fechaNacimiento);
            var fechafin = new Date()
            var diasdif = fechafin.getTime() - fechaini.getTime();
            var contannos = Math.round(diasdif / (1000 * 60 * 60 * 24 * 365));
            
            // FORMULARIO EDITABLE
            $('#edad').html(contannos);
            $('#email').val(usuario[0].email);
            $('#fidusuario').val(usuario[0].idusuarios);
            $('#fnombre').val(usuario[0].nombre);
            $('#fapellido').val(usuario[0].apellidos);
            $('#ffecha').val(usuario[0].fechaNacimiento);
            $('#fpais').val(usuario[0].pais);
            $('#fciudad').val(usuario[0].ciudad);
            $('#fcp').val(usuario[0].cp);
            $('#fdireccion').val(usuario[0].direccion);
            $('#femail').val(usuario[0].email);
            $('#ftel').val(usuario[0].telefono);
            $('#fpuesto').val(usuario[0].position);
            break;
        case 'busca_proyectos':
            $('#presentProyectos').html(data);
            break;
        case 'busca_fichajes':
            $('#fichajesusuario').html(data);
            break;
        case 'busca_fichajesUser':
            // cambiamos el boton en funcion del tipo del ultimo fichaje
            if(data != 1){
                $('#botonFichaje').html("Out");
                $('#botonFichaje').css("background-color", "#eb5c5f");
            }else{
                $('#botonFichaje').html("Go!");
                $('#botonFichaje').css("background-color", "black");
            }
            $('#tipoUser').html(data);
            break;
        case 'busca_position':
            $('#inserPositions').html(data);
            break;
        case 'insertar_fichaje':            
        send_post("busca_fichajesUser", "idusuarios="+ parseInt(sessionStorage.getItem("idusuario")));
            break;
        default:
            break;
    }
}

// FICHAJE!!!!
$("#botonFichaje").off('click').on('click', function () {
    var tipo = $('#tipoUser').html();
    var user = parseInt(sessionStorage.getItem("idusuario"));

    var obj ={
        tipo: tipo,
        user: user
    }
    send_post('insertar_fichaje', obj);
});

// INSERTAR USER
$('#formUser').on('submit',function(e){
    //Evita la ejecución del submit
    e.preventDefault();
    datos = $('#formUser').serialize();
    send_post('inserta_usuario', datos);
})

// DELETE USER
$("#eliminarUser").off('click').on('click', function () {
    var iduser = $('#fidusuario').val();

    var objEliminar ={
        idusuarios: iduser
    }
    send_post('eliminar_usuario', objEliminar);
});

// EDIT USER
$("#editarUser").off('click').on('click', function () {

    var id = $('#fidusuario').val();
    var nombre = $('#fnombre').val();
    var apellido=$('#fapellido').val();
    var fnacimiento=$('#ffecha').val();
    var pais=$('#fpais').val();
    var ciudad=$('#fciudad').val();
    var cp=$('#fcp').val();
    var dir=$('#fdireccion').val();
    var email=$('#femail').val();
    var tel=$('#ftel').val();
    var position=$('#fpuesto').val();

    var objEdit ={
        idusuarios: id,
        nombre: nombre,
        apellidos:apellido,
        telefono:tel,
        email:email,
        direccion:dir,
        ciudad:ciudad,
        cp:cp,
        pais:pais,
        fechaNacimiento:fnacimiento,
        position:position
    }

    send_post('editar_usuario', objEdit);
});