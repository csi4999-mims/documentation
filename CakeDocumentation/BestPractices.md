# CakePHP Basics #
  
We are using version 3.x of CakePHP
  
When looking up tips online make sure you are looking at version 3.x
because it is very different from 2.x
  
# File Structure for CakePHP #
  
## Model ##
  
The Model/ consists of 3 sub folders which make up the model
  
Model file names use the "php" extension
  
### Table ###
  
Table Objects provide access to the collection of entities stored in a
specific table
  
This is similar to the standard Model in MVC
  
The table file name is the plural controller name followed by "Table"
  
Ex. "UsersTable.php"
  
### Entity ###
  
Entities represent individual rows or domain objects in the app
  
The entity file name is the singular controller name
  
Ex. "User.php"
  
### Behavior ###
  
Behaviors are used for packaging behaviors that are common across many
models
  
## Template(View) ##
  
The template files use the "ctp" file extension
  
The view files go in Template/PLURAL CONTROLLER NAME
  
Ex. "Template/Users"
  
Views must have a function in the controller in order to be rendered

## Controller ##
  
The controllers use the "php" file extension
  
The AppController.php comes with the install of cakePHP
  
The Controller is plural
  
Ex. "UsersController.php"


