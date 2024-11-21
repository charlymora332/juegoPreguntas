function FormularioGuardarPreg() {
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    document.getElementById("visual").innerHTML = this.responseText;
  };

  obj.open("GET", "./GuardarPregunta.html");
  obj.send();
}

function FormularioConsultarPreg() {
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    document.getElementById("visual").innerHTML = this.responseText;
  };

  obj.open("GET", "./ConsularPregunta.html");
  obj.send();
}

function guardarPregunta(event) {
  event.preventDefault();
  let preg = document.getElementById("preg").value;
  let nivel = document.getElementById("nivel").value;
  let resp1 = document.getElementById("rta1").value;
  let resp2 = document.getElementById("rta2").value;
  let resp3 = document.getElementById("rta3").value;
  let resp4 = document.getElementById("rta4").value;
  let resp5 = document.getElementById("rta5").value;

  const obj = new XMLHttpRequest();

  obj.onload = function () {
    // const alertDiv = document.getElementById("alertas");
    // alertDiv.innerHTML = this.responseText;
    // alertDiv.style.display = "block";

    mostrarAlerta(this.responseText);

    document.getElementById("contenido").innerHTML = this.responseText;
  };
  // php/consultas/guardarPreguntas.php
  obj.open(
    "GET",
    "../../php/consultas/admin/guardarPreguntas.php?preg=" +
      encodeURIComponent(preg) +
      "&nivel=" +
      encodeURIComponent(nivel) +
      "&resp1=" +
      encodeURIComponent(resp1) +
      "&resp2=" +
      encodeURIComponent(resp2) +
      "&resp3=" +
      encodeURIComponent(resp3) +
      "&resp4=" +
      encodeURIComponent(resp4) +
      "&resp5=" +
      encodeURIComponent(resp5)
  );
  obj.send();
}

// function eliminarPregunta(idPregunta, event) {
//   event.preventDefault();
//   const obj = new XMLHttpRequest();

//   obj.onload = function () {
//     document.getElementById("alertas").innerHTML = this.responseText;
//     // document.getElementById("visual").reload();
//   };

//   obj.open(
//     "GET",
//     "../../php/consultas/admin/eliminarPregunta.php?idPregunta=" +
//       encodeURIComponent(idPregunta)
//   );
//   obj.send();

//   // location.reload();
// }

function eliminarPregunta(idPregunta, event) {
  event.preventDefault();
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    // Cuando se elimina la pregunta, recargamos las preguntas con el filtro actual
    document.getElementById("alertas").innerHTML = this.responseText;

    // Llamamos a la función para recargar las preguntas con el mismo filtro de dificultad
    consultarPregunta();
  };

  obj.open(
    "GET",
    "../../php/consultas/admin/eliminarPregunta.php?idPregunta=" +
      encodeURIComponent(idPregunta)
  );
  obj.send();
}

let dificultadFiltro; // Aseguramos que la variable global esté definida

function consultarPregunta(event) {
  // Solo prevenimos el comportamiento por defecto si el evento está presente
  if (event) {
    event.preventDefault();
  }

  // Verificamos si el valor del nivel está presente
  let nivel = document.getElementById("nivel")
    ? document.getElementById("nivel").value
    : dificultadFiltro;

  // Si no tenemos el nivel, lo asignamos a la variable global
  if (!dificultadFiltro && nivel) {
    dificultadFiltro = nivel;
  }

  // Creamos la petición AJAX
  const obj = new XMLHttpRequest();

  // Configuramos la función de carga (cuando se recibe la respuesta del servidor)
  obj.onload = function () {
    if (obj.status === 200) {
      // Verificamos que la respuesta fue exitosa
      document.getElementById("visual").innerHTML = this.responseText; // Actualizamos el div
    } else {
      console.error("Error al cargar las preguntas:", obj.statusText);
    }
  };

  // Enviamos la solicitud con el parámetro de nivel (filtro de dificultad)
  obj.open(
    "GET",
    "../../php/consultas/admin/consultarPreguntas.php?nivel=" +
      encodeURIComponent(dificultadFiltro)
  );
  obj.send();
}
 let idPreguntaActualizar;
