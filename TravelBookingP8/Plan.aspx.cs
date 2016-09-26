using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Plan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserLogin"] == null && Session["AdminLogin"]==null )
        {
            Response.Redirect("Home.aspx");
        }
        
        if (!IsPostBack)
        {
           // lblInfo.Text = Session["UserId"].ToString();
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

        string startCity = ddlStartFrom.SelectedItem.ToString();


        string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
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

        string destinationState = ddlDestinationState.SelectedItem.ToString();
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string checkstateId = "select stateId from tblStates where stateName='" + destinationState + "'";
        SqlCommand cmdstateId = new SqlCommand(checkstateId, connect);
        connect.Open();
        cmdstateId.ExecuteNonQuery();
        int stateId = Convert.ToInt32(cmdstateId.ExecuteScalar().ToString());
        connect.Close();

        Session["StateId"] = stateId;

        string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
        SqlConnection con = new SqlConnection(constr);
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("select cityName from tblCity where stateId=" + stateId, con); // table name 
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

        //string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        //string dob = tbxDOB.Text;
        //int result = string.Compare(currentDate, dob);
        //if (result < 0 || result == 0)
        //{
        //    tbxDOB.Text = String.Empty;
        //    lblInfo.Text = "Invalid Date of Birth";
        //}


        if (result > 0 || result1 > 0)
        {
            tbxDateOfJourney.Text = String.Empty;
            tbxReturnDate.Text = String.Empty;
            lblDates.Text = "Dates are Wrong";
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Incorrect Dates');", true);

        }
        else
        {

            //int userId = Convert.ToInt32(Session["UserId"]);

            //SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            //string checkcount = "select count(*) from tblPlanning where userId=@userId and fromDate=@fromDate";
            //SqlCommand cmd = new SqlCommand(checkcount, connect);
            //cmd.Parameters.AddWithValue("@userId", userId);
            //cmd.Parameters.AddWithValue("@fromDate", tbxDateOfJourney.Text);
            //connect.Open();
            //cmd.ExecuteNonQuery();
            //SqlCommand cmdcount = new SqlCommand(checkcount, connect);

            //int temp = Convert.ToInt32(cmdcount.ExecuteScalar().ToString());
            //connect.Close();
            //if (temp != 0)
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('You are busy on that date');", true);
            //}
            //else
            {
                datesChecked(sender, e);
            }
        }

    }

    protected void datesChecked(object sender, EventArgs e)
    {

        try
        {
            int modeId;
            if (rbtnTrain.Checked == true)
            {
                modeId = 1;
            }
            else if (rbtnBus.Checked == true)
            {
                modeId = 2;
            }
            else
            {
                modeId = 3;
            }


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
            cmd.Parameters.AddWithValue("@modeId", modeId);

            cmd.ExecuteNonQuery();
            connect.Close();


            string destinationState = ddlDestinationState.SelectedItem.ToString();
            connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            string checkstateId = "select stateId from tblStates where stateName='" + destinationState + "'";
            SqlCommand cmdstateId = new SqlCommand(checkstateId, connect);
            connect.Open();
            cmdstateId.ExecuteNonQuery();
            int stateId = Convert.ToInt32(cmdstateId.ExecuteScalar().ToString());
            connect.Close();


            Response.Redirect("Booked.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void goBack(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null && Session["AdminLogin"] == null)
            Response.Redirect("UserHomePage.aspx");
        else if(Session["AdminLogin"]!=null && Session["UserLogin"]==null)
            Response.Redirect("AdminHome.aspx");
    }
}



