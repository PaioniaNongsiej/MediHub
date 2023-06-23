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
    public partial class SidePanelDark : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();
            }
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            countproducts();
            countrecipe();
            countcategory();
            countorder();
            pendingorder();
            processingorder();
            shippedorder();
            deliveredorder();
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "select o.id,p.picture,p.fullname, o.order_date, o.order_total, o.payment_method, o.shipping_method, o.status from profile p inner join PrOrder o on p.id=o.id ;";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string shipper = (row.FindControl("newshipper") as DropDownList).Text;
            string status = (row.FindControl("newstatus") as DropDownList).Text;
            string query = "UPDATE PrOrder SET shipping_method=@shipping_method, status=@status WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.Parameters.AddWithValue("@shipping_method", shipper);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM PrOrder WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@DocId", id);
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
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                //(e.Row.Cells[8].Controls[1] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label newstatus = (Label)e.Row.FindControl("lblNewstatus");
                    if (newstatus.Text == "pending")
                    {
                        newstatus.CssClass = "badge rounded badge-soft-danger font-size-12";
                        //class="badge rounded badge-soft-success font-size-12
                    }
                    else if (newstatus.Text == "Processing")
                    {
                        newstatus.CssClass = "badge rounded badge-soft-warning font-size-12";
                    }
                    else if (newstatus.Text == "Shipped")
                    {
                        newstatus.CssClass = "badge rounded badge-soft-info font-size-12";
                    }
                    else if (newstatus.Text == "delivered")
                    {
                        newstatus.CssClass = "badge rounded badge-soft-success font-size-12";
                    }
                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
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
        public void pendingorder()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from PrOrder where status ='pending'", con);
            int? RowCount = (int?)c.ExecuteScalar();
            pending_orders.Text = RowCount.ToString();
        }
        public void processingorder()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from PrOrder where status ='Processing'", con);
            int? RowCount = (int?)c.ExecuteScalar();
            processing_orders.Text = RowCount.ToString();
        }
        public void shippedorder()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from PrOrder where status ='Shipped'", con);
            int? RowCount = (int?)c.ExecuteScalar();
            shipped_orders.Text = RowCount.ToString();
        }
        public void deliveredorder()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from PrOrder where status ='Delivered'", con);
            int? RowCount = (int?)c.ExecuteScalar();
            delivered_orders.Text = RowCount.ToString();
        }
        protected void logout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}