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
        if (!IsPostBack)
            BindData();
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
        string cityId = ((TextBox)GridViewCity.FooterRow.FindControl("lblCityId")).Text;
        string cityName = ((TextBox)GridViewCity.FooterRow.FindControl("tbxCityName")).Text;
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string getFields = "insert into tblCity(cityId, cityName) values(@cityId, @cityName) select cityId, cityName from tblCity";
        connect.Open();
        SqlCommand cmd = new SqlCommand(getFields, connect);
        cmd.Parameters.Add("@cityId", cityId);
        cmd.Parameters.Add("@ContactName", cityName);
        BindData();
    }
    protected void GridViewCity_UpdateCity(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewCity.Rows[e.RowIndex];
        Label CityId = (Label)row.FindControl("lblCityId");
        TextBox tbxCityName = (TextBox)row.FindControl("tbxCityName");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string updateFields = "update tblCity set cityName=@cityName where cityId=@cityId";
        try
        {
            SqlCommand cmd = new SqlCommand(updateFields, connect);
            cmd.Parameters.AddWithValue("@cityId", CityId.Text);
            cmd.Parameters.AddWithValue("@cityName", tbxCityName.Text);
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
}