<?php

// arguments 'labelFor','labelText','formType','formName','formId','maxLength'
class generateForm
{
    private $formElements = array();

    public function __construct($arg)
    {
        $this->formElements = $arg;
    }

    public function generateForm()
    {
        echo '
            <div class="form">
            <form id="createUser" action="createUser.php" method="post" accept-charset="UTF-8">
                <fieldset >
                    <legend align="center">User Details</legend>
                    <input type="hidden" name="submitted" id="submitted" value="1"/>
        ';
        foreach($this->formElements as $field)
        {
            $labelFor = $field[0];
            $labelText = $field[1];
            $formType = $field[2];
            $formName = $field[3];
            $formId = $field[4];
            $maxLength = $field[5];

            echo '
                <div class="formField">
                    <label for="'.$labelFor.'" >'.$labelText.'</label>
                    <input class="field" type="'.$formType.'" name="'.$formName.'" id="'.$formId.'"  maxlength="'.$maxLength.'" />
                    <br>
                </div>
            ';
        }
        ;
        echo '</fieldset></form></div></html>';
    }

    // debugging elements
    public function printFormElements()
    {
        var_dump($this->formElements);
    }
}