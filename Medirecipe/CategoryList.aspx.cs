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
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!this.IsPostBack)
            {
                //this.Search();
                BindGrid();
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
                        gvImage.DataSource = dt;
                        gvImage.DataBind();
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
            gvImage.GridLines = GridLines.Both;
            gvImage.HeaderStyle.Font.Bold = true;
            gvImage.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }
        protected void BindGrid()
        {
            //con = new SqlConnection(constr);
            //con.Open();
            //da = new SqlDataAdapter("select * from category", con);
            //ds = new DataSet();
            //da.Fill(ds);
            //gvImage.DataSource = ds;
            //gvImage.DataBind();

            string query = "SELECT *  FROM category";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gvImage.DataSource = dt;
                        gvImage.DataBind();
                    }
                }
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gvImage.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void gvImage_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Enabled = false;
        }
        // edit event
        protected void gvImage_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvImage.EditIndex = e.NewEditIndex;
            BindGrid();

        }
        // update event
        protected void gvImage_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //find image id of edit row
            string imageId = gvImage.DataKeys[e.RowIndex].Value.ToString();

            // find values for update
            TextBox name = (TextBox)gvImage.Rows[e.RowIndex].FindControl("txt_Name");
            FileUpload FileUpload1 = (FileUpload)gvImage.Rows[e.RowIndex].FindControl("FileUpload1");
            con = new SqlConnection(constr);
            string path = "~/pictures/category/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                //save image in folder
                FileUpload1.SaveAs(MapPath(path));
            }
            else
            {
                // use previous user image if new image is not changed
                Image img = (Image)gvImage.Rows[e.RowIndex].FindControl("img_user");
                path = img.ImageUrl;
            }
            SqlCommand cmd = new SqlCommand("update category set category_name='" + name.Text + "',category_icon='" + path + "'  where id=" + imageId + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            gvImage.EditIndex = -1;
            BindGrid();
        }
        // cancel edit event
        protected void gvImage_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvImage.EditIndex = -1;
            BindGrid();
        }
        //delete event
        protected void gvImage_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvImage.DataKeys[e.RowIndex].Values[0]);
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
            SqlCommand c = new SqlCommand("select COUNT(*) from shipper", con);
            int? RowCount = (int?)c.ExecuteScalar();
            total_order.Text = RowCount.ToString();
        }
    }
}