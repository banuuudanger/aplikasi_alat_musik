<?php
$servername = "localhost";  // Biasanya "localhost" jika server database berada di server yang sama
$username = "mobw7774_user_banu";     // Ganti dengan username database Anda
$password = "banu182@";     // Ganti dengan password database Anda
$dbname = "mobw7774_api_banu";  // Ganti dengan nama database Anda

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
