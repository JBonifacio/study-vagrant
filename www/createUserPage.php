<!DOCTYPE html>

<?php
    require('generateForm.php');
?>

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
                    <legend align="center">User Details</legend>
                    <input type='hidden' name='submitted' id='submitted' value='1'/>
                    
                    <div class="formField">
                        <label for='username' >Username:</label>
                        <input class="field" type='text' name='username' id='username'  maxlength="50" />
                        <br>
                    </div>
                     <div class="formField">
                        <label for='password' >Password:</label>
                        <input class="field" type='password' name='password' id='password' maxlength="50" />
                        <br>
                    </div> 
                     <div class="formField">
                        <label for='passwordConfirm' >Confirm Password:</label>
                        <input class="field" type='password' name='passwordConfirm' id='passwordConfirm' maxlength="50" />
                        <br>
                    </div>
                     <div class="formField">
                        <label for='firstName'>First Name:</label>
                        <input class="field" type='text' name='firstName' id='firstName' maxlength="300" />
                        <br>
                    </div>
                     <div class="formField">
                        <label for='lastName'>Last Name:</label>
                        <input class="field" type='text' name='lastName' id='firstName' maxlength="300" />
                    </div>
                    <div align="right">
                        <input type='submit' name='Submit' value='Submit' />
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>

<?php
$u = new generateForm(
    array(
        // array('labelFor','labelText','formType','formName','formId','maxLength'),
        array('username','Username','text','username','username',50),
        array('password','Password','password','password','password',50),
        array('passwordConfirm','Confirm Password','passwordConfirm','passwordConfirm','passwordConfirm',50),
        array('firstName','First Name','firstName','firstName','firstName',300),
        array('lastName','Last Name','lastName','lastName','lastName',300),
        array('email','Email Address','email','email','email',300), 
        array('emailConfirm','Confirm Email Address','emailConfirm','emailConfirm','emailConfirm',300)
        )
    );
$u->generateForm();