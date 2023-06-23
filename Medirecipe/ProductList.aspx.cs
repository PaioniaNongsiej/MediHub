using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Medirecipe
{
    public partial class ProductList : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindData();
            }
            else
            {
                con = new SqlConnection(constr);
                con.Close();


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
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            countproducts();
            countrecipe();
            countcategory();
            countorder();
            Search();
        }

        protected void BindData()
        {
            con = new SqlConnection(constr);
            con.Open();
            da = new SqlDataAdapter("select * from product", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        private void Search()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM product";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE product_name LIKE @name";
                        cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim());
                        //cmd.Parameters.AddWithValue("@location", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void Search(object sender, EventArgs e)
        {
            this.Search();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindData();
        }
        protected void Export(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Product" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }
       
        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvImage_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();

        }
        // update event

        // cancel edit event
        protected void gvImage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }
        //delete event
        protected void gvImage_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblImgId");
            Label lblDeleteImageName = (Label)row.FindControl("lblName");
            Label lblDeleteCaption = (Label)row.FindControl("lblcaption");
            Label lblDeleteDesc = (Label)row.FindControl("lbldes");
            Label lblDeleteAprice = (Label)row.FindControl("lblAprice");
            Label lblDeletediscount = (Label)row.FindControl("lbldiscount");
            Label lblDeleteSprice = (Label)row.FindControl("lblSprice");
            Label lblDeleteStock = (Label)row.FindControl("lblstock");
            con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM category where product_id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindData();
        }
        /// <summary>
        /// This function is used to delete image from folder when deleting in gridview.
        /// </summary>
        /// <param name="imagename">image name</param>

        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
            //GridView1.DataBind();
        }

        protected void Redirect(object sender, EventArgs e)
        {
            Server.Transfer(".aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/ProductAlter.aspx?cid=" + row.Cells[0].Text);
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