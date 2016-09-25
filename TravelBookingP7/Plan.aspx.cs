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

        if (!IsPostBack)
        {
            //ddlStartFrom.Items.Add("Select");
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
        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        string startJourney = tbxDateOfJourney.Text;
        string returnJourney = tbxReturnDate.Text;
        int result = string.Compare(currentDate, startJourney);
        int result1 = string.Compare(startJourney, returnJourney);

        if (result != 1 && result1 != 1)
        {
            tbxDateOfJourney.Text = String.Empty;
            tbxReturnDate.Text = String.Empty;
            lblDates.Text = "Dates are Wrong";
            datesChecked(sender, e);
        }
        else
        {
            tbxDateOfJourney.Text = String.Empty;
            tbxReturnDate.Text = String.Empty;
        }
    }

    protected void datesChecked(object sender, EventArgs e)
    {
        Session["CityId"] = ddlDestinationCity.SelectedIndex + 1;
        Session["DestinationCity"] = ddlDestinationCity.SelectedItem.ToString();

        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

        try
        {
            string getFields = "insert into tblPlanning(userId,startPoint,destination,fromDate,toDate,modeId) values(@userId,@startPoint,@destination,@fromDate,@toDate,@modeId)";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["UserId"]));
            cmd.Parameters.AddWithValue("@startPoint", ddlStartFrom.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@destination", ddlDestinationCity.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@fromDate", tbxDateOfJourney.Text);
            cmd.Parameters.AddWithValue("@toDate", tbxReturnDate.Text);
            cmd.Parameters.AddWithValue("@modeId", rblMode.SelectedIndex);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }

        Session["Edit"] = "true";

        Response.Write("Congo");

        Response.Redirect("~/Booked.aspx");

        // Response.Redirect("~/Details.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}




//string check = (Session["Edit"]).ToString();

//int result = string.Compare(check, "true");

//        try
//        {
//            if (result == 0)
//            {

//                SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
//connect.Open();
//                string checkuser = "select userId from tblUsers"; /*where Email='" + Session["LoginEmail"].ToString() + "'";*/
//string checkstartfrom = "select startfrom from tblUsers"; /*where Email='" + Session["LoginEmail"].ToString() + "'";*/
//string checkdestination = "select destination from tblUsers";/* where Email='" + Session["LoginEmail"].ToString() + "'";*/
//string checkstartdate = "select startdate from tblUsers"; /*where Email='" + Session["LoginEmail"].ToString() + "'";*/
//string checkenddate = "select enddate from tblUsers"; /*where Email='" + Session["LoginEmail"].ToString() + "'";*/

//SqlCommand cmduser = new SqlCommand(checkuser, connect);
//SqlCommand cmdstartfrom = new SqlCommand(checkstartfrom, connect);
//SqlCommand cmddestination = new SqlCommand(checkdestination, connect);
//SqlCommand cmdstartddate = new SqlCommand(checkstartdate, connect);
//SqlCommand cmdenddate = new SqlCommand(checkenddate, connect);

//cmduser.ExecuteNonQuery();
//                cmdstartfrom.ExecuteNonQuery();
//                cmddestination.ExecuteNonQuery();
//                cmdstartddate.ExecuteNonQuery();
//                cmdenddate.ExecuteNonQuery();

//                string user = cmduser.ExecuteScalar().ToString();
//string startfrom = cmdstartfrom.ExecuteScalar().ToString();
//string destination = cmddestination.ExecuteScalar().ToString();
//string startdate = cmdstartddate.ExecuteScalar().ToString();
//string enddate = cmdenddate.ExecuteScalar().ToString();

//connect.Close();


//                //ddlStartFrom.SelectedItem.ToString() = "";
//                //ddlDestinationCity.SelectedItem.ToString()="";
//                tbxDateOfJourney.Text = startdate;
//                tbxReturnDate.Text = enddate;
//            }
//        }
//        catch(Exception except)
//        {
//            Response.Write("Some Error Occured");
//        }

