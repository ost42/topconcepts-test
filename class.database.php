<?php

require_once('config.php');

class Database
{
    private $_connection;
    private static $_instance; //single instance
    private $_host = host;
    private $_username = username;
    private $_password = password;
    private $_database = database;

    public static function getInstance()
    {
		 // instanzieren falls keine vorhanden
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    // constructor
    private function __construct()
    {
        $this->_connection = new mysqli(
            $this->_host,
            $this->_username,
            $this->_password,
            $this->_database
        );

        if (mysqli_connect_error()) {
            trigger_error(
                "Error: " . mysql_connect_error(),
                 E_USER_ERROR
            );
        }
    }

    // magic method : clone is empty to prevent duplication of connection
    private function __clone()
    {
    }

    // die mysqli connection
    public function getConnection()
    {
        return $this->_connection;
    }

	 // result aufbereiten
    public function get_rows($r)
    {
        if ($r->num_rows > 0) {
			  $success = true;
				while ($row = $r->fetch_assoc()) {
	 				$rows[] = $row;
				}
				return $rows;

        } else {
            return null;
        }
    }

}
