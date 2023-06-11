<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Medirecipe.ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MediRecipe | Product List</title>
       
        
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
        
                                       
                                        <header class="w3-container" style="padding-top:22px">
                                            <h5><b>Category</b></h5>
                                         </header>
                                        
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                           

       <div class="form" >
           
          <asp:TextBox ID="txtSearch" runat="server" class="txtSearch"></asp:TextBox>
          <asp:Button Text="Search" runat="server" OnClick="Search" Width="77px"/>

            <hr />
        

           <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:GridView runat="server" ID="gvImage" AutoGenerateColumns="false" 
                    AllowPaging="True" OnRowCancelingEdit="gvImage_RowCancelingEdit" 
                    DataKeyNames="id" CellPadding="4" OnRowEditing="gvImage_RowEditing" 
                    OnRowUpdating="gvImage_RowUpdating" OnRowDeleting="gvImage_RowDeleting"
                    EmptyDataText="No records has been added.">
        <Columns>
            <asp:TemplateField HeaderText="id" HeaderStyle-Width="200px">
                <ItemTemplate>
                    <asp:Label ID="lblImgId" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" HeaderStyle-Width="200px">
                <ItemTemplate>
                    <asp:Label ID="lblImageName" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Name" runat="server" Text='<%# Eval("product_name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("category_icon") %>' Height="80px" Width="100px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Image ID="img_user" runat="server" ImageUrl='<%# Eval("category_icon") %>' Height="80px" Width="100px" />
                    <br />
                    <asp:FileUpload ID="fileupload1" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:LinkButton ID="LkB1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                    <asp:LinkButton ID="LkB11" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LkB2" runat="server" CommandName="Update">Update</asp:LinkButton>
                    <asp:LinkButton ID="LkB3" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
               
            </ContentTemplate>

        </asp:UpdatePanel>

           
            </div> 
                                                
                                        </table>
                                    </div>
                                   </div
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                         
               </div>
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
