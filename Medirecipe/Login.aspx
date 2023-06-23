<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Medirecipe.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
        <title>MediHub Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesdesign" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico"/>

        <!-- Layout Js -->
        <script src="assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css"  rel="stylesheet" type="text/css" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="auth-maintenance d-flex align-items-center min-vh-100">
            <div class="bg-overlay bg-light"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="auth-full-page-content d-flex min-vh-100 py-sm-5 py-4">
                            <div class="w-100">
                                <div class="d-flex flex-column h-100 py-0 py-xl-3">
                                    <div class="text-center mb-4">
                                        <a href="index.html" class="">
                                            <img src="image/logo-transparent-png.png" alt="" height="70" class="auth-logo logo-dark mx-auto"/>
                                            <img src="image/logo-transparent-png.png" alt="" height="70" class="auth-logo logo-light mx-auto"/>
                                        </a>
                                       
                                    </div>
    
                                    <div class="card my-auto overflow-hidden">
                                            <div class="row g-0">
                                                <div class="col-lg-6">
                                                    <div class="bg-overlay bg-primary"></div>
                                                    <div class="h-100 bg-auth align-items-end">
                                                    </div>
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="p-lg-5 p-4">
                                                        <div>
                                                            <div class="text-center mt-1">
                                                                <h4 class="font-size-18">Welcome Back Admin !</h4>
                                                                <p class="text-muted">Sign in to continue to MediHub.</p>
                                                            </div>
            
                                                            <form runat="server" class="auth-input">
                                                                <div class="mb-2">
                                                                    <label  class="form-label">Username</label>
                                                                    <asp:TextBox ID="username" class="form-control"  placeholder="Enter username" runat="server" ></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="email" runat="server" ErrorMessage="This is required" ControlToValidate="username" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label class="form-label" >Password</label>
                                                                      <asp:TextBox ID="password" class="form-control"  placeholder="Enter Password" TextMode="Password" runat="server" ></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="pass" runat="server" ErrorMessage="Please enter password" ControlToValidate="password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                </div>
                                                                
         
                                                               
                                                                <div class="mt-3">
<%--button class="btn btn-primary w-100" type="submit">Sign In</button>--%>
                                                                   <%-- <label>Sign In </label>--%>
                                                                       <div class ="form-group">
                                                               
                                                                <div class ="mt-2 ">

                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                    <asp:Label ID="Label3" CssClass =" control-label " runat="server" Text="Remember me"></asp:Label>
                                                                </div>
                                                            </div>
                                                          
                                                                    <asp:Button ID="SubmitButton" class="btn btn-primary w-100" runat="server" Text="Sign In" OnClick="SubmitButton_Click" />
                                                                </div>
                                                              
                                                                         <div class ="form-group">
                                                                    <div class ="col-md-2 "> </div>
                                                                    <div class ="col-md-6 ">
                                                                        <%--<asp:HyperLink ID="HyForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>--%>
                       
                                                                    </div>
                                                                             </div>
                                                                    </div>
                                                                               <div class="mt-4 pt-2 text-center">
                                                                    <div class="signin-other-title">
                                                                
                                                                   <%-- <div class="pt-2 hstack gap-2 justify-content-center">
                                                                        <asp:button  class="btn btn-primary btn-sm"><i class="ri-facebook-fill font-size-16"></i></asp:button>
                                                                        <asp:button  class="btn btn-danger btn-sm"><i class="ri-google-fill font-size-16"></i></asp:button>
                                                                        <asp:button class="btn btn-dark btn-sm"><i class="ri-github-fill font-size-16"></i></asp:button>
                                                                        <button type="button" class="btn btn-info btn-sm"><i class="ri-twitter-fill font-size-16"></i></button>
                                                                    </div>--%>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    
                                                       
                                                    </div>
                                                </div>  
                                        </div>
                                    </div>
                                    <!-- end card -->
                                    
                                    <div class="mt-5 text-center">
                                        <p class="mb-0">© <script>document.write(new Date().getFullYear())</script> MediHub. <i class="mdi mdi-heart text-danger"></i> MediRecipe | MediShop</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
        </div>
  </form>
        
        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>

        <!-- Icon -->
        <script src="../../../unicons.iconscout.com/release/v2.0.1/script/monochrome/bundle.js"></script>

        <script src="assets/js/app.js"></script>
    
</body>
</html>
