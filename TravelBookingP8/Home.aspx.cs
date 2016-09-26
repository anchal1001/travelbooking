using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        


        Session["LastPage"] = "Home.aspx";
    }

    protected void searchPlaces(object sender ,EventArgs e)
    {
        Session["search"] = tbxsearch.Text;
        Session["LastPage"] = "Home.aspx";
        Response.Redirect("Search.aspx");
    }
}