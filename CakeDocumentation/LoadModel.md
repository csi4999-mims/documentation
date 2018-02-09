# How to Load Models in Controllers  
## Single Model Instance in Matching Controller  
1) Include the reference to the controller that is associated with the model you plan to loads  

**"use App\Controller\ReportsController;"   

2) Get the model data

**"$user =$this->Users->get($this->Auth->user('id'));"  

3) Set the model to be used

**"$this->set('user',$user);" 

## Single Model Instance in Different Controller  
1) Include the reference to the controller that is associated with the model you plan to loads  

**"use App\Controller\ReportsController;"  

2) Load the model  

**"$this->loadModel('Reports');"  

3) Get the model data  

**"$report = $this->Reports->get('all');" 

4) Set the model to be used  

**"$this->set('report',$report);"  

## Load Array of Model Data in Different Controller  
**Coming Soon
