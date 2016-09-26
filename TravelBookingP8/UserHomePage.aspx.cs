using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
        lblWelcome.Text = "";
        if (Session["UserLogin"] != null)
        {
            lblWelcome.Text += Session["UserLogin"];
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('You must login first');", true);
            Response.Redirect("Login.aspx");
        }

        /*if (Session["UserLogin"] == null)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('You must login first');", true);
            Response.Redirect("Login.aspx");
        }
        /*
         if (Session["UserLogin"] == null)
        {
            Response.Redirect("Login.aspx");
        } 
        else
        {
            lblWelcome.Text += Session["UserLogin"];
           
           
        }
        //if (Session["Login"] != "1")
        //{
        //    Response.Redirect("Login.aspx");
        //}*/

    }
    protected void PlanJourney(object sender, EventArgs e)
    {
        Response.Redirect("Plan.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
}
    protected void UpdateEvent(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        int userId = Convert.ToInt32(Session["UserId"]);
        string checkNumber = "select count(*) from tblPlanning where userId='" + userId + "'";
        SqlCommand cmdNumber = new SqlCommand(checkNumber, connect);
        connect.Open();
        int temp = Convert.ToInt32(cmdNumber.ExecuteScalar().ToString());
        connect.Close();
        if (temp == 0)
        {
            Response.Write(@"<script language='javascript'>alert('Plan Your Event first')</script>"); //Response.Write("");
        }
        else
        {
            Response.Redirect("IfMany.aspx");
        }
    }
}