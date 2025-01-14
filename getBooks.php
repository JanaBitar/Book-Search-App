<?php
header('Content-Type: application/json');
$db = new mysqli('localhost', 'root', '', 'books_db');

if ($db->connect_error) {
    die(json_encode(['error' => 'Failed to connect to database']));
}

$result = $db->query("SELECT * FROM books");
$books = [];
while ($row = $result->fetch_assoc()) {
    $books[] = $row;
}

echo json_encode($books);
?>
