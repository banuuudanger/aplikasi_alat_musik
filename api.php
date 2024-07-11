<?php
$servername = "localhost";
$username = "mobw7774_user_banu";
$password = "banu182@";
$dbname = "mobw7774_api_banu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $sql = "SELECT * FROM produk";
    $result = $conn->query($sql);

    $produk = array();
    while ($row = $result->fetch_assoc()) {
        $produk[] = $row;
    }

    echo json_encode($produk);
}
?>
