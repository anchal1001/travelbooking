using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Convert.ToInt32(Session["Login"]) == 0)
        //    {
        //    Response.Redirect("Home.aspx");
        //}
        //Session["UserId"] = 62;
        if (!IsPostBack)
        {
            lblInfo.Text = Session["UserId"].ToString();
            tbxDateOfJourney.Text = DateTime.Now.ToString();
            tbxReturnDate.Text = DateTime.Now.ToShortDateString();
            string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(constr);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                SqlCommand com = new SqlCommand("select cityName from tblCity", con); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(ds);  // fill dataset
                ddlStartFrom.DataTextField = ds.Tables[0].Columns["cityName"].ToString(); // text field name of table dispalyed in dropdown
                                                                                          // to retrive specific  textfield name 
                ddlStartFrom.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                ddlStartFrom.DataBind();  //binding dropdownlist
                con.Close();
            }
            catch (Exception except)
            {
                Response.Write(except.Message);
            }
        }
    }


    protected void ddlStartFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["StartCity"] = ddlStartFrom.SelectedItem.ToString();

        //ddlStartFrom.Items.Add("Select");
        string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        //String startfrom = ddlStartFrom.SelectedItem.ToString();
        //Session["StartCity"] = startfrom;
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("select stateName from tblStates", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(ds);  // fill dataset
            ddlDestinationState.DataTextField = ds.Tables[0].Columns["stateName"].ToString(); // text field name of table dispalyed in dropdown
                                                                                              // to retrive specific  textfield name 
            ddlDestinationState.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            ddlDestinationState.DataBind();  //binding dropdownlist
            con.Close();
        }
        catch (Exception except)
        {
            Response.Write(except.Message);
        }
    }

    protected void FillDestinationState(object sender, EventArgs e)
    {

    }

    protected void ddlDestinationState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["StateId"] = ddlDestinationState.SelectedIndex + 1;
        Session["DestinationState"] = ddlDestinationState.SelectedItem.ToString();

        string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("select cityName from tblCity where stateId=" + Session["StateId"], con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(ds);  // fill dataset
            ddlDestinationCity.DataTextField = ds.Tables[0].Columns["cityName"].ToString(); // text field name of table dispalyed in dropdown                                                                                        // to retrive specific  textfield name 
            ddlDestinationCity.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            ddlDestinationCity.DataBind();  //binding dropdownlist
            con.Close();
        }
        catch (Exception except)
        {
            Response.Write(except.Message);
        }
    }

    protected void CityForVisit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Visiting.aspx");
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        if (ddlDestinationCity.SelectedItem.ToString() == ddlStartFrom.SelectedItem.ToString())
        {
            lblInfo.Text = "Start and Destinations are same";
        }

        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        string startJourney = tbxDateOfJourney.Text;
        string returnJourney = tbxReturnDate.Text;
        int result = string.Compare(currentDate, startJourney);
        int result1 = string.Compare(startJourney, returnJourney);

        //if (result != 1 && result1 != 1)
        //{
        //    tbxDateOfJourney.Text = String.Empty;
        //    tbxReturnDate.Text = String.Empty;
        //    lblDates.Text = "Dates are Wrong";
        //    datesChecked(sender, e);
        //}
        //else
        //{
        //    tbxDateOfJourney.Text = String.Empty;
        //    tbxReturnDate.Text = String.Empty;
        //}
        datesChecked(sender, e);
    }

    protected void datesChecked(object sender, EventArgs e)
    {
        Session["CityId"] = ddlDestinationCity.SelectedIndex + 1;
        //Session["DestinationCity"] = ddlDestinationCity.SelectedItem.ToString();

        try
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            string getFields = "insert into tblPlanning(userId,startPoint,destination,fromDate,toDate,modeId) values(@userId,@startPoint,@destination,@fromDate,@toDate,@modeId)";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            int userId = Convert.ToInt32(Session["UserId"]);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@startPoint", ddlStartFrom.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@destination", ddlDestinationCity.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@fromDate", tbxDateOfJourney.Text);
            cmd.Parameters.AddWithValue("@toDate", tbxReturnDate.Text);
            cmd.Parameters.AddWithValue("@modeId", 1);

            cmd.ExecuteNonQuery();
            connect.Close();

            //Session["Edit"] = "true";

            //Response.Write(""+Session["UserId"].ToString());

            //Response.Redirect("Booked.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }


        // Response.Redirect("~/Details.aspx");
    }

    protected void logout(object sender, EventArgs e)
    {
        Session["Login"] = 0;
        Response.Redirect("Home.aspx");
    }
}



