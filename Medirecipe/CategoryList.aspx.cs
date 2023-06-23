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
    public partial class UserList : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from category", con);
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
            string FileName = "Category" + DateTime.Now + ".xls";
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
        protected void gvImage_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //find image id of edit row
            string imageId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // find values for update
            //TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_Name");
            FileUpload FileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            con = new SqlConnection(constr);
            string path = "~/pictures/category";
            //
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                //save image in folder
                FileUpload1.SaveAs(MapPath(path));
            }
            else
            {
                // use previous user image if new image is not changed
                Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("img_user");
                path = img.ImageUrl;
            }
            SqlCommand cmd = new SqlCommand("update Category set category_icon='" + path + "'  where id=" + imageId + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            BindData();
        }
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
            Label lblDeleteImageName = (Label)row.FindControl("lblImageName");
            con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM category where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            //ImageDeleteFromFolder(lblDeleteImageName.Text);
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