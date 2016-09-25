using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
if(!IsPostBack)
        {
            BindData();
        }

    }
    protected void BindData()
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        connect.Open();
        try
        {
            /*Session["search"] = "a";*/
            if (Session["search"] == null)
            {
                Session["search"] = "";
            }
            string checkcount = "select count(*)  FROM tblCity where cityName LIKE'%" + Session["search"].ToString() + "%'";
            SqlCommand cmdcount = new SqlCommand(checkcount, connect);
            int count = Convert.ToInt32(cmdcount.ExecuteScalar().ToString());
            if (count == 0)
            {
                lblInfo.Text = "Sorry, No such Result Found by name : "+Session["search"];
                Response.Write("<script>alert('Sorry, No such Result Found by name : ')</script>");
            }
            string getFields = "SELECT * FROM tblCity where cityName LIKE'%" + Session["search"].ToString() + "%'";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            GridViewData.DataSource = cmd.ExecuteReader();
            GridViewData.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            lblInfo.Text = "Some Error Occured";
        }
    }

    protected void GridViewData_EditRow(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect("../Explore.aspx");
    }

}