<?php
require "../template/header.php";
?>

<main class="container">
    <h1 class="text-center">Lista de Personas</h1>
    <a href="crear-persona.php" class="btn btn-success"><i class="fa-solid fa-user-plus"></i> Crear Persona</a>

    <table id="tblPersonas" class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Teléfono</th>
                <th scope="col">Email</th>
                <th scope="col">Opciones</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>4567890</td>
                <td>mark@info.com</td>
                <td>
                    <a href="<?= BASE_URL ?>views/persona/editar-persona.php?p=1" class="btn btn-outline-primary btn-sm" title="Eliminar registro"><i class="fa-solid fa-user-pen"></i></a>
                    <button class="btn btn-outline-danger btn-sm" title="Eliminar registro"><i class="fa-solid fa-trash"></i></button>
                </td>
            </tr>
        </tbody>
    </table>
</main>

<?php
require "../template/footer.php";
?>