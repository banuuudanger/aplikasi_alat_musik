<?php
$servername = "localhost";
$username = "mobw7774_user_banu";
$password = "banu182@";
$dbname = "mobw7774_api_banu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['user_id'];

    $sql = "SELECT SUM(p.harga * k.jumlah) AS total
            FROM keranjang k
            JOIN produk p ON k.produk_id = p.id
            WHERE k.user_id = $user_id";

    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $total = $row['total'];

    $sql = "INSERT INTO buktipembayaran (user_id, total) VALUES ($user_id, $total)";
    if ($conn->query($sql) === TRUE) {
        echo "Payment successful";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>
