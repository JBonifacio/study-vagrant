<?php

// Class that handles errors.
require('ErrorHandling.php');
// Class with login functions.
require('AuthenticateUser.php');

// Instantiate object
$e = new Authenticate();
$e->Login();

?>

<html>
    <!--
        -- html "id" attribute assigns a specific element, in this case the form
        -- action indicates where we are sending form data to.  in this case we are sending it to process at loginPage.php
        -- method determines how the broswer and server will communicate.  the 'post' request will send data via the HTTP body instead of the url in the 'get' request.
    -->
    <h1>Login Page:</h1>
    <!-- action directs the method to another page -->
    <form id='login' action='login.php' method='post' accept-charset='UTF-8'>
        <fieldset >
            <legend>Login</legend>
            <input type='hidden' name='submitted' id='submitted' value='1'/>

            <label for='username' >UserName*:</label>
            <input type='text' name='username' id='username'  maxlength="50" />

            <label for='password' >Password*:</label>
            <input type='password' name='password' id='password' maxlength="50" />

            <input type='submit' name='Submit' value='Submit' />

        </fieldset>
    </form>

</html>