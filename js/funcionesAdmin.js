function FormularioGuardarPreg() {
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    document.getElementById("visualCanvas").innerHTML = this.responseText;
  };

  obj.open("GET", "./html/admin/GuardarPregunta.html");
  obj.send();
}

function FormularioConsultarPreg() {
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    document.getElementById("visualCanvas").innerHTML = this.responseText;
  };

  obj.open("GET", "./html/admin/ConsularPregunta.html");
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
    "./php/consultas/admin/guardarPreguntas.php?preg=" +
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

function eliminarPregunta(idPregunta, event) {
  event.preventDefault(); // Previene el comportamiento por defecto del formulario o enlace
  const obj = new XMLHttpRequest();
  const posicionScroll = window.scrollY; // Guardar la posición del scroll

  obj.onload = function () {
    if (obj.status === 200) {
      // Mostrar el mensaje de éxito o alerta en el div correspondiente
      document.getElementById("alertas").innerHTML = this.responseText;

      // Recargar las preguntas con el filtro actual y restaurar el scroll
      consultarPregunta(null, posicionScroll);
    } else {
      console.error("Error al eliminar la pregunta:", obj.statusText);
    }
  };

  obj.open(
    "GET",
    "./php/consultas/admin/eliminarPregunta.php?idPregunta=" +
      encodeURIComponent(idPregunta)
  );
  obj.send();
}

// Variable global para almacenar el filtro de dificultad
let dificultadFiltro;

function consultarPregunta(event, posicionScroll = 0) {
  if (event) {
    event.preventDefault(); // Prevenir comportamiento por defecto si el evento existe
  }

  // Obtener el nivel del filtro o usar la variable global
  let nivel = document.getElementById("nivel")
    ? document.getElementById("nivel").value
    : dificultadFiltro;

  if (!dificultadFiltro && nivel) {
    dificultadFiltro = nivel; // Almacenar en la variable global si no está definida
  }

  // Crear la solicitud AJAX para recargar las preguntas
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    if (obj.status === 200) {
      // Actualizar el contenido del div con las preguntas
      document.getElementById("visualCanvas").innerHTML = this.responseText;

      // Restaurar la posición del scroll
      window.scrollTo(0, posicionScroll);
    } else {
      console.error("Error al cargar las preguntas:", obj.statusText);
    }
  };

  // Enviar la solicitud con el filtro de dificultad como parámetro
  obj.open(
    "GET",
    "./php/consultas/admin/consultarPreguntas.php?nivel=" +
      encodeURIComponent(dificultadFiltro)
  );
  obj.send();
}
 
let idPreguntaActualizar;
function editarPregunta(idPregunta, event) {
  // event.preventDefault(); // Si necesitas prevenir el comportamiento por defecto, descomenta esta línea

    event.preventDefault();
 
  idPreguntaActualizar = idPregunta;

  let preg, nivel, rta1, rta2, rta3, rta4, rta5, rtaConsulta;

  const obj = new XMLHttpRequest();
  const obj2 = new XMLHttpRequest();

  obj2.onload = function () {

    mostrarAlerta(this.responseText);
  };

  obj2.open("GET", "./html/admin/editarPregunta.html");
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
    "./php/consultas/admin/consultarPreguntaId.php?idPregunta=" +
      encodeURIComponent(idPregunta)
  );
  obj.send();
}

function actualizarPregunta(event) {
  console.log(idPreguntaActualizar);
  console.log("object");
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
    mostrarAlerta(this.responseText);
    consultarPregunta();
  };

  obj.open(
    "GET",
    "./php/consultas/admin/actualizarPregunta.php?id=" +
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

function login(event) {
  event.preventDefault(); // Prevenir el comportamiento predeterminado del formulario

  // Obtener los valores del formulario
  const user = document.getElementById("user").value;
  const pass = document.getElementById("pass").value;

  // Crear el objeto XMLHttpRequest
  const obj = new XMLHttpRequest();

  // Definir la función de callback para manejar la respuesta
  obj.onload = function () {
    try {
      // Parsear la respuesta como JSON
      const result = JSON.parse(this.responseText);

      console.log("Respuesta JSON:", result);

      if (result.status === "success") {
        const respuesta = result.data.respuesta;
        const usuario = result.data.usuario;

        console.log("Respuesta:", respuesta);
        console.log("Usuario:", usuario);

        if (respuesta) {
          // window.location.href = "/html/admin/adminDashboard.html";
          mostrarAlerta(`Bienvenido, ${usuario}`);

          //   document.getElementById("alertas").innerHTML = `<p style="color: red;">${result.message}</p>`;

          const obj2 = new XMLHttpRequest(); // Crear una instancia de XMLHttpRequest
          obj2.open("GET", "./html/admin/adminDashboard.html", true); // Configurar la solicitud (GET al archivo)

          obj2.onload = function () {
            if (obj2.status === 200) {
              // Inyectar el contenido del archivo en el elemento destino
              document.getElementById("visual").innerHTML = obj2.responseText;

              console.log(obj2.responseText);
            } else {
              console.error("Error al cargar el archivo HTML:", obj2.status);
              document.getElementById(
                ('visual')
              ).innerHTML = `<p>Error al cargar contenido.</p>`;
            }
          };

          obj2.onerror = function () {
            console.error("Error de conexión al cargar el archivo HTML.");
          };

          obj2.send(); // Enviar la solicitud
        }
      } else {
        // Mostrar mensaje de error
        document.getElementById(
          "alertas"
        ).innerHTML = `<p style="color: red;">${result.message}</p>`;

        mostrarAlerta(`<h3>${result.message}</h3>`);
      }
    } catch (error) {
      console.error("Error al procesar la respuesta:", error);
      document.getElementById(
        "alertas"
      ).innerHTML = `<p style="color: red;">Error en el servidor. Intenta nuevamente.</p>`;
    }
  };

  // Configurar la solicitud POST
  obj.open("POST", "./php/consultas/login.php", true);

  // Establecer el encabezado para enviar datos como formulario
  obj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  // Enviar los datos en el cuerpo de la solicitud
  obj.send(
    "user=" + encodeURIComponent(user) + "&pass=" + encodeURIComponent(pass)
  );
}
