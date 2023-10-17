<?php
require_once('../classes/@@CLASS_FILE_NAME@@');
require_once('../classes/response.classes.php');
include_once('./apiutil.php');
//require_once '../classes/imagehandler.classes.php';

$@@INSTANTIATE_CLASS@@
//$imgHandler = new ImageHandler("/app/vss/backend/assets/images/avatars/");

$requestMethod = $_SERVER["REQUEST_METHOD"];
if ($requestMethod == 'GET'):
  $id = getId();
  if ($id):
    $res = $@@OBJECT_NAME@@->getById($id);
    $response = array( "data" => $res );
    Response::success($response);
  else:
    $res = $@@OBJECT_NAME@@->getAll();
    $response = array( "data" => $res );
    Response::success($response);
  endif;
elseif ($requestMethod == 'POST'):
@@POST_CODE@@
elseif ($requestMethod == 'DELETE'):
  $id = getId();
  if ($id):
    $res = $@@OBJECT_NAME@@->delete($id, -1);
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
