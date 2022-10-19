<?php
include("../admin/includes/header.php");

$type = -1;

if (isset($_GET['type'])){
    $type = $_GET['type'];
}

$orders = getAllOrder($type);

?>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                            <h6 class="text-white text-capitalize ps-3">Order table</h6>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive p-0">
                            <a href='./order.php' style="margin-left: 20px"><span class="badge badge-sm bg-gradient-secondary">All</span></a>
                            <a href='./order.php?type=2' style="margin-left: 20px"><span class="badge badge-sm bg-gradient-primary">Booked</span></a>
                            <a href='./order.php?type=3' style="margin-left: 20px"><span class='badge badge-sm bg-gradient-info'>Delivered</span></a>
                            <a href='./order.php?type=4' style="margin-left: 20px"><span class="badge badge-sm bg-gradient-success">Success</span></a>
                            
                            <table class="table align-items-center mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">ID</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">User</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Product</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Address</th>
                                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Time order</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">&nbsp &nbsp #1</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">Nguyễn Trần Tiến</h6>
                                                    <p class="text-xs text-secondary mb-0">trantien@gmail.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">
                                                <a href="#">View now</a>
                                            </p>
                                            <p class="text-xs text-secondary mb-0">Quantity: 12</p>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Địa chỉ ở đâu đó</p>
                                            <p class="text-xs text-secondary mb-0">0976642312</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-success">Success</span>
                                            <!-- <span class="badge badge-sm bg-gradient-primary">Booked</span>
                                            <span class="badge badge-sm bg-gradient-info">Delivering</span> -->
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">
                                                08-01-2022
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">&nbsp &nbsp #1</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">Nguyễn Trần Tiến</h6>
                                                    <p class="text-xs text-secondary mb-0">trantien@gmail.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">
                                                <a href="#">View now</a>
                                            </p>
                                            <p class="text-xs text-secondary mb-0">Quantity: 12</p>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Địa chỉ ở đâu đó</p>
                                            <p class="text-xs text-secondary mb-0">0976642312</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-success">Success</span>
                                            <!-- <span class="badge badge-sm bg-gradient-primary">Booked</span>
                                            <span class="badge badge-sm bg-gradient-info">Delivering</span> -->
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">
                                                08-01-2022
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">&nbsp &nbsp #1</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">Nguyễn Trần Tiến</h6>
                                                    <p class="text-xs text-secondary mb-0">trantien@gmail.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">
                                                <a href="#">View now</a>
                                            </p>
                                            <p class="text-xs text-secondary mb-0">Quantity: 12</p>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Địa chỉ ở đâu đó</p>
                                            <p class="text-xs text-secondary mb-0">0976642312</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-success">Success</span>
                                            <!-- <span class="badge badge-sm bg-gradient-primary">Booked</span>
                                            <span class="badge badge-sm bg-gradient-info">Delivering</span> -->
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">
                                                08-01-2022
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<?php include("../admin/includes/footer.php"); ?>