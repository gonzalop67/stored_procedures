async function getPersona() {
  try {
    let resp = await fetch(
      base_url + "controllers/Persona.php?op=listregistros"
    );
    json = await resp.json();
    if (json.status) {
      let data = json.data;
      data.forEach((item) => {
        let newtr = document.createElement("tr");
        newtr.id = "row_" + item.idpersona;
        newtr.innerHTML = `<tr>
                                <th scope="row">${item.idpersona}</th>
                                <td>${item.nombre}</td>
                                <td>${item.apellido}</td>
                                <td>${item.telefono}</td>
                                <td>${item.email}</td>
                                <td>${item.options}</td>
                            </tr>`;
        document.querySelector("#tblBodyPersonas").appendChild(newtr);
      });
    }
  } catch (error) {
    console.log("Ocurrió un error: " + error);
  }
}

if (document.querySelector("#tblBodyPersonas")) {
  getPersona();
}

if (document.querySelector("#frmRegistro")) {
  let frmRegistro = document.querySelector("#frmRegistro");
  frmRegistro.onsubmit = function (e) {
    e.preventDefault();
    fntGuardar();
  };

  async function fntGuardar() {
    let strNombre = document.querySelector("#txtNombre").value;
    let strApellido = document.querySelector("#txtApellido").value;
    let intTelefono = document.querySelector("#txtTelefono").value;
    let strEmail = document.querySelector("#txtEmail").value;

    if (
      strNombre == "" ||
      strApellido == "" ||
      intTelefono == "" ||
      strEmail == ""
    ) {
      alert("Todos los campos son obligatorios.");
      return;
    }

    try {
      const data = new FormData(frmRegistro);
      let resp = await fetch(base_url + "controllers/Persona.php?op=registro", {
        method: "POST",
        mode: "cors",
        cache: "no-cache",
        body: data,
      });
      json = await resp.json();
      if (json.status) {
        swal("Guardar", json.msg, "success");
        frmRegistro.reset();
      } else {
        swal("Guardar", json.msg, "error");
      }
    } catch (error) {
      console.log("Ocurrió un error: " + error);
    }
  }
}

async function fntMostrar() {
  const formData = new FormData();
  formData.append("idpersona", id);
  try {
    let resp = await fetch(
      base_url + "controllers/Persona.php?op=verregistro",
      {
        method: "POST",
        mode: "cors",
        cache: "no-cache",
        body: formData,
      }
    );
    json = await resp.json();
    if (json.status) {
      document.querySelector("#txtId").value = json.data.idpersona;
      document.querySelector("#txtNombre").value = json.data.nombre;
      document.querySelector("#txtApellido").value = json.data.apellido;
      document.querySelector("#txtTelefono").value = json.data.telefono;
      document.querySelector("#txtEmail").value = json.data.email;
    } else {
      window.location = base_url + "views/persona/";
    }
  } catch (error) {
    console.log("Ocurrió un error: " + error);
  }
}
