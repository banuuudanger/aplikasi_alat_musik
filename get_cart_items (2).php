<?php
// Set headers to allow CORS (Cross-Origin Resource Sharing)
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Database connection
$servername = "localhost";
$username = "mobw7774_user_banu";
$password = "banu182@";
$dbname = "mobw7774_api_banu";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to retrieve cart items (adjust as per your database schema)
    $query = "SELECT k.id, k.user_id, k.produk_id, k.kuantiti, p.nama, p.harga, p.gambar FROM keranjang k
              INNER JOIN produk p ON k.produk_id = p.id";

    $stmt = $pdo->prepare($query);
    $stmt->execute();

    // Fetch all rows as associative array
    $cart_items = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return JSON response
    http_response_code(200);
    echo json_encode($cart_items);
} catch (PDOException $e) {
    // If there is an error with the database connection or query
    http_response_code(500);
    echo json_encode(array("message" => "Failed to retrieve cart items. " . $e->getMessage()));
}
?>
