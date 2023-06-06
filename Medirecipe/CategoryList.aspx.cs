using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Medirecipe
{
    public partial class UserList : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!this.IsPostBack)
            {
                //this.Search();
                this.BindGrid();
            }
            if (this.Page.PreviousPage != null)
            {
                GridView GridView1 = (GridView)this.Page.PreviousPage.FindControl("GridView1");
            }
            if (this.Page.PreviousPage != null)
            {
                Control ContentPlaceHolder1 = this.Page.PreviousPage.Master.FindControl("ContentPlaceHolder1");
                GridView GridView1 = (GridView)ContentPlaceHolder1.FindControl("GridView1");
            }
            countproducts();
            countrecipe();
            countcategory();
            countorder();
            Search();
        }
        private void Search()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM category";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE category_name LIKE @name";
                        cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim());
                        //cmd.Parameters.AddWithValue("@location", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                    }
                }
            }
        }
        protected void Search(object sender, EventArgs e)
        {
            this.Search();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT *  FROM category";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                    }
                }
            }
        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            //gvCustomers.EditIndex = e.NewEditIndex;
            //this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gvCustomers.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                int id = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Values[0]);
                string query = "DELETE FROM category WHERE id=@CID";
                string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@CID", id);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
           
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gvCustomers.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";

            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gvCustomers.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Redirect(object sender, EventArgs e)
        {
            Server.Transfer("CategoryAdd.aspx");
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