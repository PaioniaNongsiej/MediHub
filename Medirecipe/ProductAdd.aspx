<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductAdd.aspx.cs" Inherits="Medirecipe.ProductAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>MediRecipe | Add Product</title>
       
        
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
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  

</head>
    <body data-sidebar="colored">
    <form id="form1" runat="server">
 <!--#include file="sidepanel.html"-->
                    <!-- Sidebar -->
     <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <div class="navbar-brand-box">

                    <a href="homepages.aspx" class="logo logo-light">
                        <span class="logo-sm">
                            <img src="image/logo-transparent-png.png" alt="logo-sm-light" height="60">
                        </span>
                        <span class="logo-lg">
                            <img src="image/logo-transparent-png.png" alt="logo-light" height="40">
                        </span>
                    </a>

                </div>


                <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect vertical-menu-btn" id="vertical-menu-btn">
                    <i class="ri-menu-2-line align-middle"></i>
                </button>
                <div class="page-title-box align-self-center d-none d-md-block">
                    <h4 class="page-title mb-0">Dashboard</h4>
                </div>
                <!--end page title-->
            </div>



            <div class="d-flex">
                <div class="dropdown d-none d-lg-inline-block ms-1">
                    <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                        <i class="ri-fullscreen-line"></i>
                    </button>
                </div>
                <div class="dropdown d-inline-block">
                    <button type="button" class="btn w-100 px-0 border-0" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <img src="assets/images/users/avatar-2.jpg" class="img-fluid header-profile-user rounded-circle" alt="">
                            </div>

                            <div class="flex-grow-1 ms-2 text-start">
                                <span class="ms-1 fw-medium user-name-text">MediHub Admin</span>
                            </div>

                            <div class="flex-shrink-0 text-end">
                                <!--<i class="mdi mdi-dots-vertical font-size-16"></i>-->
                            </div>
                        </span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                       <asp:Button ID="Button1" class="btn btn-primary" runat="server" text="logout" OnClick="logout_Click1"/><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i>
                       <%-- <a class="dropdown-item" href="Login.aspx"><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Log Out</span></a>--%>
                    </div>

                </div>
            </div>
        </div>
    </header>
        
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

                         <!-- FORM -->
                         <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Add Product</h4>
                                        <p class="card-title-desc">
                                        </p>


                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label>Product Name</label>
                        
                                                          <asp:TextBox ID="product_name"  class="form-control"  runat="server" placeholder="Product name..."></asp:TextBox>   
                                                        <asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="product_name" ErrorMessage="Please enter a product name"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label>Caption</label>
                                                        <asp:TextBox ID="s_des" runat="server" class="form-control"  placeholder="short line about the product"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="s_des" ErrorMessage="Please enter a caption"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                                    </div>
                                                </div>
                                            </div>

                                             <div class="mb-3">
                                              <label>Product Description</label>
                                          <asp:TextBox id="long_des" runat="server" class="form-control"  placeholder="detail description" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="long_des" ErrorMessage="Please enter a product description"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                             </div>
                 
     <!-- product image -->
    <div class="product_info">
       
        <%--<div class="product_image"><p class="text">product image</p></div>--%>
        <div class="upload_image_sec">
            <!-- upload inputs -->
            <p class="text">upload image</p>
           <%-- <div class="upload_catalouge">--%>
                <div class="col-sm-3 col-md-3 col-xs-12">  
                            <div class="form-group"> 
                                <div class="custom-file">  
                            <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" ImageUrl="~/images/default-avatar.png" Width="139px" Height="188px" />  
                                    <br/>
                                    <br/>
                                    <label class="custom-file-label">  
                                    <asp:FileUpload ID="first_file_upload_btn" runat="server" class="form-control"  onchange="ShowImagePreview(this);" />  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="first_file_upload_btn" ErrorMessage="Please enter a product image"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                    </label>  
                                </div>  
                            </div>  
                        </div>  
            </div>
        </div>
        <!-- end product image -->
                                     <div class="row">
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label>Actual Price</label>
                        
                                                         <asp:TextBox ID="actual_price" class="form-control"  runat="server" type="number" placeholder="actual price"></asp:TextBox>   
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="actual_price" ErrorMessage="Please enter the actual price"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                                    </div>
                                                </div>
                                                

                                             <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label>Selling Price</label>
                                                        <asp:TextBox ID="sell_price" class="form-control" runat="server" type="number" placeholder="selling price"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sell_price" ErrorMessage="Please enter the selling price"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>  
                                                        </div>
                                                </div>
                                       </div>
                                       

                                        <div class="col-md-4">
                                        <div class="mb-3">
                                             
                                                   <asp:DropDownList ID="category_ID" class="form-select" runat="server">
                                               
                                                   </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="category_ID" ErrorMessage="Please select a category"   
                                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            </div>

                                            <div class="mb-0">
                                             
                                                <asp:Button ID="add_btn" class="btn btn-primary" runat="server" Text="Add Product" OnClick="btn_Click"/>
                                            </div>
                                          </form>
                                    </div>
                                </div>
                                <!-- end card -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->
               </div>
        </div>
               <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © MediHub <i class="mdi mdi-heart text-danger"></i> MediRecipe | MediShop
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end d-none d-sm-block">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
    </div>

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

        <script>
            //Image Upload Preview
            function ShowImagePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').prop('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

        </script>




</body>
</html>
