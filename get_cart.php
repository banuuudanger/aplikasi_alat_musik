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

$sql = "SELECT k.id, k.user_id, k.produk_id, k.kuantiti, p.nama, p.harga, p.gambar 
        FROM keranjang k
        INNER JOIN produk p ON k.produk_id = p.id";
$result = $conn->query($sql);

$cart_items = array();
while($row = $result->fetch_assoc()) {
    $cart_items[] = $row;
}

echo json_encode($cart_items);

$conn->close();
?>
