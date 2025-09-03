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
    console.log(json);
  } catch (error) {
    console.log("Ocurrió un error: " + error);
  }
}

getPersona();
