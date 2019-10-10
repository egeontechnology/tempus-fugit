function dameDatos() {
    var d = new Date();
    var f = d.getDate() + " / " + (d.getMonth() + 1) + " / " + d.getFullYear();
    var r = ('0'+d.getHours()).slice(-2) + " : " + ('0'+d.getMinutes()).slice(-2) + " : " + ('0'+ d.getSeconds()).slice(-2);

    $("#reloj").html(r)
    // document.getElementById("fecha").innerHTML = f;
    }

    setInterval("dameDatos()", 1000);
    dameDatos();