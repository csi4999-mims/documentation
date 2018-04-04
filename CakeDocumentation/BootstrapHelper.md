# Bootstrap Helper Documentation  

https://holt59.github.io/cakephp3-bootstrap-helpers/  

## Installation  
To install the Bootstrap Helper for CakePHP you need to run the following commands or add the following code:  

~~~
composer require holt59/cakephp3-bootstrap-helpers:dev-master  
~~~  

Add this line to `/config/bootstrap.php`:  

~~~
Plugin::load('Bootstrap');  
~~~  
Add these lines to `AppController.php`:  

~~~
public $helpers = [
    'Form' => [
        'className' => 'Bootstrap.Form'
    ],
    'Html' => [
        'className' => 'Bootstrap.Html'
    ],
    'Modal' => [
        'className' => 'Bootstrap.Modal'
    ],
    'Navbar' => [
        'className' => 'Bootstrap.Navbar'
    ],
    'Paginator' => [
        'className' => 'Bootstrap.Paginator'
    ],
    'Panel' => [
        'className' => 'Bootstrap.Panel'
    ]
];  
~~~  

Add these lines to `Layout/default.ctp`:  

~~~
<?php
echo $this->Html->css('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css');
echo $this->Html->script([
    'https://code.jquery.com/jquery-1.12.4.min.js',
    'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'
]);
?>  
~~~  

## Using the Helpers  
### Modal Helper  
A modal is a window that can dynamically pop up when you specify it to. For example when someone presses a button on the screen a modal can pop up.  

#### Modal using CakePHP Syntax  

https://holt59.github.io/cakephp3-bootstrap-helpers/modal-helper/basics/  

~~~  
<?php
    // Start a modal with a title, default value for 'close' is true
    echo $this->Modal->create("My Modal Form", ['id' => 'MyModal1', 'close' => false]) ;
?>
<p>Here I write the body of my modal !</p>
<?php
    // Close the modal, output a footer with a 'close' button
    echo $this->Modal->end() ;
    // It is possible to specify custom buttons:
    echo $this->Modal->end([
        $this->Form->button('Submit', ['bootstrap-type' => 'primary']),
        $this->Form->button('Close', ['data-dismiss' => 'modal'])
    ]);
?>  
~~~  

#### Modal using standard HTML Syntax  

~~~  
<!-- Example Button trigger modal -->
<button type="button" class="btn btn-primary example-button" data-toggle="modal" data-target="#exampleModal">
  comment
</button>  

<!-- Example Modal -->
<div id="MyModal1" tabindex="-1" role="dialog" aria-hidden="true" aria-labbeledby="MyModal1Label" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header ">
                <!-- With 'close' => true, or without specifying:
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
                <h4 class="modal-title" id="MyModal1Label">Example 1 - Simple header & footer, custom body</h4>
            </div>
            <div class="modal-body ">
                <p>Here I write the body of my modal !</p>
            </div>
            <div class="modal-footer ">
                <button class="btn btn-primary btn-primary" type="submit">Submit</button>
                <button data-dismiss="modal" class="btn btn-default" type="submit">Close</button>
            </div>
        </div>
    </div>
</div>  
~~~~  
