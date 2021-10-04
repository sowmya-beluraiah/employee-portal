<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/bootstrap/1.10.9/css/datatables.bootstrap4.min.css">
	<link href="css/custom.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap4.min.js"></script>
    
        
    <title>Employee Portal</title>
  </head>
  <body>
    <nav class="navbar navbar-dark navbar-expand-sm bg-primary fixed-top">
        <div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>
			
            <div class="collapse navbar-collapse" id="Navbar">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-home fa-lg"></span> Employee Portal</a></li>
                </ul>
			</div>
			            
        </div>
    </nav>

    <header class="jumbotron">
    <div class="container">
        <div class="row row-header">
            <div class="col">
                <div id="mycarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <p>This portal provides details about our employees, their managerial hierarchy information                        </div>
                        <div class="carousel-item">
                            <p>Also this portal enables to do CRUD operations on employee records </p>
                        </div>
            		</div>
            		<ol class="carousel-indicators">
                        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#mycarousel" data-slide-to="1"></li>
                    </ol>
					<a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
        		</div>
        	</div>
        </div>
    </div>
    </header>

	<div class="container">
		<div class="row row-content">
			<div class="col">
			
				<div id="accordion">	  
				  <div class="card">
				    <div class="card-header" id="headingOne">
				      <h5 class="mb-0">
				        <button class="btn btn-link heading-btn" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          Get All Employee Details
				        </button>
				      </h5>
				    </div>
				    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				      <div id="getAllQuery" class="card-body">
				      	<button onClick="getAll()" type="button" class="btn btn-primary">Get All Employee Details</button>
				      </div>
				      <div id="getAllResult" class="card-body" style="display: none">
				      	<table class="table table-striped table-bordered getAllTable" style="width: 100%">
				      		<thead>
				      			<tr>
				      				<th> Id </th>
				      				<th> Name </th>
				      				<th> Email </th>
				      				<th> PhNo </th>
				      				<th> Role </th>
				      				<th> Action </th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      		</tbody>
				      	</table>
				      </div>
				    </div>
				  </div>
				  
				  <div class="card">
				    <div class="card-header" id="headingThree">
				      <h5 class="mb-0">
				        <button class="btn btn-link heading-btn collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				          Get Individual Employee Details
				        </button>
				      </h5>
				    </div>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
				      <div id="getEmployeeQuery" class="card-body">
				      	<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <span class="input-group-text" id="inputGroup-sizing-default">Emp ID</span>
						  </div>
						  <input type="number" id="empIdGetEmp" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
						</div>
				      	<button onClick="getEmployee()" type="button" class="btn btn-primary">Get Employee Details</button>
				      </div>
				      <div id="getEmployeeRes" class="card-body" style="display: none">
				      	<form>
				      	  <div class="input-group">
							  <div class="form-group">
							    <label for="name">Name</label>
							    <input type="text" class="form-control" id="empname" readOnly>
							  </div>
							  <div class="form-group">
							    <label for="email">Email</label>
							    <input type="email" class="form-control" id="empemail" readOnly>
							  </div>
							  <div class="form-group">
							    <label for="phno">PhNo</label>
							    <input type="number" class="form-control" id="empphno" readOnly>
							  </div>
							  <div class="form-group">
							    <label for="role">Role</label>
							    <input type="text" class="form-control" id="emprole" readOnly>
							  </div>
						  </div>
						</form> 
				      </div>
				    </div>
				  </div>
				  
				  <div class="card">
				    <div class="card-header" id="headingTwo">
				      <h5 class="mb-0">
				        <button class="btn btn-link heading-btn collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          Create Employee
				        </button>
				      </h5>
				    </div>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
				      <div id="createEmployee" class="card-body">
				      	<form>
				      	  <div class="input-group">
							  <div class="form-group">
							    <label for="name">Name</label>
							    <input type="text" class="form-control" id="name" placeholder="Enter Name">
							  </div>
							  <div class="form-group">
							    <label for="email">Email</label>
							    <input type="email" class="form-control" id="email" placeholder="Enter email">
							  </div>
							  <div class="form-group">
							    <label for="phno">PhNo</label>
							    <input type="number" class="form-control" id="phno" placeholder="Enter PhNo">
							  </div>
							  <div class="form-group">
							    <label for="role">Role</label>
							    <input type="text" class="form-control" id="role" placeholder="Enter Role">
							  </div>
							  <div class="form-group">
							    <label for="role">Reporting Mgr</label>
							    <input type="text" class="form-control" id="mgr" placeholder="Enter Reporting Mgr">
							  </div>
						  </div>
						  
						  <button type="button" onClick="createEmp()" class="btn btn-primary">Submit</button>
						</form> 
				      </div>
				    </div>
				  </div>
				  
				  <div class="card">
				    <div class="card-header" id="headingFive">
				      <h5 class="mb-0">
				        <button class="btn btn-link heading-btn collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
				          Get Reportee's
				        </button>
				      </h5>
				    </div>
				    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
				      <div id="getReporteeQuery" class="card-body">
				      	<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <span class="input-group-text" id="inputGroup-sizing-default">Emp ID</span>
						  </div>
						  <input type="number" id="empIdReportee" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
						</div>
				      	<button onClick="getReportees()" type="button" class="btn btn-primary">Get Reportees</button>
				      </div>
				      <div id="getReporteeRes" class="card-body" style="display: none">
				      	<table class="table table-striped table-bordered getReporteeTable" style="width: 100%">
				      		<thead>
				      			<tr>
				      				<th> Id </th>
				      				<th> Name </th>
				      				<th> Email </th>
				      				<th> PhNo </th>
				      				<th> Role </th>
				      			</tr>
				      		</thead>
				      		<tbody>
				      		</tbody>
				      	</table>
				      </div>
				    </div>
				  </div>
				  
				  <div class="card">
				    <div class="card-header" id="headingSix">
				      <h5 class="mb-0">
				        <button class="btn btn-link heading-btn collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseThree">
				          Get Employee Hierarchy
				        </button>
				      </h5>
				    </div>
				    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
				      <div id="getHierarchyQuery" class="card-body">
				      	<div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <span class="input-group-text" id="inputGroup-sizing-default">Emp ID</span>
						  </div>
						  <input type="number" id="empIdHierarchy" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
						</div>
						<button onClick="getHierarchy()" type="button" class="btn btn-primary">Get Hierarchy</button>
				      </div>
				      <div id="getHierarchyResult" class="card-body" style="display: none">
				      	<nav aria-label="breadcrumb">
						  <ol class="breadcrumb">
						  </ol>
						</nav>
				      </div>
				    </div>
				  </div>
				  
				</div>
			
			</div>
		</div>
	</div>


	<footer class="footer">
        <div class="container">
            <div class="row">             
                <div class="col-4 offset-1 col-sm-2">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Menu</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="col-7 col-sm-5">
                    <h5>Our Address</h5>
                    <address>
		              Bangalore<br>
		              Karnataka<br>
		              India<br>
		              <i class="fa fa-phone fa-lg"></i>: +91 9739593303<br>
                      <i class="fa fa-envelope fa-lg"></i>: 
                      <a href="mailto:sowmyab36@gmail.com">sowmyab36@gmail.com</a>
		           </address>
                </div>
            </div>
            <div class="row justify-content-center ">             
                <div class="col-auto">
                    <p>© Copyright 2021 Sowmya B</p>
                </div>
            </div>
        </div>
    </footer>
	<script type="text/javascript" src="js/custom.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#mycarousel").carousel( { interval: 2000 } );
        });
        
        $('.heading-btn').click(function() {
        	$('#getAllQuery').show();
        	$('#getAllResult').hide();
        	
        	$('#getEmployeeQuery').show();
        	$('#getEmployeeRes').hide();
        	
        	$('#getReporteeQuery').show();
        	$('#getReporteeRes').hide();
        	
        	$('#getHierarchyQuery').show();
        	$('#getHierarchyResult').hide();
        	
        	$('#empIdHierarchy').val("");
        	$('#empIdReportee').val("");
        	$('#empIdGetEmp').val("");
        	$('#name').val("");
        	$('#email').val("");
        	$('#phno').val("");
        	$('#role').val("");
        	$('#mgr').val("");
        	
        });
	</script>
  </body>
</html>