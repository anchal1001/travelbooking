using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        //if (Session["Login"] != "1")
        //{
        //    Response.Redirect("Login.aspx");
        //}

    }
    protected void PlanJourney(object sender, EventArgs e)
    {
        Response.Redirect("~/Planning.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}