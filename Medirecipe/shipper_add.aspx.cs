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

namespace Medirecipe
{
    public partial class shipper_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            //if (first_file_upload_btn.HasFile)
            //{
                {
                    //string filename = first_file_upload_btn.PostedFile.FileName;
                    //string filepath = "~/pictures/category/" + first_file_upload_btn.FileName;
                    //first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/category/") + filename);
                    SqlCommand cmd = new SqlCommand("insert into shipper " + " (shipper_name, price) " +
                     "values('" + shipper_name.Text + "','" + shipping_price.Text + "')", con);
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