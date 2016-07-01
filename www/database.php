<?php

// Creates postgres db connections
class Connection
{
    // array of pg_connect() arguments and values
    private $connectionSettings = array(
        "host" => "localhost",
        "dbname" => "vagrant",
        "user" => "vagrant",
        "password" => "vagrant",
        );
    private $connectionString = null;
    private $connection;

    // up instantiation, sets values to var connectString
    public function __construct()
    {
        $string = NULL;
        foreach ($this->connectionSettings as $arg => $val) {
            if(!empty($val)) {
                $string .= $arg."=".$val." ";
            }
        }
        $this->connectionString = $string;
    }

    // connects to db
    protected function connectDB()
    {
        $this->connection = pg_connect($this->connectionString);
        return $this;
    }

    // echos db connection for testing
    public function getConnectDB()
    {
        echo var_dump($this->connectDB());
    }

    // checks if a conection exists
    public function check()
    {
        if (!$this->connection) {
            $error = new ErrorHandling();
            $error->SpitError("Database login failed!  Please contact a website administrator!");

            return false;
        }
        echo "All is well!";
        return true;
    }

    // spits out connection string
    public function getConnectionString()
    {
        return $this->connectionString;
    }
}