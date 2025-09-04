<?php
require "../template/header.php";
?>

<main class="container">
    <h1 class="text-center">Editar Persona</h1>
    <a href="<?= BASE_URL ?>/views/persona">Listar Personas</a>

    <br><br>
    <form id="frmEditar">
        <input type="hidden" name="txtId" id="txtId" required>
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombres</label>
            <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Nombres" required>
        </div>
        <div class="mb-3">
            <label for="txtApellido" class="form-label">Apellidos</label>
            <input type="text" class="form-control" name="txtApellido" id="txtApellido" placeholder="Apellidos" required>
        </div>
        <div class="mb-3">
            <label for="txtTelefono" class="form-label">Teléfono</label>
            <input type="number" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Número de teléfono" required>
        </div>
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <input type="mail" class="form-control" name="txtEmail" id="txtEmail" placeholder="Correo electrónico" required>
        </div>
        <button type="submit" class="btn btn-info"><i class="fa-solid fa-pen"></i> Actualizar</button>
    </form>
</main>

<?php
require "../template/footer.php";
?>

<script src="../template/js/functions-persona.js"></script>
<script>
    let id = "<?= $_GET['p'] ?>";
    fntMostrar(id);
</script>