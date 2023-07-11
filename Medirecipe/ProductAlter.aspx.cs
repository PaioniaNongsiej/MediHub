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
    public partial class ProductAlter : System.Web.UI.Page
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
                getcategory();
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

        public void getcategory()
        { 
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand de = new SqlCommand("select * from category", con);
            de.CommandType = CommandType.Text;
            category_ID.DataSource = de.ExecuteReader();
            category_ID.DataTextField = "category_name";
            category_ID.DataValueField = "id";
            category_ID.DataBind();
            category_ID.Items.Insert(0, new ListItem("Select category", "0"));
        }
        private void BindTextBoxvalues()
        {
           
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from product where product_id=" + cid, con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ds = new DataSet();
        
            product_id.Text = dt.Rows[0][0].ToString();
            product_name.Text = dt.Rows[0]["product_name"].ToString();
            s_des.Text = dt.Rows[0]["short_des"].ToString();
            long_des.Text = dt.Rows[0]["long_des"].ToString();
            actual_price.Text = dt.Rows[0]["actual_price"].ToString();
            sell_price.Text = dt.Rows[0]["selling_price"].ToString();
            imagePreview.ImageUrl = dt.Rows[0]["first_img"].ToString();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (first_file_upload_btn.HasFile)
            {
                string filename = first_file_upload_btn.PostedFile.FileName;
                string filepath = "~/pictures/product/" + first_file_upload_btn.FileName;
                first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/product/") + filename);
                string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("update product set product_name='" + product_name.Text + "',short_des = '" + s_des.Text + "',long_des = '" + long_des.Text +  "',actual_price = '" + actual_price.Text + "',selling_price = '" + sell_price.Text + "',first_img = '" + filepath + "' where product_id=" + cid, con);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/ProductList.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductList.aspx");
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