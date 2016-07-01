<?php

require('database.php');

class Authenticate {

    function Login()
    {
        if(empty($_POST['username']))
        {
            $error = new ErrorHandling();
            $error->SpitError("UserName is empty!");
            return false;
        }

        if(empty($_POST['password']))
        {
            $error = new ErrorHandling();
            $error->SpitError("Password is empty!");
            return false;
        }

        $username = trim($_POST['username']);
        $password = trim($_POST['password']);

        if(!$this->CheckLoginInDB($username,$password))
        {
            return false;
        }

        session_start();

        $_SESSION[$this->GetLoginSessionVar()] = $username;

        return true;
    }

    function CheckLoginInDB($username,$password)
    {
        $db = new Connection();
        if(!$db->connectDB())
        {
            $error = new ErrorHandling();
            $error->SpitError("Database login failed!  Please contact a website administrator!");
            return false;
        }
        $username = $this->SanitizeForSQL($username);
        $pwdmd5 = md5($password);
        $qry = "Select name, email from $this->tablename ".
            " where username='$username' and password='$pwdmd5' ".
            " and confirmcode='y'";

        $result = mysql_query($qry,$this->connection);

        if(!$result || mysql_num_rows($result) <= 0)
        {
            $this->HandleError("Error logging in. ".
                "The username or password does not match");
            return false;
        }
        return true;
    }
}

