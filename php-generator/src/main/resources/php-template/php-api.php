<?php
require_once('../classes/@@CLASS_FILE_NAME@@');
require_once('../classes/response.classes.php');
include_once('./apiutil.php');
//require_once '../classes/imagehandler.classes.php';

$@@INSTANTIATE_CLASS@@
//$imgHandler = new ImageHandler("/app/vss/backend/assets/images/avatars/");

$requestMethod = $_SERVER["REQUEST_METHOD"];
$pathParams = getPathParam();
if ($requestMethod == 'GET'):
  if ($pathParams != null):
    $id=$pathParams[0];
    if ($id == ""):
      $res = $@@OBJECT_NAME@@->getAll();
    else:
      $res = $@@OBJECT_NAME@@->getById($id);
    endif;
    $response = array( "data" => $res );
    Response::success($response);
  endif;
elseif ($requestMethod == 'POST'):
@@POST_CODE@@
elseif ($requestMethod == 'PUT'):
  $id=$pathParams[0];
@@PUT_CODE@@
elseif ($requestMethod == 'DELETE'):
  $id=$pathParams[0];
  $loginId = $pathParams[1] == null ? -1 : $pathParams[1];
  if ($id):
    $res = $@@OBJECT_NAME@@->delete($id, $loginId);
    if ($res):
      $response = array("res" => "@@OBJECT_NAME@@ {$id} deleted", "status" => $res);
      Response::success($response);
    else:
      Response::error("Unable to delete @@OBJECT_NAME@@ {$id}");
    endif;
  else:
    Response::error("No @@OBJECT_NAME@@ id");
  endif;
endif;
