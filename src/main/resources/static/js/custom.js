function getAll(){
	$('#getAllQuery').hide();
	$('#getAllResult').show();
	//$('.getAllTable').DataTable();
    	
    $.ajax({
      type: 'GET',
      url: "http://localhost:8080/api/v1/employee/list",
      contentType: "text/plain",
      dataType: 'json',
      success: function (data) {
		console.log(data);
        populateDataTable(data);
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });
}

function populateDataTable(data) {
    //$('.getAllTable').DataTable().clear();
    $('.getAllTable').html("");
    var length = data.length;
    
    for(var i = 0; i < length; i++) {
      var emp = data[i];

      $('.getAllTable').append("<tr id='"+emp.id+"'><td>"+emp.id+"</td><td>"+emp.name+"</td><td>"+
      emp.email+"</td><td>"+emp.phno+"</td><td>"+emp.role+"</td><td><button class='btn btn-danger btn-sm btn-delete' onClick='deleteNode(" + emp.id + ")' type='button'>Delete</button> \
      <button class='btn btn-info btn-sm btn-edit' onClick='editNode(" + emp.id + ")' type='button'>Edit</button> \
      <button class='btn btn-info btn-sm btn-update' style='display:none' onClick='updateNode(" + emp.id + ")' type='button'>Update</button></td></tr>");
    }
  }

function deleteNode(id){
	$.ajax({
      type: 'DELETE',
      url: "http://localhost:8080/api/v1/employee/"+id,
      contentType: "text/plain",
      dataType: 'json',
      success: function (data) {
		alert("Deleted Successfully!!")
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });
    
    $('#'+id).remove();
}

function editNode(id){
	var id = $('#'+id).find('td:eq(0)').text();
	var name = $('#'+id).find('td:eq(1)').text();
	var email = $('#'+id).find('td:eq(2)').text();
	var phno = $('#'+id).find('td:eq(3)').text();
	var role = $('#'+id).find('td:eq(4)').text();
	
	$('#'+id).find('td:eq(1)').html("<input name='edit-name' value='"+name+"'>");
	$('#'+id).find('td:eq(2)').html("<input type='email' name='edit-email' value='"+email+"'>");
	$('#'+id).find('td:eq(3)').html("<input type='number' name='edit-phno' value='"+phno+"'>");
	$('#'+id).find('td:eq(4)').html("<input name='edit-role' value='"+role+"'>");
	
	$('#'+id).find('.btn-edit').hide();
	$('#'+id).find('.btn-delete').hide();
	$('#'+id).find('.btn-update').show();
}

function updateNode(id){
	var name = $('#'+id).find("input[name='edit-name']").val();
	var email = $('#'+id).find("input[name='edit-email']").val();
	var phno = $('#'+id).find("input[name='edit-phno']").val();
	var role = $('#'+id).find("input[name='edit-role']").val();
	
	$('#'+id).find('td:eq(1)').text(name);
	$('#'+id).find('td:eq(2)').text(email);
	$('#'+id).find('td:eq(3)').text(phno);
	$('#'+id).find('td:eq(4)').text(role);
	
	$('#'+id).find('.btn-update').hide();
	$('#'+id).find('.btn-edit').show();
	$('#'+id).find('.btn-delete').show();
	
	var empData={};
	empData["id"]=id;
	empData["name"]=name;
	empData["email"]=email;
	empData["phno"]=phno;
	empData["role"]=role;
	
	$.ajax({
      type: 'PUT',
      url: "http://localhost:8080/api/v1/employee/"+id,
      contentType: "application/json",
      dataType: 'json',
      data: JSON.stringify(empData),
      success: function (data) {
		console.log(JSON.stringify(data));
        alert("Employee updated successfully!!");
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });
	
}



function createEmp(){
	var empData={};
	empData["name"]=$('#name').val();
	empData["email"]=$('#email').val();
	empData["phno"]=$('#phno').val();
	empData["role"]=$('#role').val();
	empData["reporting_path"]=$('#mgr').val();
	console.log(JSON.stringify(empData));
	
	$.ajax({
      type: 'POST',
      url: "http://localhost:8080/api/v1/employee/",
      contentType: "application/json",
      dataType: 'json',
      data: JSON.stringify(empData),
      success: function (data) {
		console.log(JSON.stringify(data));
        alert("Employee created successfully!!");
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });	
}

function getHierarchy(){
	$('#getHierarchyQuery').hide();
	$('#getHierarchyResult').show();
	var id = $('#empIdHierarchy').val();

	$.ajax({
      type: 'GET',
      url: "http://localhost:8080/api/v1/hierarchy/"+id,
      contentType: "text/plain",
      dataType: 'json',
      success: function (data) {
		console.log(data);
        populateBreadCrumb(data);
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });
}

function populateBreadCrumb(data){
	var $this = $('.breadcrumb');
	$this.html("");
	for(var i = 0; i < data.length-1; i++) {
		var item = '<li class="breadcrumb-item"><a href="#">'+data[i].name+'</a></li>';
		$this.append(item);
	}
	var item = '<li class="breadcrumb-item active" aria-current="page">'+data[i].name+'</li>';
	$this.append(item);
}

function getReportees(){
	$('#getReporteeQuery').hide();
	$('#getReporteeRes').show();
	$('.getReporteeTable').DataTable();
    var id = $('#empIdReportee').val();

    $.ajax({
      type: 'GET',
      url: "http://localhost:8080/api/v1/reportees/"+id,
      contentType: "text/plain",
      dataType: 'json',
      success: function (data) {
		console.log(data);
        populateReporteeTable(data);
      },
      error: function (e) {
        alert("Employee not found!!");
      }
    });
}

function populateReporteeTable(data) {
    $('.getReporteeTable').DataTable().clear();
    var length = data.length;
    for(var i = 0; i < length; i++) {
      var emp = data[i];

      $('.getReporteeTable').dataTable().fnAddData( [
        emp.id,
        emp.name,
        emp.email,
        emp.phno,
        emp.role
      ]);
    }
  }
  
function getEmployee(){
	$('#getEmployeeQuery').hide();
	$('#getEmployeeRes').show();
	var id = $('#empIdGetEmp').val();
	
	$.ajax({
      type: 'GET',
      url: "http://localhost:8080/api/v1/employee/"+id,
      contentType: "text/plain",
      dataType: 'json',
      success: function (data) {
		console.log(data);
        populateEmpData(data);
      },
      error: function (e) {
        console.log("There was an error with your request...");
        console.log("error: " + JSON.stringify(e));
        alert("Request failed!!");
      }
    });
}

function populateEmpData(data){
	$('#empname').val(data.name);
	$('#empemail').val(data.email);
	$('#empphno').val(data.phno);
	$('#emprole').val(data.role);
}