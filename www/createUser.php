<?php

// Class that handles errors.
require('ErrorHandling.php');
// Class with login functions.
require('insertNewUser.php');

// Instantiate object
$e = new Authenticate();
$e->Login();

?>

<!DOCTYPE html>
<html>
    <head>
        <h1>Create User:</h1>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <!-- action directs the method to another page -->
        <div class="form">
            <form id='createUser' action='createUser.php' method='post' accept-charset='UTF-8'>
                <fieldset >
                    <legend>User Details</legend>
                    <input type='hidden' name='submitted' id='submitted' value='1'/>

                    <label for='username' >Username:</label>
                    <input type='text' name='username' id='username'  maxlength="50" />
                    <br>

                    <label for='password' >Password:</label>
                    <input type='password' name='password' id='password' maxlength="50" />
                    <br>

                    <label for='passwordConfirm' >Confirm Password:</label>
                    <input type='password' name='passwordConfirm' id='passwordConfirm' maxlength="50" />
                    <br>

                    <label for='firstName'>First Name:</label>
                    <input type='text' name='firstName' id='firstName' maxlength="300" />
                    <br>

                    <label for='lastName'>Last Name:</label>
                    <input type='text' name='lastName' id='firstName' maxlength="300" />

                    <input type='submit' name='Submit' value='Submit' />

                </fieldset>
            </form>
        </div>
    </body>
</html>