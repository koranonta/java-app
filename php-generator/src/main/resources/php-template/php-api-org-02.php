<?php
require_once('../classes/@@CLASS_FILE_NAME@@');
require_once('../classes/response.classes.php');
include_once('./apiutil.php');

$@@INSTANTIATE_CLASS@@

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
  $body = getBody();
  @@POST_BODY@@
  $res = $@@OBJECT_NAME@@->add($body);
  if ($res):
    $response = array(
      "res" => "Post new @@OBJECT_NAME@@", "body" => $body, "status" => $res
    );
    Response::success($response);
  else:
    Response::error("Unable to add @@OBJECT_NAME@@");
  endif;
elseif ($requestMethod == 'PUT'):
  $id = getId();
  if ($id):
    $body = getBody();
    $body += ["@@OBJECT_PARAM@@id" => $id];
    $res = $@@OBJECT_NAME@@->update($body);
    if ($res):
      $response = array("res" => "@@OBJECT_NAME@@ {$id} updated", "body" => $body, "status" => $res);
      Response::success($response);
    else:
      Response::error("Unable to update @@OBJECT_NAME@@ {$id}");
    endif;
  else:
    Response::error("No @@OBJECT_NAME@@ id");
  endif;
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
