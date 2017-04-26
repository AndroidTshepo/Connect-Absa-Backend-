<?php

require 'connection.php';
require 'functions.php';
require 'validations.php';

//construct our Connect class

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST,GET,OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');

function generalExceptionHandler($e) {
	$info = json_decode($e->getMessage(),true);
    $data = array('status' => 'error');
    isset($info['imgException'])?$data['imgException'] = $info['imgException']:null;
    isset($info['success'])?$data['success'] = $info['success']:null;
    isset($info['message'])?$data['message'] = $info['message']:null;
	isset($info['Params'])?$data['Params'] = $info['Params']:null;

//giving a 200 status code when the call is for an image
    if($data['imgException']){
        http_response_code(200);
    }else{
        http_response_code(400); 
    }
    header("Content-Type: application/json");
    echo json_encode($data);
}
set_exception_handler('generalExceptionHandler');


$validate 	= new Validates();
$function 	= new Functions();
// what was the request
// Access control would go first here
// Look for a valid action
if(isset($_POST['method'])) {
    switch($_POST['method']) {
        case "getComments":
            $data		= $function->getComments($mysqli);
            break;
        case "updateSeen":
            $data		= $function->updateSeen($mysqli);
            break;
         case "insertComment":
            $data		= $function->insertComment($mysqli);
            break;           
            
        case "getCompanyServices":
            $data		= $validate->getCompanyServices();
            $data		= $function->getCompanyServices($mysqli);
            break;
        default:
            http_response_code(400);
            $data = array("error" => "bad request");
            $data['status'] = "error";
            $data['success'] = false;
            $data['message'] = "Invalid Method specified";
            break;
    }
} else {
    http_response_code(200);

    $data['status'] = "error";
    $data['success'] = false;
    $data['message'] = "No method specified";
}



// let's send the data back
header("Content-Type: application/json");
echo json_encode($data);
?>