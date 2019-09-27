function dameDatos() {
    var d = new Date();
    var f = d.getDate() + " / " + (d.getMonth() + 1) + " / " + d.getFullYear();
    var r = d.getHours() + " : " + d.getMinutes() + " : " + d.getSeconds();

    $("#reloj").html(r)
    // document.getElementById("fecha").innerHTML = f;
    }

    setInterval("dameDatos()", 1000);
    dameDatos();