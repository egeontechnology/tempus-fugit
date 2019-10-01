
//  Si está registrado muestra la página
if (sessionStorage.getItem('login') == 'true') {
	$('#usuario').html('<i class="fas fa-user"></i> Usuario: ' + sessionStorage.getItem('usuario'));

	// send_post('busca_alumnos', 'id=*');		
} else {// Si no lo está vuelve a login
	window.location.href = 'login.html';
}

$(document).ready(function () {
	$('#logOut').click(function () {
		sessionStorage.clear();
		window.location.href = 'login.html';
	});
});