function editarPregunta(idPregunta, event) {
  // event.preventDefault(); // Si necesitas prevenir el comportamiento por defecto, descomenta esta línea

  idPreguntaActualizar = idPregunta;

  let preg, nivel, rta1, rta2, rta3, rta4, rta5, rtaConsulta;

  const obj = new XMLHttpRequest();
  const obj2 = new XMLHttpRequest();

  obj2.onload = function () {
    // Cuando se elimina la pregunta, recargamos las preguntas con el filtro actual
    // document.getElementById("alertas").innerHTML = this.responseText;

    // Llamamos a la función para recargar las preguntas con el mismo filtro de dificultad
    mostrarAlerta(this.responseText);
  };

  obj2.open("GET", "../../html/admin/editarPregunta.html");
  obj2.send();

  obj.onload = function () {
    // Cuando se elimina la pregunta, recargamos las preguntas con el filtro actual
    rtaConsulta = this.responseText;

    // Llamamos a la función para recargar las preguntas con el mismo filtro de dificultad
  };

  obj.onload = function () {
    // Cuando se recibe la respuesta, almacenamos los datos
    rtaConsulta = JSON.parse(this.responseText); // Suponiendo que la respuesta del servidor es JSON
    console.log(rtaConsulta);
    // Extraemos la información de la respuesta
    preg = rtaConsulta.texto;
    nivel = rtaConsulta.nivel;

    // Asignamos las respuestas
    rta1 = rtaConsulta.respuestas[0].texto;
    rta2 = rtaConsulta.respuestas[1].texto;
    rta3 = rtaConsulta.respuestas[2].texto;
    rta4 = rtaConsulta.respuestas[3].texto;
    rta5 = rtaConsulta.respuestas[4].texto;

    // Ahora que tenemos la información, puedes ponerla en el formulario
    document.getElementById("preg").value = preg;
    document.getElementById("nivel").value = nivel;
    document.getElementById("rta1").value = rta1;
    document.getElementById("rta2").value = rta2;
    document.getElementById("rta3").value = rta3;
    document.getElementById("rta4").value = rta4;
    document.getElementById("rta5").value = rta5;

    // Si necesitas realizar más acciones con la información, puedes hacerlo aquí
  };

  obj.open(
    "GET",
    "../../php/consultas/admin/consultarPreguntaId.php?idPregunta=" +
      encodeURIComponent(idPregunta)
  );
  obj.send();
}

function actualizarPregunta(event) {

  console.log(idPreguntaActualizar)
  console.log("object")
  event.preventDefault();
  let preg = document.getElementById("preg").value;
  let nivel = document.getElementById("nivel").value;
  let resp1 = document.getElementById("rta1").value;
  let resp2 = document.getElementById("rta2").value;
  let resp3 = document.getElementById("rta3").value;
  let resp4 = document.getElementById("rta4").value;
  let resp5 = document.getElementById("rta5").value;

  const obj = new XMLHttpRequest();

  obj.onload = function () {
    mostrarAlerta(this.responseText );
    consultarPregunta();

  };

  obj.open(
    "GET",
    "../../php/consultas/admin/actualizarPregunta.php?id=" +
      encodeURIComponent(idPreguntaActualizar) +
      "&preg=" +
      encodeURIComponent(preg) +
      "&nivel=" +
      encodeURIComponent(nivel) +
      "&resp1=" +
      encodeURIComponent(resp1) +
      "&resp2=" +
      encodeURIComponent(resp2) +
      "&resp3=" +
      encodeURIComponent(resp3) +
      "&resp4=" +
      encodeURIComponent(resp4) +
      "&resp5=" +
      encodeURIComponent(resp5)
  );
  obj.send();
}


function cerrarAlerta() {
  const texto = document.getElementById("alertas");
  texto.style.display = "none"; // Oculta el div
}

 function mostrarAlerta(mensaje) {
  const alerta = document.getElementById("alertas");
  alerta.style.display = "block"; // Muestra el div
  alerta.innerHTML = `
      ${mensaje} 
      </br> 
    <button onclick="cerrarAlerta()" style="background-color: #991717 ;">Cerrar</button>

  `;
}
