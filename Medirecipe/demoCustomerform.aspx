<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demoCustomerform.aspx.cs" Inherits="Medirecipe.demoCustomerform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
       
                                        <h4 class="card-title">Category</h4>
                                        <p class="card-title-desc">
                                        </p>


                                            <div class="row">
                                                    <div class="mb-3">
                                                        <label>Full Name</label>
                        
                                                           <asp:TextBox ID="fullname" runat="server" placeholder="first name"  class="form-control" ></asp:TextBox>   
                                                       
                                                    </div>
                                            </div>   
                                            <div class="row">
                                                    <div class="mb-3">
                                                        <label>userName</label>
                        
                                                           <asp:TextBox ID="username" runat="server" placeholder="first name"  class="form-control" ></asp:TextBox>   
                                                       
                                                    </div>
                                            </div> 
                                            
                                            <div class="row">
                                                    <div class="mb-3">
                                                        <label>country</label>
                        
                                                           <asp:TextBox ID="country" runat="server" placeholder="last name"  class="form-control" ></asp:TextBox>   
                                                       
                                                    </div>
                                            </div>  

                                            <div class="row">
                                                    <div class="mb-3">
                                                        <label>email</label>
                        
                                                           <asp:TextBox ID="email" runat="server" placeholder="last name"  class="form-control" ></asp:TextBox>   
                                                       
                                                    </div>
                                            </div> 
                                            <div class="row">
                                                    <div class="mb-3">
                                                        <label>phone no</label>
                        
                                                           <asp:TextBox ID="mobile_no" runat="server" placeholder="last name"  class="form-control" ></asp:TextBox>   
                                                       
                                                    </div>
                                            </div> 
                                           

                                     <!-- product image -->
                                    <div class="product_info">
       
                                        <%--<div class="product_image"><p class="text">product image</p></div>--%>
                                        <div class="upload_image_sec">
                                            <!-- upload inputs -->
                                            <p class="text">upload icon</p>
                                           <%-- <div class="upload_catalouge">--%>
                                                <div class="col-sm-3 col-md-3 col-xs-12">  
                                                            <div class="form-group"> 
                                                                <div class="custom-file">  
                                                            <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" ImageUrl="~/images/default-avatar.png" Width="139px" Height="188px" />  
                                                                    <br/>
                                                                    <br/>
                                                                    <label class="custom-file-label">  
                                                                    <asp:FileUpload ID="first_file_upload_btn" runat="server" class="form-control"  onchange="ShowImagePreview(this);" />  
                                                                    </label>  
                                                                </div>  
                                                            </div>  
                                                        </div>  
                                            </div>
                                        </div>
                                        <!-- end product image -->
                                     
                                                                            <div class="mb-0">
                                             
                                                                               <asp:Button ID="add_btn" class="btn btn-primary" runat="server" Text="Add Category" OnClick="btn_Click"/>
                                                                            </div>
                                                                          </form>
                                                               
                                              
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
