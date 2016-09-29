<?php
$mysqli = new mysqli("localhost", "root", "15g1ft5£", "15gifts");

if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

// Select a single, random quote
$query = "SELECT * FROM test_table ORDER BY RAND() LIMIT 1";
$result = $mysqli->query($query);

while ($row = $result->fetch_assoc()) {
    $quote  = $row['randomQuotes'];
    $author = $row['author'];
}

$result->free();
$mysqli->close();

?><!DOCTYPE html>
<html>
    <head>
        <title>Quote Generator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            *{
                font-family: arial;
                font-size: 105%;
            }
        </style>
    </head>
    <body>
        <div><em>"<?=$quote;?>"</em></div>
        <div><strong><?=$author;?></strong></div>
    </body>
</html>
