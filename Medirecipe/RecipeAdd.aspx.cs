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
    public partial class RecipeAdd : System.Web.UI.Page
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
            //SqlCommand checkproduct = new SqlCommand("select * from product where product_id='" + product_id.Text + "'", con);
            //SqlDataAdapter da = new SqlDataAdapter(checkproduct);
            //DataTable dt = new DataTable();
            //da.Fill(dt);

            //if (dt.Rows.Count > 0)
            //{
            //    Response.Write(" <script> alert(' product Alredy Exists')</script>");

            //    Response.Redirect("admin.aspx");
            //}
            if (first_file_upload_btn.HasFile)
            {
                {
                    string filename = first_file_upload_btn.PostedFile.FileName;
                    string filepath = "~/pictures/recipe/" + first_file_upload_btn.FileName;
                    first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/recipe/") + filename);
                    SqlCommand cmd = new SqlCommand("insert into recipe " + " (recipe_name,servings,ingredient, short_des, long_des, first_img) " +
                     "values('" + recipe_name.Text + "','" + serving.Text + "','" + ingredient.InnerText + "','" + s_des.Text + "','" + l_des.InnerText + "','" + filepath + "')", con);
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
            SqlCommand c = new SqlCommand("select COUNT(*) from shipper", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_order.Text = RowCount.ToString();
        }
    }
}