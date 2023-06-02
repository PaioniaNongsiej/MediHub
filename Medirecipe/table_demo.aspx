<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="table_demo.aspx.cs" Inherits="Medirecipe.table_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvEmployee" runat="server"          
            AutoGenerateColumns="False"  
            DataKeyNames="Id"  
            onrowcancelingedit="gvEmployee_RowCancelingEdit"  
            onrowediting="gvEmployee_RowEditing"              
            OnRowDeleting="gvEmployee_RowDeleting"  
            onrowupdating="gvEmployee_RowUpdating"  
            GridLines="None"  
            AllowPaging="true"  
            CssClass="mGrid"  
            PagerStyle-CssClass="pgr"  
            AlternatingRowStyle-CssClass="alt"  
            Width="40%" OnSelectedIndexChanged="gvEmployee_SelectedIndexChanged">  
            <Columns>  
                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <%#Container.DataItemIndex+1%>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Employee Name">  
                    <ItemTemplate>     
                        <%#Eval("emp_name")%>     
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtempname" runat="server" Text='<%#Eval("emp_name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
             <asp:TemplateField HeaderText="Employee Code">  
                <ItemTemplate>  
                    <%#Eval("Emp_Code")%>  
                </ItemTemplate>  
                <EditItemTemplate>  
                    <asp:TextBox ID="txtempcode" runat="server" Text='<%#Eval("Emp_Code") %>'></asp:TextBox>  
                </EditItemTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Employee Age">  
                <ItemTemplate>  
                    <%#Eval("Emp_Age")%>  
                </ItemTemplate>  
                <EditItemTemplate>  
                    <asp:TextBox ID="txtempage" runat="server" Text='<%#Eval("Emp_Age") %>'></asp:TextBox>  
                </EditItemTemplate>  
            </asp:TemplateField>  
            <asp:CommandField ShowEditButton="true" ButtonType ="Image" EditImageUrl="#" UpdateImageUrl="Image/accept.png"  
            CancelImageUrl="Image/cancel.png" HeaderText="Edit" />  
            <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="#" HeaderText="Delete" />   
    </Columns>  
</asp:GridView>
        </div>
    </form>
</body>
</html>
