var windowsize = $(window).width();

$(window).resize(function() {
    var windowsize = $(window).width();
    // console.log(windowsize)
    if (windowsize <= 950) {        
        $('#duPerfil').hide();
        $('#duProjects').hide();
        $('#duFichaje').show();
        $('#duChat').hide();
    } else {
        $('#duPerfil').show();
        $('#duProjects').show();
        $('#duFichaje').show();
        $('#duChat').show();
    } 
    
});

function menu() {    
    if (windowsize <= 950) {        
        $('#duPerfil').hide();
        $('#duProjects').hide();
        $('#duFichaje').show();
        $('#duChat').hide();
    } else {
        $('#duPerfil').show();
        $('#duProjects').show();
        $('#duFichaje').show();
        $('#duChat').show();
    }    
}

$(document).ready(function(){    
    $("#register").click(function () {
        $('#duPerfil').show()
        $('#duProjects').hide()
        $('#duFichaje').hide()
        $('#duChat').hide()
        // hacemos que el menu se oculte
        $('.navbar-toggler').click()
    });
    
    $("#clock").click(function () {
        $('#duPerfil').hide()
        $('#duProjects').hide()
        $('#duFichaje').show()
        $('#duChat').hide()
        // hacemos que el menu se oculte
        $('.navbar-toggler').click()
    });
    
    $("#chat").click(function () {
        $('#duPerfil').hide()
        $('#duProjects').hide()
        $('#duFichaje').hide()
        $('#duChat').show()
        // hacemos que el menu se oculte
        $('.navbar-toggler').click()
    });
    
    $("#projects").click(function () {
        $('#duPerfil').hide()
        $('#duProjects').show()
        $('#duFichaje').hide()
        $('#duChat').hide()
        // hacemos que el menu se oculte
        $('.navbar-toggler').click()
    });
});






