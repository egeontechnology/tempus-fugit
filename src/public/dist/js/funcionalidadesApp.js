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

function procesa_datos_recibidos(data, status, accion, datos) {
    // console.log(data)                

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
                    console.log(editando)

                    $("#selectDay").off('change').on('change', function () {
                        var estaFecha = $("#selectDay").val()
                        // console.log(estaFecha);
                        send_post('busca_fichajes', 'fecha=' + estaFecha + '&idusuarios=' + $('#fidusuario').val());
                    });
                    // console.log(data);
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
            $('#success').html("Success")
            // window.location.href = 'tablaUsuarios.html';
            break;
        case 'busca_proyectos':
            $('#presentProyectos').html(data);
            break;
        case 'busca_fichajes':
            $('#fichajesusuario').html(data);

            break;
        default:
            break;
    }
}

// Al hacer Click en Crear usuario ejecutamos inserta_alumnos
$('#formUser').on('submit',function(e){
    //Evita la ejecución del submit
    e.preventDefault();
    datos = $('#formUser').serialize();
    // console.log('insert '+ datos);
    send_post('inserta_usuario', datos)
})