using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VaccineProject
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userID = (int)Session["UserID"];
            Label1.Text = userID.ToString();
            //Label1.Text = AdminLogin.AdminName;
        }

        protected void LnkBtn1_Click(object sender, EventArgs e)
        {

        }
    }
}