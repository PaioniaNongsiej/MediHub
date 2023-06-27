using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;


namespace Medirecipe.user
{
    public partial class registration : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = 192.168.10.18;database = TrainingDB;user id = TrainingDB_User;password= 'X1;xbhpUN#a5eGHt4ohF'");
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO profile " + "(fullname,email,password) " + "VALUES ( @fullname,@email, @password)", con);
            cmd.Parameters.AddWithValue("@fullname", txtFullname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtPass.Text);
            
            cmd.ExecuteNonQuery();
            con.Close();
            string message = "Your details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        }

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
            
        //}

        private void clr()
        {
            txtPass.Text = string.Empty;
            txtFullname.Text = string.Empty;
            txtFullname.Focus();
            txtemail.Text = string.Empty;
            txtemail.Focus();
        }

    }
}