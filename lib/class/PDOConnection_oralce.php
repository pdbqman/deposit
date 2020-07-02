<?php
class PDOConnection {
    private	$dbh;
	public	$not_error = 1;
	public	$str_error = "";

    function __construct($db_username, $db_password, $dbtns) {
        try {
            $this->dbh = new PDO("oci:dbname=" . $dbtns . ";charset=utf8", $db_username, $db_password, array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING, //PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC));
        } catch (PDOException $e) {
			$this->str_error = $e->getMessage();
			$this->not_error = 0;
        }
    }

    public function select($sql) {
		$sql_stmt = $this->dbh->prepare($sql);
		$sql_stmt->execute();
		$result = $sql_stmt->fetchAll(PDO::FETCH_ASSOC);
		return $result;
    }

    public function insert($sql) {
        $sql_stmt = $this->dbh->prepare($sql);
        try {
            $result = $sql_stmt->execute();
        } catch (PDOException $e) {
            trigger_error('Error occured while trying to insert into the DB:' . $e->getMessage(), E_USER_ERROR);
        }
        if ($result) {
            return $sql_stmt->rowCount();
        }
    }

    function __destruct() {
        $this->dbh = NULL;
    }

}
?>