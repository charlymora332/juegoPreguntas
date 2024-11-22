function cargarHtml(div, url) {
  const obj = new XMLHttpRequest();

  obj.onload = function () {
    // Cuando se elimina la pregunta, recargamos las preguntas con el filtro actual
    document.getElementById("visual").innerHTML = this.responseText;

    // Llamamos a la función para recargar las preguntas con el mismo filtro de dificultad
  };

  obj.open("GET", url);
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



let preguntas = []; // Variable global para almacenar preguntas
let preguntaActual = 0; // Índice de la pregunta actual

function jugarConsulta(event) {
  event.preventDefault();

  nivel = document.getElementById("nivel").value;
  console.log("Nivel seleccionado:", nivel);

  const obj = new XMLHttpRequest();

  obj.onload = function () {
    const respuesta = JSON.parse(this.responseText);

    if (respuesta.status === "success") {
      preguntas = respuesta.preguntas; // Guardamos las preguntas en la variable global
      preguntaActual = 0; // Reiniciamos el índice de preguntas
      mostrarPregunta(); // Iniciamos el ciclo de preguntas
    } else {
      mostrarAlerta("Error al cargar las preguntas: " + respuesta.message);
    }
  };

  obj.open(
    "GET",
    "./php/consultas/user/consultarPreguntas.php?nivel=" +
      encodeURIComponent(nivel)
  );
  obj.send();
}

let puntuacion = 0;
function mostrarPregunta() {
  const container = document.getElementById("visual");
  container.innerHTML = ""; // Limpiar el contenedor

  if (preguntaActual < preguntas.length) {
    const pregunta = preguntas[preguntaActual];

    // Crear título de la pregunta
    const preguntaTitulo = document.createElement("h3");
    preguntaTitulo.textContent = pregunta.pregunta;
    container.appendChild(preguntaTitulo);

    // Crear contenedor de respuestas

    const ctnRespuestas = document.createElement("div");
    ctnRespuestas.classList.add("ctnRespuestas");
    container.appendChild(ctnRespuestas);

    pregunta.respuestas.forEach((respuesta, index) => {
      const opcion = document.createElement("div");

      opcion.classList.add("opcion");

      const input = document.createElement("input");
      input.type = "radio"; // Usamos radio buttons para una única respuesta
      input.name = "respuesta";
      input.id = `respuesta-${index}`;
      input.value = respuesta.correcto; // Guardamos si es correcta

      const label = document.createElement("label");
      label.htmlFor = `respuesta-${index}`;

      label.textContent = respuesta.texto;

      opcion.appendChild(input);
      opcion.appendChild(label);
      ctnRespuestas.appendChild(opcion);
    });

    // Agregar botón para la siguiente pregunta
    const botonSiguiente = document.createElement("button");

    botonSiguiente.textContent = "Siguiente";
    botonSiguiente.onclick = validarRespuesta;
    container.appendChild(botonSiguiente);

    const mensaje = document.createElement("h3");
    const mensaje2 = document.createElement("h3");
    let valoracion = "";

    let porcentaje = (puntuacion / preguntaActual) * 100;

    if (porcentaje >= 80) {
      // Puntuación Alta (verde)
      mensaje.style.color = "green";
      mensaje.style.fontWeight = "bold";
      valoracion = "Puntuación Alta";
    } else if (porcentaje >= 50) {
      // Puntuación Media (amarillo)
      mensaje.style.color = "orange";
      mensaje.style.fontWeight = "normal";
      valoracion = "Puntuación Media";
    } else {
      // Puntuación Baja (rojo)
      mensaje.style.color = "red";
      mensaje.style.fontWeight = "normal";
      valoracion = "Puntuación Baja";
    }
    mensaje.textContent = `${valoracion} `; // Muestra el número de la pregunta actual
    container.appendChild(mensaje);
    mensaje2.textContent = `${puntuacion} / ${preguntaActual}`;
    container.appendChild(mensaje2);
  } else {
    mostrarResultados(preguntas.length, puntuacion); // Si no hay más preguntas, mostramos los resultados
    puntuacion = 0;
  }
}
function validarRespuesta() {
  const seleccionada = document.querySelector(
    "input[name='respuesta']:checked"
  );

  if (!seleccionada) {
    mostrarAlerta(`Por favor selecciona una respuesta.`);
    return;
  }

  const esCorrecta = seleccionada.value === "true"; // Comprobar si es correcta

  if (esCorrecta) {
    puntuacion++; // Incrementa la puntuación en 1
  }

  // Incrementamos el índice de preguntas y mostramos la siguiente
  preguntaActual++;
  mostrarPregunta();
}
function mostrarResultados(preg, rtaCorrectas) {
  const container = document.getElementById("visual");
  container.innerHTML = ` <button onclick="cargarHtml('visual', './html/usuario/dashboardUser.html')">Jugar De Nuevo</button>`;
  mostrarAlerta(`<h3>¡Juego terminado!</h3> </br>
         Puntuacion ${rtaCorrectas} /    ${preg} 

          `);
}
