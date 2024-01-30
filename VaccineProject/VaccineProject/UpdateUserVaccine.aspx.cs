using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VaccineProject
{
    public partial class UpdateUserVaccine : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=DESKTOP-D9AQSGN;Database=VaccineManagementDb;trusted_connection=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from BookForVaccine where  BookingID = @BookingID", con);
            cmd.Parameters.AddWithValue("@BookingID", DDListBookId.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "BookForVaccine");
            if (ds.Tables["BookForVaccine"].Rows.Count == 0)
            {
                LblMsg.Text = "No Id Found to Update Data";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("update BookForVaccine set NumberOfDose='" + DDListDose.Text + "',Status='" + RadioBtnStatus.Text + "' where BookingID='" + DDListBookId.Text + "'", con);
                cmd2.ExecuteNonQuery();
                con.Close();
                LblMsg.Text = "Data has been updated";
                GridView1.DataBind();
                
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select BookingId,NumberOfDose,Status,Name from BookForVaccine where BookingID = @BookingID", con);
            cmd.Parameters.AddWithValue("@BookingID", TxtSearch.Text);


            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds, "VaccineDetails");
            if (ds.Tables["VaccineDetails"].Rows.Count == 0)
            {

                GridView1.DataSourceID = null;
                GridView1.DataSource = ds;
                GridView1.DataBind();

                con.Close();
                LblMsg.Text = "No Id Found to show data";

            }
            else
            {

                GridView1.DataSourceID = null;
                GridView1.DataSource = ds;
                GridView1.DataBind();

                con.Close();
                LblMsg.Text = "Data selected";
            }
        }
    }
}