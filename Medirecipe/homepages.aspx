<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepages.aspx.cs" Inherits="Paionia.homepages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>MediRecipe | Dashboard</title>
       
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico /">

        <!-- plugin css -->
        <link href="assets/libs/jsvectormap/css/jsvectormap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

        <!-- Layout Js -->
        <script src="assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css"  rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
      
      <link href="assets/css/app.min.css"  rel="stylesheet" type="text/css" />
</head>
    <body data-sidebar="colored">
    <form id="form1" runat="server">
 <!--#include file="sidepanel.html"-->
                    <!-- Sidebar -->
     
             <div class="main-content">
                <div class="page-content">
                    <div class="container-fluid">
                        
                        

                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-md flex-shrink-0">
                                                <span class="avatar-title bg-subtle-primary text-primary rounded fs-2">
                                                <i class="fa-solid fa-carrot"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-4">
                                                <p class="text-muted text-truncate font-size-15 mb-2"> Total Recipe</p>
                                                <h3 class="fs-4 flex-grow-1 mb-3"><asp:Label ID="total_recipe" runat="server"></asp:Label></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-md flex-shrink-0">
                                                <span class="avatar-title bg-subtle-primary text-primary rounded fs-2">
                                                    <i class="fa-solid fa-clipboard"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-4">
                                                <p class="text-muted text-truncate font-size-15 mb-2"> Total Category</p>
                                                <h3 class="fs-4 flex-grow-1 mb-3"><asp:Label ID="total_category" runat="server"></asp:Label></h3>
                                            </div>
                     
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-md flex-shrink-0">
                                                <span class="avatar-title bg-subtle-primary text-primary rounded fs-2">
                                                    <i class="fa-brands fa-product-hunt"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-4">
                                                <p class="text-muted text-truncate font-size-15 mb-2"> Total Products</p>
                                                <h3 class="fs-4 flex-grow-1 mb-3"><asp:Label ID="total_product" runat="server"></asp:Label></h3>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-md flex-shrink-0">
                                                <span class="avatar-title bg-subtle-primary text-primary rounded fs-2">
                                                    <i class="fa-brands fa-jedi-order"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-4">
                                                <p class="text-muted text-truncate font-size-15 mb-2"> Total Orders</p>
                                                <h3 class="fs-4 flex-grow-1 mb-3"><asp:Label ID="total_order" runat="server"></asp:Label></h3>
                                            </div>
                                         
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END ROW -->

                        

                        <div class="row">
                          
                                    <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header border-0 align-items-center d-flex pb-0">
                                        <h4 class="card-title mb-0 flex-grow-1">Sales Statistics</h4>
                                                
                                            </div>
                                            <div class="card-body">
                                              
                                                <div class="table-responsive mt-3">
                                                    <table class="table align-middle table-centered table-nowrap mb-0">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Order Status</th>
                                                                <th scope="col">Orders</th>
                                                                <th scope="col">Returns</th>
                                                                <th scope="col">Earnings</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="text-dark">Product Pending</a>
                                                                </td>
                                                                <td>17,351</td>
                                                                <td>2,123</td>
                                                                <td><span class="badge bg-subtle-primary text-primary font-size-11 ms-1"><i class="mdi mdi-arrow-up"></i> 45.3%</span></td>
                                                            </tr><!-- end -->
        
                                                            <tr>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="text-dark">Product Cancelled</a>
                                                                </td>
                                                                <td>67,356</td>
                                                                <td>3,652</td>
                                                                <td><span class="badge bg-subtle-danger text-danger font-size-11 ms-1"><i class="mdi mdi-arrow-down"></i> 14.6%</span></td>
                                                            </tr><!-- end -->
        
        
                                                            <tr>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="text-dark">Product Delivered</a>
                                                                </td>
                                                                <td>67,356</td>
                                                                <td>3,652</td>
                                                                <td><span class="badge bg-subtle-primary text-primary font-size-11 ms-1"><i class="mdi mdi-arrow-up"></i> 14.6%</span></td>
                                                            </tr><!-- end -->
                                                        </tbody><!-- end tbody -->
                                                    </table><!-- end table -->
                                                </div>

                                                <div class="text-center mt-4"><a href="javascript: void(0);" class="btn btn-primary waves-effect waves-light btn-sm">View More <i class="mdi mdi-arrow-right ms-1"></i></a></div>

                                            </div>
                                        </div>
                                    </div>

                        <!-- END ROW -->

                        <div class="row">
                           <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-header border-0 align-items-center d-flex pb-0">
                                        <h4 class="card-title mb-0 flex-grow-1">Latest Transaction</h4>
                                       
                                    </div>
                                    <div class="card-body pt-2">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-nowrap mb-0">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 20px;">
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck1">
                                                                <label class="form-check-label" for="customCheck1">&nbsp;</label>
                                                            </div>
                                                        </th>
                                                        <th>Order ID</th>
                                                        <th>Billing Name</th>
                                                        <th>IP Address</th>
                                                        <th>Order Date</th>
                                                        <th>Total</th>
                                                        <th>Payment Method</th>
                                                        <th>Payment Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2540</a> </td>
                                                        <td><img src="assets/images/users/avatar-2.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Neal Matthews</td>
                                                        <td><p class="mb-0">cs562xf452dd</p></td>
                                                        <td>
                                                            07 Oct, 2022 
                                                        </td>
                                                        <td>
                                                            $400
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-cc-mastercard me-1"></i> Mastercard
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-success font-size-12">Completed</span>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                        
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck3">
                                                                <label class="form-check-label" for="customCheck3">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2541</a> </td>
                                                        <td><img src="assets/images/users/avatar-3.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Jamal Burnett</td>
                                                        <td><p class="mb-0">ar252xf658dd</p></td>
                                                        <td>
                                                            07 Oct, 2022
                                                        </td>
                                                        <td>
                                                            $380
                                                        </td>
                                                        
                                                        <td>
                                                            <i class="fab fa-cc-visa me-1"></i> Visa
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-danger font-size-12">Cancel</span>
                                                        </td>
                                                        <td>
                                                           <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                        
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck4">
                                                                <label class="form-check-label" for="customCheck4">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2542</a> </td>
                                                        <td><img src="assets/images/users/avatar-4.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Juan Mitchell</td>
                                                        <td><p class="mb-0">op632xf223dd</p></td>
                                                        <td>
                                                            06 Oct, 2022
                                                        </td>
                                                        <td>
                                                            $384
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-cc-paypal me-1"></i> Paypal
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-success font-size-12">Completed</span>
                                                        </td>
                                                        <td>
                                                           <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck5">
                                                                <label class="form-check-label" for="customCheck5">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2543</a> </td>
                                                        <td><img src="assets/images/users/avatar-5.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Barry Dick</td>
                                                        <td><p class="mb-0">ty756xf985dd</p></td>
                                                        <td>
                                                            05 Oct, 2022
                                                        </td>
                                                        <td>
                                                            $412
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-cc-mastercard me-1"></i> Mastercard
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-success font-size-12">Completed</span>
                                                        </td>
                                                        <td>
                                                           <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck6">
                                                                <label class="form-check-label" for="customCheck6">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2544</a> </td>
                                                        <td><img src="assets/images/users/avatar-6.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Ronald Taylor</td>
                                                        <td><p class="mb-0">jf754xf431dd</p></td>
                                                        <td>
                                                            04 Oct, 2022
                                                        </td>
                                                        <td>
                                                            $404
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-cc-visa me-1"></i> Visa
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-warning font-size-12">Shipping</span>
                                                        </td>
                                                        <td>
                                                           <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="customCheck7">
                                                                <label class="form-check-label" for="customCheck7">&nbsp;</label>
                                                            </div>
                                                        </td>
                                                        <td><a href="javascript: void(0);" class="text-body">#MB2545</a> </td>
                                                        <td><img src="assets/images/users/avatar-7.jpg" class="avatar-xs rounded-circle me-2" alt="..."> Jacob Hunter</td>
                                                        <td><p class="mb-0">fd964xf467dd</p></td>
                                                        <td>
                                                            04 Oct, 2022
                                                        </td>
                                                        <td>
                                                            $392
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-cc-paypal me-1"></i> Paypal
                                                        </td>
                                                        <td>
                                                            <span class="badge rounded badge-soft-success font-size-12">Completed</span>
                                                        </td>
                                                        <td>
                                                           <div class="d-flex gap-3">
                                                                <a href="javascript:void(0);" class="btn btn-success btn-sm"><i class="mdi mdi-pencil"></i></a>
                                                                <a href="javascript:void(0);" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- end table-responsive -->
                                    </div>
                                </div>
                           </div>
                        </div>
                         <!-- END ROW -->

                    </div>
                    <!-- container-fluid -->
                </div>
                <!-- End Page-content -->
               
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © MediRecipe
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end d-none d-sm-block">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                
            </div>
              </div>

    </form>

                <div class="rightbar-overlay"></div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <!-- Icon -->
        <script src="unicons.iconscout.com/release/v2.0.1/script/monochrome/bundle.js"></script>

        <!-- apexcharts -->
        <script src="assets/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Vector map-->
        <script src="assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
        <script src="assets/libs/jsvectormap/maps/world-merc.js"></script>

        <script src="assets/js/pages/dashboard.init.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>



</body>
</html>
