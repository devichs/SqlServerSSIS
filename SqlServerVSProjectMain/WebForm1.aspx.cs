using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace SqlServerVSProjectMain
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["personTableConnectionString"].ConnectionString;
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand comm = new SqlCommand("InsertPRoc", conn);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@Name", txtName.Text);
            comm.Parameters.AddWithValue("@Email", txtEmail.Text);
            comm.Parameters.AddWithValue("@DateSaved", Calendar1.SelectedDate);
            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            GridView1.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();//11/24/2017
        }
    }
}