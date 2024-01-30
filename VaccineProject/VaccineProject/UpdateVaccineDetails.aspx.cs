using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VaccineProject
{
    public partial class UpdateVaccineDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=DESKTOP-D9AQSGN;Database=VaccineManagementDb;trusted_connection=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from VaccineDetails where  VaccineName = @VaccineName", con);
            cmd.Parameters.AddWithValue("@VaccineName", TxtVacName.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "VaccineDetails");
            if (ds.Tables["VaccineDetails"].Rows.Count != 0)
            {
                LblMsg.Text = "This Vaccine is Already available";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("insert into VaccineDetails values('" + TxtVacName.Text + "','" + TxtVacMan.Text + "','" + TxtVaxStock.Text + "')", con);
                cmd2.ExecuteNonQuery();

                con.Close();
                LblMsg.Text = "Data has been inserted";
                GridView1.DataBind();
                DropDownList1.DataBind();
                TxtVacName.Text = "";
                TxtVacMan.Text = "";
                TxtVaxStock.Text = "";
            }
            
            
        }

        protected void BtnUpd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from VaccineDetails where  VaccineID = @VaccineID", con);
            cmd.Parameters.AddWithValue("@VaccineID", DropDownList1.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "VaccineDetails");
            if (ds.Tables["VaccineDetails"].Rows.Count == 0)
            {
                LblMsg2.Text = "No Id Found to Update Data";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("Select * from VaccineDetails where     VaccineName = @VaccineName ", con);
                //cmd2.Parameters.AddWithValue("@VaccineId", DropDownList1.Text);
                cmd2.Parameters.AddWithValue("@VaccineName", TxtVaxName2.Text);
                
                SqlDataAdapter daa = new SqlDataAdapter(cmd2);
                DataSet dss = new DataSet();
                daa.Fill(dss, "VaccineDetails");
                if (dss.Tables["VaccineDetails"].Rows.Count != 0)
                {
                    SqlCommand cmd3 = new SqlCommand("Select * from VaccineDetails where   VaccineID <> @VaccineID AND VaccineName = @VaccineName ", con);
                    cmd3.Parameters.AddWithValue("@VaccineId", DropDownList1.Text);
                    cmd3.Parameters.AddWithValue("@VaccineName", TxtVaxName2.Text);
                    
                    SqlDataAdapter daaa = new SqlDataAdapter(cmd3);
                    DataSet dsss = new DataSet();
                    daaa.Fill(dsss, "VaccineDetails");
                    if (dsss.Tables["VaccineDetails"].Rows.Count != 0)
                    {
                        //SqlCommand cmd4 = new SqlCommand("update VaccineDetails set VaccineName='" + TxtVaxName2.Text + "', Manufacturer = '" + TxtVacMan2.Text + "',Stock='" + TxtVaxStock2.Text + "' where VaccineID = '" + DropDownList1.Text + "'", con);
                        //cmd4.ExecuteNonQuery();
                        //con.Close();
                        //LblMsg2.Text = "Data has been updated with Same Vaxin";
                        //GridView1.DataBind();
                        //DropDownList1.DataBind();
                        //TxtVaxName2.Text = "";
                        //TxtVacMan2.Text = "";
                        //TxtVaxStock2.Text = "";

                        LblMsg2.Text = "Same Vaxin Name is Already available";

                    }
                    else
                    {


                        SqlCommand cmd5 = new SqlCommand("update VaccineDetails set VaccineName='" + TxtVaxName2.Text + "', Manufacturer = '" + TxtVacMan2.Text + "',Stock='" + TxtVaxStock2.Text + "' where VaccineID = '" + DropDownList1.Text + "'", con);
                        cmd5.ExecuteNonQuery();
                        con.Close();
                        LblMsg2.Text = "Data has been updated with Same VaxinName";
                        GridView1.DataBind();
                        DropDownList1.DataBind();
                        TxtVaxName2.Text = "";
                        TxtVacMan2.Text = "";
                        TxtVaxStock2.Text = "";
                    }
                    
                }
                else
                {


                    SqlCommand cmd3 = new SqlCommand("update VaccineDetails set VaccineName='" + TxtVaxName2.Text + "', Manufacturer = '" + TxtVacMan2.Text + "',Stock='" + TxtVaxStock2.Text + "' where VaccineID = '" + DropDownList1.Text + "'", con);
                    cmd3.ExecuteNonQuery();
                    con.Close();
                    LblMsg2.Text = "Data has been updated With Different Vaxin";
                    GridView1.DataBind();
                    DropDownList1.DataBind();
                    TxtVaxName2.Text = "";
                    TxtVacMan2.Text = "";
                    TxtVaxStock2.Text = "";
                }
            }
        }

        protected void BtnDlt_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from VaccineDetails where  VaccineID = @VaccineID", con);
            cmd.Parameters.AddWithValue("@VaccineID", TxtDlt.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "VaccineDetails");
            if (ds.Tables["VaccineDetails"].Rows.Count == 0)
            {
                LblMsg2.Text = "No Id Found to Delete Data";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("delete from VaccineDetails where VaccineID ='" + Convert.ToInt32(TxtDlt.Text).ToString() + "'", con);
                cmd2.ExecuteNonQuery();
                con.Close();
                LblMsg2.Text = "Data has been Deleted";
                GridView1.DataBind();
                DropDownList1.DataBind();
                TxtDlt.Text = "";
                
            }

        }
    }
}