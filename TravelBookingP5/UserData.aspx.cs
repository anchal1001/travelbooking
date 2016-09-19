using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
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

            string getFields = "SELECT * FROM tblRegistration where Category_Id=2";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            GridViewData.DataSource = cmd.ExecuteReader();
            GridViewData.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            //Response.Write("ERROR = " + ex.ToString());
        }
    }


    protected void GridViewData_EditRow(object sender, GridViewEditEventArgs e)
    {
        GridViewData.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void GridViewData_CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewData.EditIndex = -1;
        BindData();
    }


    protected void GridViewData_UpdateRow(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewData.Rows[e.RowIndex];
        Label RegId = (Label)row.FindControl("lblRegId");
        TextBox tbxName = (TextBox)row.FindControl("tbxName");
        TextBox tbxEmail = (TextBox)row.FindControl("tbxEmail");
        TextBox tbxPassword = (TextBox)row.FindControl("tbxPassword");
        TextBox tbxQues = (TextBox)row.FindControl("tbxQues");
        TextBox tbxAns = (TextBox)row.FindControl("tbxAns");
        TextBox tbxRole = (TextBox)row.FindControl("tbxRole");
        TextBox tbxPhone = (TextBox)row.FindControl("tbxPhone");
        TextBox tbxDOB = (TextBox)row.FindControl("tbxDOB");
        TextBox tbxCity = (TextBox)row.FindControl("tbxCity");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string updateFields = "update tblRegistration set Name=@Name, Email=@Email, PW=@PW, SecurityQuestion=@SecurityQuestion, Answer=@Answer, Category_Id=@Category_Id, Phone=@Phone, DOB=@DOB, City=@City where Category_Id=2";
        try
        {
            SqlCommand cmd = new SqlCommand(updateFields, connect);
            cmd.Parameters.AddWithValue("@RegId", RegId.Text);
            cmd.Parameters.AddWithValue("@Name", tbxName.Text);
            cmd.Parameters.AddWithValue("@Email", tbxEmail.Text);
            cmd.Parameters.AddWithValue("@PW", tbxPassword.Text);
            cmd.Parameters.AddWithValue("@SecurityQuestion", tbxQues.Text);
            cmd.Parameters.AddWithValue("@Answer", tbxAns.Text);
            cmd.Parameters.AddWithValue("@Category_Id", tbxRole.Text);
            cmd.Parameters.AddWithValue("@Phone", tbxPhone.Text);
            cmd.Parameters.AddWithValue("@DOB", tbxDOB.Text);
            cmd.Parameters.AddWithValue("@City", tbxCity.Text);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
            BindData();
        }
        catch(Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
    }


    protected void GridViewData_DeleteRow(object sender, GridViewDeleteEventArgs e)
    {
        Label lblRegId = (Label)GridViewData.Rows[e.RowIndex].FindControl("lblRegID");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string deleteField = "delete from tblRegistration where RegID=@RegID";
        SqlCommand cmd = new SqlCommand(deleteField, connect);
        connect.Open();
        cmd.Parameters.AddWithValue("@RegID", lblRegId.Text);
        cmd.ExecuteNonQuery();
        connect.Close();
        BindData();
    }
}
