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
$produk_id = $_POST['produk_id'];
$kuantiti = $_POST['kuantiti'];

$sql = "SELECT * FROM keranjang WHERE user_id = '$user_id' AND produk_id = '$produk_id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $new_kuantiti = $row['kuantiti'] + $kuantiti;
    $sql = "UPDATE keranjang SET kuantiti = '$new_kuantiti' WHERE user_id = '$user_id' AND produk_id = '$produk_id'";
} else {
    $sql = "INSERT INTO keranjang (user_id, produk_id, kuantiti) VALUES ('$user_id', '$produk_id', '$kuantiti')";
}

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
