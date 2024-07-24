<?php

// Simulación de una base de datos de usuarios
$users = [
    "usuario1" => "contrasena1",
    "usuario2" => "contrasena2"
];

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["usuario"];
    $password = $_POST["password"];

    if (!isset($users[$usuario])) {
        $error = "El usuario no existe.";
    } elseif ($users[$usuario] !== $password) {
        $error = "La contraseña es incorrecta.";
    } else {
        $_SESSION["usuario"] = $usuario;
        $pagina="producto";
        header("Location: index.php?p=$pagina");
        exit();
    }
}
?>


    <div class="login-container">
        <h1>Iniciar sesión</h1>
        <form method="POST" action="">
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" required>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Ingresar</button>
            <?php if ($error): ?>
                <p class="error"><?php echo $error; ?></p>
            <?php endif; ?>
        </form>
    </div>
    <script src="scripts.js"></script>

