using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Convert.ToInt32(Session["Login"]) == 0)
        //    {
        //    Response.Redirect("Home.aspx");
        //}

        if (!IsPostBack)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            string startPoint;
            string destination;
            try
            {

                string checkstartpoint = "select startpoint from tblPlanning where userId='" + userId + "'";
                string checkdestination = "select destination from tblPlanning where userId='" + userId + "'";
                string checkfromDate = "select fromDate from tblPlanning where userId='" + userId + "'";
                string checktoDate = "select toDate from tblPlanning where userId='" + userId + "'";
                string checkmodeId = "select modeId from tblPlanning where userId='" + userId + "'";

                SqlCommand cmdstartpoint = new SqlCommand(checkstartpoint, connect);
                SqlCommand cmddestination = new SqlCommand(checkdestination, connect);
                SqlCommand cmdfromDate = new SqlCommand(checkfromDate, connect);
                SqlCommand cmdtoDate = new SqlCommand(checktoDate, connect);
                SqlCommand cmdmodeId = new SqlCommand(checkmodeId, connect);
                connect.Open();
                cmdstartpoint.ExecuteNonQuery();
                connect.Close();
                connect.Open();
                cmddestination.ExecuteNonQuery();
                connect.Close();
                connect.Open();
                cmdfromDate.ExecuteNonQuery();
                connect.Close();
                connect.Open();
                cmdtoDate.ExecuteNonQuery();
                connect.Close();
                connect.Open();
                cmdmodeId.ExecuteNonQuery();
                connect.Close();


                connect.Open();
                startPoint = cmdstartpoint.ExecuteScalar().ToString();
                destination = cmddestination.ExecuteScalar().ToString();
                DateTime fromDate = Convert.ToDateTime(cmdfromDate.ExecuteScalar().ToString());
                string toDate = cmdtoDate.ExecuteScalar().ToString();
                int modeId = Convert.ToInt32(cmdmodeId.ExecuteScalar().ToString());

                lblstartDate.Text = fromDate.ToString().Remove(10);
                lblendDate.Text = toDate.Remove(10);

                //tbxDateOfJourney.Text = fromDate;
                //tbxReturnDate.Text =toDate;

                //tbxDateOfJourney.Text = fromDate.ToString("yyyy-MM-dd");
                //tbxReturnDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

                connect.Close();
                if (modeId == 1)
                {
                    rbtnTrain.Checked = true;
                    //imgMode.ImageUrl = "img1.jpg";
                }
                else if (modeId == 2)
                {
                    rbtnBus.Checked = true;
                }
                else
                {
                    rbtnCar.Checked = true;
                }
                tbxDateOfJourney.Text = DateTime.Now.ToString();
                tbxReturnDate.Text = DateTime.Now.ToShortDateString();
                string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
                SqlConnection con = new SqlConnection(constr);
                DataSet ds = new DataSet();
                con.Open();
                SqlCommand com = new SqlCommand("select cityName from tblCity", con); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(ds);  // fill dataset
                ddlStartFrom.DataTextField = ds.Tables[0].Columns["cityName"].ToString(); // text field name of table dispalyed in dropdown
                                                                                          // to retrive specific  textfield name 
                ddlStartFrom.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                ddlStartFrom.DataBind();  //binding dropdownlist
                ddlStartFrom.SelectedValue = startPoint.ToString();
                con.Close();


                con.Open();
                com = new SqlCommand("select stateName from tblStates", con); // table name 
                da = new SqlDataAdapter(com);
                da.Fill(ds);  // fill dataset
                ddlDestinationState.DataTextField = ds.Tables[0].Columns["stateName"].ToString(); // text field name of table dispalyed in dropdown
                                                                                                  // to retrive specific  textfield name 
                ddlDestinationState.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                ddlDestinationState.DataBind();  //binding dropdownlist
                //ddlDestinationState.SelectedValue = state.ToString();
                con.Close();


                con.Open();
                com = new SqlCommand("select cityName from tblCity where stateId'" + Convert.ToInt32(Session["StateId"]) + "'", con); // table name 
                da = new SqlDataAdapter(com);
                da.Fill(ds);  // fill dataset
                ddlDestinationCity.DataTextField = ds.Tables[0].Columns["cityName"].ToString(); // text field name of table dispalyed in dropdown                                                                                        // to retrive specific  textfield name 
                ddlDestinationCity.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                ddlDestinationCity.DataBind();  //binding dropdownlist
                //ddlDestinationCity.SelectedValue = destination.ToString();
                con.Close();


                //string checkstate = "select stateName from tblStates where stateId='" + Convert.ToInt32(Session["StateId"]) + "'";
                //SqlCommand cmdstate = new SqlCommand(checkstate, connect);
                //connect.Open();
                //cmdstate.ExecuteNonQuery();
                //connect.Close();
                //connect.Open();
                //string state = cmdmodeId.ExecuteScalar().ToString();
                //connect.Close();


                string checkstate = "select stateName from tblStates where stateId='" + Convert.ToInt32(Session["StateId"]) + "'";
                SqlCommand cmdstate = new SqlCommand(checkstate, connect);
                connect.Open();
                cmdstate.ExecuteNonQuery();
                connect.Close();
                connect.Open();
                string state = cmdmodeId.ExecuteScalar().ToString();
                connect.Close();

                //ddlDestinationState.SelectedValue = state.ToString();

            }
            catch (Exception ex)
            {
                Response.Write(@"<script language='javascript'>alert('No Data')</script>");
            }



            //lblInfo.Text = Session["UserId"].ToString();

           
        }
    }



    protected void ddlStartFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["StartCity"] = ddlStartFrom.SelectedItem.ToString();

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
        //Session["StateId"] = ddlDestinationState.SelectedIndex + 1;

        Session["StartCity"] = ddlStartFrom.SelectedItem.ToString();
        Session["DestinationState"] = ddlDestinationState.SelectedItem.ToString();

        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);



        string checkstate = "select stateId from tblStates where stateName='" + ddlDestinationState.SelectedItem + "'";
        SqlCommand cmdstate = new SqlCommand(checkstate, connect);
        connect.Open();
        cmdstate.ExecuteNonQuery();
        connect.Close();
        connect.Open();
        string state = cmdstate.ExecuteScalar().ToString();
        connect.Close();

        string destinationState = ddlDestinationState.SelectedItem.ToString();
        
        string checkstateId = "select stateId from tblStates where stateName='" + ddlDestinationState.SelectedItem + "'";
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
            string getFields = "update tblPlanning SET startPoint=@startPoint,destination=@destination,fromDate=@fromDate,toDate=@toDate,modeId=@modeId where userId=@userId";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["UserId"]));
            cmd.Parameters.AddWithValue("@startPoint", ddlStartFrom.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@destination", ddlDestinationCity.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@fromDate", tbxDateOfJourney.Text);
            cmd.Parameters.AddWithValue("@toDate", tbxReturnDate.Text);
            cmd.Parameters.AddWithValue("@modeId", 1);

            cmd.ExecuteNonQuery();
            connect.Close();

            //Session["Edit"] = "true";

            //Response.Write(""+Session["UserId"].ToString());

            Response.Redirect("~/Booked.aspx");
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


    protected void tbxDateOfJourney_TextChanged(object sender, EventArgs e)
    {
        lblstartDate.Text = "";
    }

    protected void tbxReturnDate_TextChanged(object sender, EventArgs e)
    {
        lblendDate.Text = "";

    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string deleteField = "delete from tblPlanning where userId=@planID";
        SqlCommand cmd = new SqlCommand(deleteField, connect);
        connect.Open();
        cmd.Parameters.AddWithValue("@planID", Convert.ToInt32(Session["UserId"]));
        cmd.ExecuteNonQuery();
        connect.Close();
        Response.Redirect("home2.aspx");
    }
    protected void goBack(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
            Response.Redirect("UserHomePage.aspx");
        else if (Session["AdminLogin"] != null)
            Response.Redirect("AdminHome.aspx");
    }
}



