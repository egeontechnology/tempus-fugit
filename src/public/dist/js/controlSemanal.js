function genera_anno(){
    //  Inicializamos la variable pora poder agregar neuvos valores enel bucle
    var anno ='<option value ="2019">2019</option>';
    //  Añadimos las sentencias <option> hasta el 2070 
    for(var  i=2020; i<2070; i++){
        anno +='<option value ="'+ i +'">'+ i +'</option>';
    }
    //  Devolvemos todo el bloque de sentencias <option> que debe ir dentro del <select> del año
    return anno;
}

/*
    Esta función calcula los días del mes correspondientes a los lunes y domingos de 
    cada semana del mes y los pone en los elementos correspondientes

    Se calcula la fecha del lunes de la semana en la que cae el día 1 del mes y año 
    indicados y a partir de este, podemos calcular cada lunes y domingo de cada semana del mes.

    * param: 
        anno -> año
        mes  -> mes
    * return
*/        
function SemanasMes(anno, mes) {
    //  Obtenemos la fecha correspondiente al día 1 del mes del año indicados
    fecha = new Date(anno, mes-1);          // objeto Date a día 1 del mes y año indicados. Enero es el mes 0. Si no se indica día, se asume 1
    lunes = new Date(fecha);                // auxiliar. Contendrá la fecha del prmier lunes de la semana
    dom = new Date(fecha)                   // auxiliar para controlar el siguiente domingo
    
    diasem = fecha.getDay();                // Día de la semana del día 1 del mes (0-Domingo, 1-Lunes...)
    diff = fecha.getDate() - diasem + (diasem == 0 ? -6 : 1);    // Calculo los dias desde el lunes
    diff2 = (7 - (diasem == 0 ? 6 : diasem-1))                   // Calculo los días hasta el domingo
    //  fijo el primer lunes y el primer domingo
    lunes.setDate(diff);                   // Fecha del lunes de la semana del día 1 del mes
    dom.setDate(diff2);                    // fecha del siguiente domingo
    s =  1;                                  // Variable del bucle de control de semana en cálculo
    //  Hay que calcular los lunes y domingos hasta el domingo del mes siguiente
    //  Si la diferencia entre lunes o domingos es mayor de 31 días, se ha cambiado de mes 
    //  y hay que salir del bucle
    while ((diff < 31) || (diff2 < 31)){
        
        console.log("s= ",s," mes= ",mes, "lun.getMonth()= ",lunes.getMonth(),"lunes= ", lunes,"dom.getMonth()= ",dom.getMonth());
        // Colocamos la semana ...
        blq = lunes.getDate() + ' - ' + (dom.getDate());
        blq += '<div class="border-top border-secondary"></div>  <!--  Simulo el <hr> pero ocupando menos en vert. -->';
        //... el nombre del mes lo sacamos a partir del desplegable
        //  ponemos el mes que correponde al lunes
        nmes = lunes.getMonth() != mes ? lunes.getMonth() : lunes.getMonth() + 1;
        nombremes = document.getElementById("mes").options[nmes].text;  // Los meses empiezan por cero Enero->0, Feb->1 ,...
        // ... coloco los datos
        blq += '<div id="messem'+s+'">' + nombremes + '</div>';
        document.getElementById("lundom"+s).innerHTML = blq;
        //  Si la semana está oculta, se muestra
        if (document.getElementById("sem"+s).style.visibility == "hidden") {
            document.getElementById("sem"+s).style.visibility = "visible";
        }
        // acumulo la diferencia de días desde el primer lunes para controlar el cambio de mes
        diff += 7;
        diff2 += 7;
        //  Calculo el nuevo lunes y el nuevo domingo a partir del anterior
        lunes.setDate(lunes.getDate() + 7);
        dom.setDate(dom.getDate() + 7); 
        //  incremento la semana
        s++;
    }
    //  Hay qu ocultar las semanas que sobran. s puede variar de 1 a 6
    while (s < 7) {
        elem = "sem"+s;
        document.getElementById(elem).style.visibility = "hidden";
        s++;
    }
//console.log(fecha.getDate(), "- dif ", diff, " el dia de la semana es ",diasem, " el lunes anterior es ", lunes1.getDate(), " el mes es ",lunes1.getMonth());
//console.log(diff2, dom1)
    

    //... segunda semana
    return ;
}