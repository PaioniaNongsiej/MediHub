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
    public partial class ShipperAdd : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
            countproducts();
            countrecipe();
            countcategory();
            countorder();
        }
        protected void btn_Click(object sender, EventArgs e)
        {
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
        public void countproducts()
        {

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from product", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_product.Text = RowCount.ToString();
        }

        public void countrecipe()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from recipe", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_recipe.Text = RowCount.ToString();
        }

        public void countcategory()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from category", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_category.Text = RowCount.ToString();
        }

        public void countorder()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from orders", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_order.Text = RowCount.ToString();
        }
    }
}