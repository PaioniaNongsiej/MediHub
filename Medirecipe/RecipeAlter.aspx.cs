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
    public partial class RecipeAlter : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        int cid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            cid = Convert.ToInt32(Request.QueryString["cid"].ToString());
            if (!IsPostBack)
            {
                BindTextBoxvalues();
            }
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            countproducts();
            countrecipe();
            countcategory();
            countorder();
        }

        private void BindTextBoxvalues()
        {

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from recipe where recipe_id=" + cid, con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ds = new DataSet();

            recipe_id.Text = dt.Rows[0][0].ToString();
            recipe_name.Text = dt.Rows[0]["recipe_name"].ToString();
            s_des.Text = dt.Rows[0]["short_des"].ToString();
            long_des.Text = dt.Rows[0]["long_des"].ToString();
            serving.Text = dt.Rows[0]["servings"].ToString();
            ingredient.Text = dt.Rows[0]["ingredient"].ToString();
            imagePreview.ImageUrl = dt.Rows[0]["first_img"].ToString();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (first_file_upload_btn.HasFile)
            {
                string filename = first_file_upload_btn.PostedFile.FileName;
                string filepath = "~/pictures/recipe/" + first_file_upload_btn.FileName;
                first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/recipe/") + filename);
                string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("update recipe set recipe_name='" + recipe_name.Text + "',short_des = '" + s_des.Text + "',long_des = '" + long_des.Text + "',servings = '" + serving.Text + "',ingredient = '" + ingredient.Text + "',first_img = '" + filepath + "' where recipe_id=" + cid, con);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/RecipeList.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RecipeList.aspx");
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
            SqlCommand c = new SqlCommand("select COUNT(*) from PrOrder", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_order.Text = RowCount.ToString();
        }
        protected void logout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}