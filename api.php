<?php
error_reporting(0);
$params = ($_GET);

// ausgabe als html oder json
// default = html
$params['json'] = (isset($_GET['json']) ? $_GET['json'] : 'false');

// template für die die ansicht als nutzer oder admin
// default = admin
$params['tpl'] = (isset($_GET['tpl']) ? $_GET['tpl'] : 'admin');

// default output im falle eines dramas
$output = 'Ein Fehler ist aufgetreten.';
if ($params['json'] == 'true') {
	$output = [
		"success" => "false"
	];
}

// connector
require_once('class.database.php');
$db = Database::getInstance();
$mysqli = $db->getConnection();
$mysqli->set_charset("utf8");

// was ist zu tun
switch ($params["do"]) {

	case "news_get":
		$output = news_get($db, $mysqli, $params);
		break;

	case "news_add":
		news_add($mysqli, $params);
		news_sort($mysqli);
		$output = news_get($db, $mysqli, $params);
		break;

	case "news_edit":
		news_edit($mysqli,$params);
		$output = news_get($db, $mysqli, $params);
		break;

	case "news_del":
		$output = news_del($mysqli, $params);
		break;

	case "news_move":
		$output = news_move($mysqli, $params);
		break;

	case "kat_get":
			$output = kat_get($db, $mysqli);
			break;
}

// nun noch die ausgabe als html (default) oder json
// danach sind wir durch
if ($params['json']=="true") {
	header('Content-type: application/json');
	echo json_encode($output);
} else {
	header('Content-type: text/html');
	echo $output;
}




// alle functions
function news_get($db,$mysqli,$params) {
	// alle newsartikel holen
	$all_news = news_get_all($db,$mysqli);

	// json bei bedarf
	if ($params['json'] == "true"){
		return $all_news;
	}

	// für html brauchts etwas mehr style
	// für jede ansicht (nutzer/admin) ein template
	$tpl = 'template.'.$params['tpl'].".tpl";

	// die einzelnen werte ins template rendern
	include("class.template.php");
	foreach ($all_news as $id) {
		$row = new Template($tpl);
		foreach ($id as $key => $value) {
			 $row->set($key, $value);
		}
		$single_news[] = $row;
	}

	// und zusammenfügen
	return Template::merge($single_news);
}

function news_get_all($db,$mysqli) {
	// alle artikel holen
	$sqlq = "SELECT news.id, news.title, news.cont, DATE_FORMAT(news.datum,'%d.%m.%Y - %H:%i Uhr') as datum, news.kid, user.name, kat.title as ktitle from news LEFT JOIN user ON news.uid = user.id LEFT JOIN kat ON news.kid = kat.id order by news.sort ASC;";
	// $result = $mysqli->query($sqlq);
	// $rows = $db->get_rows($result);
	// return $rows;
	// order in kurzform :
	return $db->get_rows($mysqli->query($sqlq));
}

function kat_get($db, $mysqli) {
	// alle kategorieren für den selector
	$sqlq = "SELECT id,title from kat";
	return $db->get_rows($mysqli->query($sqlq));
}

function news_add($mysqli, $params) {
	// artikel zufügen
	$sqlq = "INSERT into news (title,cont,uid,kid) values('".$params['title']."','".$params['cont']."',(SELECT id from user order by RAND() LIMIT 1),'".$params['kid']."')";
	return $mysqli->query($sqlq);
}

function news_edit($mysqli, $params) {
	// artikel editieren
	$sqlq = "UPDATE news set title = '".$params['title']."', cont = '".$params['cont']."', kid = '".$params['kid']."' WHERE id = '".$params['id']."'";
	return $mysqli->query($sqlq);
}

function news_del($mysqli, $params) {
	// artikel löschen
	$sqlq = "DELETE from news where id='".$params['id']."'";
	return  $mysqli->query($sqlq);
}

function news_move($mysqli, $params) {
	// verschieben des artikels
	$sqlq = "UPDATE news set sort=sort+'".$params['val']."' where id='".$params['xid']."'";
	$mysqli->query($sqlq);
	return news_sort($mysqli);
}

function news_sort($mysqli) {
	// ein renumber der sort-spalte, besser noch mit multi_query optimieren
	$sqlq = "SET @pos := 0;";
	$mysqli->query($sqlq);
	$sqlq = "UPDATE news SET sort = ( SELECT @pos := @pos + 2 ) ORDER BY sort asc;";
	$mysqli->query($sqlq);
}

?>
