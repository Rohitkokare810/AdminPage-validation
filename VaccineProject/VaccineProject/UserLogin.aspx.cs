using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VaccineProject
{
    public partial class UserLogin : System.Web.UI.Page
    {
        public static string UserName;
        public static int UserIdd;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                GenerateCaptcha();
            }
        }
        private void GenerateCaptcha()
        {
            Random rand = new Random();
            int num = rand.Next(6, 8);
            string captcha = "";
            int tot1 = 0;
            do
            {
                int chr = rand.Next(48, 123);
                if ((chr >= 48 && chr <= 57) || (chr >= 65 && chr <= 90) || (chr >= 97 && chr <= 122))
                {
                    captcha = captcha + (char)chr;
                    tot1++;
                    if (tot1 == num)
                        break;
                }
            }
            while (true);
            LblCaptcha.Text = captcha;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Server=DESKTOP-D9AQSGN;Database=VaccineManagementDb;trusted_connection=true");
            SqlCommand cmd = new SqlCommand("Select * from UserDetails where Username = @username and Password = @password", con);
            cmd.Parameters.AddWithValue("@username", TxtUser.Text);
            cmd.Parameters.AddWithValue("@password", TxtPwd.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "UserDetails");
            if ((ds.Tables["UserDetails"].Rows.Count == 0))

            {
                Label5.Text = "Invalid user";
            }
            else
            {
                string usercap = LblCaptcha.Text.ToString().ToLower();
                if ((TxtCaptcha.Text.ToLower().Equals(usercap)))
                {
                    int userID = GetUserIDFromDatabase(TxtUser.Text);

                    Session["UserID"] = userID;





                    Response.Redirect("AdminDashboard.aspx");



                }
                else
                {
                    Label5.Text = "Invalid captcha";
                    GenerateCaptcha();

                }

            }
            int GetUserIDFromDatabase(string username)
            {
                int userID = 0;
                string connectionString = "Server=DESKTOP-D9AQSGN;Database=VaccineManagementDb;trusted_connection=true";


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Your SQL query to retrieve the UserID based on the username
                    string query = "SELECT UserID FROM UserDetails WHERE UserName = @UserName";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@UserName", username);

                        // Execute the query and retrieve the UserID
                        var result = command.ExecuteScalar();

                        if (result != null)
                        {
                            userID = Convert.ToInt32(result);
                        }
                        // Handle the case where the username is not found, if needed
                    }
                }

                return userID;
            }


        }
    }
}