<?php
$servername = "localhost";
$username = "mobw7774_user_banu";
$password = "banu182@";
$dbname = "mobw7774_api_banu";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$kategori = $_GET['kategori'];

$sql = "SELECT * FROM produk WHERE kategori=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $kategori);
$stmt->execute();
$result = $stmt->get_result();

$products = array();
while($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode($products);

$stmt->close();
$conn->close();
?>
