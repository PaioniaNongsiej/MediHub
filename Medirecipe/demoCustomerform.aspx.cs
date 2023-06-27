using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Medirecipe
{
    public partial class demoCustomerform : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            
            if (first_file_upload_btn.HasFile)
            {
                {
                    string filename = first_file_upload_btn.PostedFile.FileName;
                    string filepath = "~/pictures/category/" + first_file_upload_btn.FileName;
                    first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/category/") + filename);
                    SqlCommand cmd = new SqlCommand("insert into profile " + " (fullname, username,country,email,mobile_no, picture) " +
                     "values('" + fullname.Text + "','" + username.Text + "','" + country.Text + "','" + email.Text + "','" + mobile_no.Text + "','" + filepath + "')", con);
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
            }
        }
    }
}