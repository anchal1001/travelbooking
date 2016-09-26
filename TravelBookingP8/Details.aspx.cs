using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Details : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //ddlHotels.Items.Add("Select");
            int cityId = 0;
            cityId = (int)Session["CityId"];
            string constr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString(); // connection string
            SqlConnection con = new SqlConnection(constr);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                SqlCommand com = new SqlCommand("select Name from tblHotels where City_Id = " + Session["CityId"], con); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(ds);  // fill dataset
                ddlHotels.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown
                                                                                   // to retrive specific  textfield name 
                ddlHotels.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                ddlHotels.DataBind();  //binding dropdownlist
                con.Close();

                lblStartFrom.Text = Session["StartCity"].ToString();
                //lblDestinationCity.Text = "Checking";

                lblDestinationCity.Text = Session["DestinationCity"].ToString();
                
            }
            catch (Exception except)
            {
                Response.Write(except.Message);
            }
        }
        catch(Exception except)
        {
            Response.Write("Error :- "+ except.Message );
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        string startJourney = tbxDateOfJourney.Text;
        string returnJourney = tbxReturnDate.Text;
        int result = string.Compare(currentDate, startJourney);
        int result1 = string.Compare(startJourney, returnJourney);

        if (result != 1 && result1!=1)
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
        //Response.Redirect("~/Final.aspx");
    }

    protected void datesChecked(object sender,EventArgs e)
    {
        Response.Redirect("~/Final.aspx");
    }
}