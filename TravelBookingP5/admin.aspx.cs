using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogin"] != null)
        {
            LblWelcome.Text += Session["AdminLogin"];
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('You must login first');", true);
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}