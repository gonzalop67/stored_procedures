function fntDelPersona(id) {
  swal({
    title: "¿Realmente quiere eliminar el registro?",
    text: "",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      swal("Eliminando registro", {
        icon: "success",
      });
    } else {
      swal("Se ha cancelado la acción");
    }
  });
}
