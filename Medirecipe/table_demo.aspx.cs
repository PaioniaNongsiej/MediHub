using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Medirecipe
{
    public partial class table_demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetEmployeeDetail();
            }
        }

        protected void gvEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private SqlConnection GetConnection()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            return con;
        }
        private void GetEmployeeDetail()
        {
            SqlConnection con = GetConnection();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("_sp_GetEmployeeDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                IDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
            }
            gvEmployee.DataSource = dt;
            gvEmployee.DataBind();
            con.Close();
        }
        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand("_sp_DeleteEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
            GetEmployeeDetail();
        }
        protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployee.EditIndex = e.NewEditIndex;
            GetEmployeeDetail();
        }
        protected void gvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployee.EditIndex = -1;
            GetEmployeeDetail();
        }
        protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)gvEmployee.Rows[e.RowIndex].FindControl("txtempname")).Text;
            string emp_code = ((TextBox)gvEmployee.Rows[e.RowIndex].FindControl("txtempcode")).Text;
            int emp_age = Convert.ToInt32(((TextBox)gvEmployee.Rows[e.RowIndex].FindControl("txtempage")).Text);
            SqlConnection con = GetConnection();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("_sp_UpdateEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id ", id);
            cmd.Parameters.AddWithValue("@emp_name ", name);
            cmd.Parameters.AddWithValue("@Emp_Code ", emp_code);
            cmd.Parameters.AddWithValue("@Emp_Age ", emp_age);
            cmd.ExecuteNonQuery();
            con.Close();
            gvEmployee.EditIndex = -1;// no row in edit mode  
            GetEmployeeDetail();
        }
    }
}