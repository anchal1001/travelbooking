using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class Booked : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogin"] == null && Session["UserLogin"] == null)
            Response.Redirect("Login.aspx");
        if (!IsPostBack)
        {
            try
            {
                SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                connect.Open();

                string checkstart = "select startPoint from tblPlanning where userId='" + Convert.ToInt32(Session["userId"]) + "'";
                string checkdestination = "select destination from tblPlanning where userId='" + Convert.ToInt32(Session["userId"]) + "'";
                string checkfromDate = "select fromDate from tblPlanning where userId='" + Convert.ToInt32(Session["userId"]) + "'";
                string checktoDate = "select toDate from tblPlanning where userId='" + Convert.ToInt32(Session["userId"]) + "'";
                string checkmodeId = "select modeId from tblPlanning where userId='" + Convert.ToInt32(Session["userId"]) + "'";
                
                SqlCommand cmdstart = new SqlCommand(checkstart, connect);
                SqlCommand cmddestination = new SqlCommand(checkdestination, connect);
                SqlCommand cmdfromDate = new SqlCommand(checkfromDate, connect);
                SqlCommand cmdtoDate = new SqlCommand(checktoDate, connect);
                SqlCommand cmdmodeId = new SqlCommand(checkmodeId, connect);

                cmdstart.ExecuteNonQuery();
                cmddestination.ExecuteNonQuery();
                cmdfromDate.ExecuteNonQuery();
                cmdtoDate.ExecuteNonQuery();
                cmdmodeId.ExecuteNonQuery();

                string destination = cmddestination.ExecuteScalar().ToString();
                string initialfromDate = cmdfromDate.ExecuteScalar().ToString();
                string fromDate = initialfromDate.Remove(10);
                string initialtoDate = cmdtoDate.ExecuteScalar().ToString();
                string toDate = initialtoDate.Remove(10);
                string start = cmdstart.ExecuteScalar().ToString();

                int modeId = Convert.ToInt32(cmdmodeId.ExecuteScalar().ToString());

                connect.Close();

                lblStartFrom.Text = start;
                lblDestination.Text = destination;
                lblStartdate.Text = fromDate;
                lblEndDate.Text = toDate;
                if(modeId==1)
                {
                    lblMode.Text = "Train";
                    //imgMode.ImageUrl = "img1.jpg";
                }
                else if(modeId == 2)
                {
                    lblMode.Text = "Bus";
                }
                else
                {
                    lblMode.Text = "Car";
                }
                //Bitmap b = new Bitmap(destWidth, destHeight);
                //Graphics g = Graphics.FromImage((System.Drawing.Image)b);
                ////g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                //// Draw image with new width and height
                //g.DrawImage(imgMode, 0, 0, destWidth, destHeight);
                //g.Dispose();
                
                
            }
            catch (Exception except)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('No Data to show');", true);
            }
        }
    }

    protected void EditIt(object sender,EventArgs e)
    {
        Response.Redirect("Edit.aspx");
    }
    protected void AddNew(object sender,EventArgs e)
    {
        Response.Redirect("Add.aspx");
    }
    protected void DidIt(object sender,EventArgs e)
    {
        if (Session["UserLogin"] != null)
            Response.Redirect("UserHomePage.aspx");
        else if (Session["AdminLogin"] != null)
            Response.Redirect("AdminHome.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}