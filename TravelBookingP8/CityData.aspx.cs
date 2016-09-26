using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class CityData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogin"] == null)
            Response.Redirect("Login.aspx");
        if (!IsPostBack)
        {
            BindData();
            BindStates();
        }
    }
    protected void BindData()
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        try
        {

            string getFields = "SELECT * FROM tblCity";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            GridViewCity.DataSource = cmd.ExecuteReader();
            GridViewCity.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            Response.Write("ERROR = " + ex.ToString());
        }
    }
    protected void BindStates()
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        try
        {

            string getStates = "SELECT * FROM tblStates";
            SqlCommand cmdStates = new SqlCommand(getStates, connect);
            connect.Open();
            GridViewState.DataSource = cmdStates.ExecuteReader();
            GridViewState.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("ERROR = " + ex.ToString());
        }
    }
    protected void GridViewCity_EditRow(object sender, GridViewEditEventArgs e)
    {
        GridViewCity.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void GridViewCity_CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewCity.EditIndex = -1;
        BindData();
    }
    protected void GridViewCity_InsertCity(object sender, EventArgs e)
    {
        string cityId = ((TextBox)GridViewCity.FooterRow.FindControl("tbxCityId")).Text;
        string cityName = ((TextBox)GridViewCity.FooterRow.FindControl("tbxCityName")).Text;
        string stateId = ((TextBox)GridViewCity.FooterRow.FindControl("tbxStateId")).Text;
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string getFields = "insert into tblCity(cityId, cityName, stateId) values(@cityId, @cityName, @stateId) select  cityId, cityName,stateId from tblCity";
        
        SqlCommand cmd = new SqlCommand(getFields, connect);
       
        cmd.Parameters.AddWithValue("@cityId", cityId);
        cmd.Parameters.AddWithValue("@cityName", cityName);
        cmd.Parameters.AddWithValue("@stateId", stateId);
        connect.Open();
        cmd.ExecuteNonQuery();
        connect.Close();
        BindData();
    }
    protected void GridViewCity_UpdateCity(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewCity.Rows[e.RowIndex];
        TextBox tbxCityId = (TextBox)row.FindControl("tbxCityId");
        TextBox tbxCityName = (TextBox)row.FindControl("tbxCityName");
        TextBox tbxStateId = (TextBox)row.FindControl("tbxStateId");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string updateFields = "update tblCity set cityName=@cityName, stateId=@stateId where cityId=@cityId";
        try
        {
            SqlCommand cmd = new SqlCommand(updateFields, connect);
            cmd.Parameters.AddWithValue("@cityId", tbxCityId.Text);
            cmd.Parameters.AddWithValue("@cityName", tbxCityName.Text);
            cmd.Parameters.AddWithValue("@stateId", tbxStateId.Text);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
            BindData();
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
    }
    protected void GridViewCity_DeleteRow(object sender, GridViewDeleteEventArgs e)
    {
        Label lblCityId = (Label)GridViewCity.Rows[e.RowIndex].FindControl("lblCityId");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string deleteField = "delete from tblCity where cityId=@cityId";
        SqlCommand cmd = new SqlCommand(deleteField, connect);
        connect.Open();
        cmd.Parameters.AddWithValue("@cityId", lblCityId.Text);
        cmd.ExecuteNonQuery();
        connect.Close();
        BindData();
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}