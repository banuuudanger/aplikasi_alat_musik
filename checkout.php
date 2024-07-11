<?php
$servername = "localhost";
$username = "mobw7774_user_banu";
$password = "banu182@";
$dbname = "mobw7774_api_banu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user_id = $_POST['user_id'];

$sql = "SELECT SUM(produk.harga * keranjang.kuantiti) as total FROM keranjang JOIN produk ON keranjang.produk_id = produk.id WHERE keranjang.user_id = '$user_id'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$total = $row['total'];

$sql = "INSERT INTO buktipembayaran (user_id, total) VALUES ('$user_id', '$total')";
if ($conn->query($sql) === TRUE) {
    $sql = "DELETE FROM keranjang WHERE user_id = '$user_id'";
    $conn->query($sql);
    echo "Checkout successful";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
