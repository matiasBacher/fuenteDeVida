<?php

// Simulación de una base de datos de usuarios
$users = [
    "usuario1" => "contrasena1",
    "usuario2" => "contrasena2"
];

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    if (!isset($users[$username])) {
        $error = "El usuario no existe.";
    } elseif ($users[$username] !== $password) {
        $error = "La contraseña es incorrecta.";
    } else {
        $_SESSION["username"] = $username;
        header("Location: welcome.php");
        exit();
    }
}
?>


    <div class="login-container">
        <h1>Iniciar sesión</h1>
        <form method="POST" action="">
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Ingresar</button>
            <?php if ($error): ?>
                <p class="error"><?php echo $error; ?></p>
            <?php endif; ?>
        </form>
    </div>
    <script src="scripts.js"></script>

