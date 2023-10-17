<?php
include_once $_SERVER['DOCUMENT_ROOT'] . '/@@ROOT_DIR@@/classes/@@CLASS_NAME@@.classes.php';
$api@@CLASS_NAME@@ = new Api@@CLASS_NAME@@();
$resp = $apiClient->get("http://localhost:8080/lap-portal/api/orders.php");
$@@OBJECT_LIST@@   = $resp->response->data;
//print_r ( $orders );
?>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-6">
      <h1>Order management</h1>
    </div>

    <!-- Users data -->
    <table class="table table-sm">
      <thead>
        <tr>
          @@TABLE_HEADER@@
          <th scope="col">Order Id</th>
          <th scope="col">Client name</th>
          <th scope="col">Order date</th>
          <th scope="col">Status</th>
          <th scope="col">Total items</th>
          <th scope="col">Total amount</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <?php
          if (sizeof($orders) == 0) {
            echo "<tr><td colspan='@@COLUMN_COUNT@@' class='text-center'>No @@CLASS_NAME@@ found</td></tr>";
          } else {
            foreach ($@@OBJECT_LIST@@ as $@@OBJECT@@) {
          ?>
          @@TABLE_BODY@@
        <tr>
          <td scope="row"><?= $order->orderid ?></td>
          <td><?= $order->clientname ?></td>
          <td><?= $order->orderdate ?></td>
          <td><?= $order->status ?></td>
          <td style="text-align:right"><?= $order->totalitems ?></td>
          <td style="text-align:right"><?= $order->totalamount ?></td>
        </tr>
    <?php }
          }
    ?>
      </tbody>
    </table>

  </div>
</div>




