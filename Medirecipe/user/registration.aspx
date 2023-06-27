<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Medirecipe.user.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custome.css" rel="stylesheet" />
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
     <form id="form1" runat="server">
     
    <div>
        <div class ="navbar navbar-default navbar-fixed-top " role ="navigation"  >
            <div class ="container ">
                <div class ="navbar-header">
                    <button type="button" class ="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                        <span class ="sr-only">Toggle navigation</span>
                        <span class ="icon-bar"></span>
                        <span class ="icon-bar"></span>
                        <span class ="icon-bar"></span>

                    </button>
                    <a class ="navbar-brand" href ="Default.aspx" ><span ><img src="/image/logo-transparent-png.png" height ="30" /></span> </a>

                </div>
                
            </div>
        </div>
     </div>
         
        <br />
        <br />
        <br />

        <!----singin form start--->

        <div class ="container ">
            <div class ="form-horizontal ">
                <h2>Registration Form</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="Full Name"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtFullname" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Full Name" ControlToValidate="txtFullname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class ="form-group">
                    <asp:Label ID="Label4" CssClass ="col-md-2 control-label " runat="server" Text="Email"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Email ID" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class ="form-group">
                    <asp:Label ID="Label2" CssClass ="col-md-2 control-label " runat="server" Text="Password"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="*the password field is required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" CssClass =" control-label " runat="server" Text="Remember me"></asp:Label>
                    </div>
                </div>


                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnLogin" CssClass ="btn btn-success " runat="server" Text="Register" OnClick="btnLogin_Click" />
                        
                    </div>
                </div>
                
             
                 <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
                    </div>
                </div>


            </div>


        </div>
        <!----singin form End--->

          <!---Footer COntents Start here---->
        <hr />
        <footer>
            <div class ="alert alert-danger ">
           
                <p class ="pull-right "><a href="AdminHome.aspx">  Login  </a></p> 
                
            </div>

        </footer>

         <!---Footer COntents End---->
    </form>

</body>
</html>
