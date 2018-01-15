<?php
header('Content-Type: application/json');

//database
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_Name', 'leahs');

$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_Name);

$querychart= sprintf("SELECT productList_name as 'name', count(issuance_list.issue_id) AS 'Frequency' FROM clients INNER JOIN issuance ON  clients.c_id = issuance.client_id INNER JOIN issuance_list ON issuance.issue_id = issuance_list.issue_id INNER JOIN product_list ON productList_id = issuance_list.prod_id WHERE c_location= 'Baguio' GROUP BY productList_name ORDER BY Frequency DESC; ");

$result = $mysqli->query($querychart);

$data = array();
foreach($result as $row){
	$data[] = $row;
}

$result->close();
$mysqli->close();

print json_encode($data);
?>