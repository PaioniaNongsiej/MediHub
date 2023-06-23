<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipperList.aspx.cs" EnableEventValidation="false" Inherits="Medirecipe.ShipperList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>MediRecipe | Shipper List</title>
       
        
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
      
    <link href="css/CSS.css" rel="stylesheet" type="text/css" /> 
      <link href="assets/css/app.min.css"  rel="stylesheet" type="text/css" />
      
    <style type="text/css">
        .auto-style1 {
            height: 52px;
        }
    </style>
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
                       <asp:Button ID="add_btn" class="btn btn-primary" runat="server" text="logout" OnClick="logout_Click1"/><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i>
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

                         
                         <!-- GridView -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
        
                                        <h4 class="card-title">Shippers List</h4>
                                         <asp:TextBox ID="txtSearch" runat="server" class="txtSearch"></asp:TextBox>
                                        <asp:Button Text="Search" runat="server" CssClass="btn btn-primary btn-sm" OnClick="Search" Width="77px"/>
                                        <asp:Button Text="Export" runat="server" CssClass="btn btn-primary btn-sm" OnClick="Export" Width="77px"/>
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>
			                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                                    <ContentTemplate>

                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                                                            DataKeyNames="shipper_id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                                            PageSize="4" AllowPaging="true"   OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" 
                                                        OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-bordered table-hover display nowrap margin-top-7 w-p80 table-responsive">
                                                            <Columns>
                                                                 <asp:TemplateField HeaderText="ID"   ItemStyle-Width="150" >
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="id" runat="server"   Text='<%# Eval("shipper_id") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                     
							                                         <HeaderStyle CssClass="bg-primary" />
                                                                </asp:TemplateField>

						                                        <asp:ImageField DataImageUrlField="image" HeaderText="Image" ControlStyle-CssClass="img-fluid header-profile-user rounded-circle"></asp:ImageField>    
                                                                <asp:TemplateField HeaderText="Name"   ItemStyle-Width="150" >
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblName" runat="server"   Text='<%# Eval("shipper_name") %>'></asp:Label>
                                                                    </ItemTemplate>
							                                         <HeaderStyle CssClass="bg-primary" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Price" ItemStyle-Width="150">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="price" runat="server"  Text='<%# Eval("price") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                   <EditItemTemplate>
                                                                    <asp:TextBox ID="price" width="70px"  runat="server" Text='<%#Eval("price") %>'/>
                                                                     </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="price" width="110px"  runat="server"/>
                                                                        <asp:RequiredFieldValidator ID="vaddress" runat="server" ControlToValidate="price" Text="?" ValidationGroup="validaiton"/>
                                                                    </FooterTemplate>
							                                         <HeaderStyle CssClass="bg-primary" />
                                                                </asp:TemplateField>

                                                                
                                                                <%--<asp:CommandField  HeaderText="Actions"  ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" 
                                                                    ItemStyle-Width="150"  EditText="edit" DeleteText="delete" 
                                                                    CancelText="cancel" UpdateText="update"/>
									--%>
                                                            </Columns>
					                                         <HeaderStyle CssClass="bg-danger" />
                                                        </asp:GridView>
               
                                                    </ContentTemplate>

                                                </asp:UpdatePanel>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->

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
    </form>
        
    <div class="rightbar-overlay"></div>
        <!-- Required datatable js -->
        <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
        <script src="assets/libs/jszip/jszip.min.js"></script>
        <script src="assets/libs/pdfmake/build/pdfmake.min.js"></script>
        <script src="assets/libs/pdfmake/build/vfs_fonts.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

        <script src="assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
        
        <!-- Responsive examples -->
        <script src="assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

        <!-- Datatable init js -->
        <script src="assets/js/pages/datatables.init.js"></script>

        <script src="assets/js/app.js"></script>
         
</body>
</html>
