<?php

require('database.php');

class newUser 
{
    function checkIfExists()
    {
        $db = new Connect();
        $db->connectDB();

        
    }
}