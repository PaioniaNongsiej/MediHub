using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


namespace Medirecipe
{
    public partial class Login : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("homepages.aspx");

            }
            else
            {

                con.ConnectionString = "Data Source = 192.168.10.18;database = TrainingDB;user id = TrainingDB_User;password= 'X1;xbhpUN#a5eGHt4ohF'";

            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                string uid = username.Text;
                string pass = password.Text;
                con.Open();
                string qry = "select * from AdminRegLogin where email ='" + uid + "' and password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {

                    if (uid == username.Text && pass == password.Text)
                    {
                        Session["user"] = uid;
                        Response.Redirect("homepages.aspx");
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                  "Swal.fire('Unable to login')", true);

                }
                con.Close();
            }
            catch (Exception ex)
            {

            }
        }
    }
}