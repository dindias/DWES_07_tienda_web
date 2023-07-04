function cargarProducto(prod) {
    // Aquí se hace la llamada a la función registrada de PHP
    
    //var respuesta = xajax.request({xjxfun: "cargarCesta"}, {mode: 'synchronous', parameters: [prod]});
    xajax_cargarCesta(prod);
    return false;
  }
  
  function vaciarCesta(){
    xajax_vaciarCesta();
    return false;
  }