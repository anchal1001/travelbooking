using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class IfMany : System.Web.UI.Page
{
    Button btnApprove;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        int userId = Convert.ToInt32(Session["UserId"]);
        string checkEmail = "select count(*) from tblplanning where userId='" + userId + "'";
        SqlCommand cmdEmail = new SqlCommand(checkEmail, connect);
        connect.Open();
        int temp = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
        connect.Close();





        if (temp == 1)
        {
            Response.Redirect("Edit.aspx");
        }
        if (!IsPostBack)
            BindData();

    }
    protected void BindData()
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        try
        {
            //string getFields = "Select tblRegistration.RegID,tblRegistration.Name,tblRegistration.Email,tblRegistration.PW,tblRegistration.SecurityQuestion,tblRegistration.Answer,tblRegistration.Phone,tblRegistration.DOB,tblRegistration.City,tblAdmin.Approved FROM tblRegistration INNER JOIN tblAdmin ON tblRegistration.RegID=tblAdmin.RegID";
            string getFields = "Select tblPlanning.planID,tblPlanning.userId,tblPlanning.startPoint,tblPlanning.destination,tblPlanning.fromDate,tblPlanning.toDate,tblPlanning.modeId from tblPlanning INNER JOIN tblRegistration ON tblplanning.userId=tblRegistration.RegID";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewUserData.DataSource = ds;
            GridViewUserData.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            Response.Write("ERROR = " + ex.ToString());
        }
    }
    protected void GridViewUserData_EditRow(object sender, GridViewEditEventArgs e)
    {
        GridViewUserData.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void GridViewUserData_CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewUserData.EditIndex = -1;
        BindData();
    }
    protected void GridViewUserData_UpdateRow(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewUserData.Rows[e.RowIndex];
        Label planID = (Label)row.FindControl("lblplanID");
        Label userId = (Label)row.FindControl("lbluserId");
        TextBox tbxstartPoint = (TextBox)row.FindControl("tbxstartPoint");
        TextBox tbxdestination = (TextBox)row.FindControl("tbxdestination");
        TextBox tbxfromDate = (TextBox)row.FindControl("tbxfromDate");
        TextBox tbxtoDate = (TextBox)row.FindControl("tbxtoDate");
        TextBox tbxmodeId = (TextBox)row.FindControl("tbxmodeId");

        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        //string updateRegData = "UPDATE tblplanning set Name=@Name, Email=@Email, PW=@PW, SecurityQuestion=@SecurityQuestion, Answer=@Answer, Phone=@Phone, DOB=@DOB, City=@City where Category_Id=1";
        string updateRegData = "update tblPlanning SET startPoint=@startPoint,destination=@destination,fromDate=@fromDate,toDate=@toDate,modeId=@modeId,userId=@userId where planID=@planID";
        try
        {
            SqlCommand RegCmd = new SqlCommand(updateRegData, connect);
            RegCmd.Parameters.AddWithValue("@planID", planID.Text);
            RegCmd.Parameters.AddWithValue("@userId", userId.Text);
            RegCmd.Parameters.AddWithValue("@startPoint", tbxstartPoint.Text);
            RegCmd.Parameters.AddWithValue("@destination", tbxdestination.Text);
            RegCmd.Parameters.AddWithValue("@fromDate", tbxfromDate.Text);
            RegCmd.Parameters.AddWithValue("@toDate", tbxtoDate.Text);
            RegCmd.Parameters.AddWithValue("@modeId", tbxmodeId.Text);
            //RegCmd.Parameters.AddWithValue("@DOB", tbxDOB.Text);
            //RegCmd.Parameters.AddWithValue("@City", tbxCity.Text);

            connect.Open();
            RegCmd.ExecuteNonQuery();
            connect.Close();
            BindData();
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
    }
    protected void GridViewUserData_DeleteRow(object sender, GridViewDeleteEventArgs e)
    {
        Label lblplanID = (Label)GridViewUserData.Rows[e.RowIndex].FindControl("lblplanID");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string deleteField = "delete from tblplanning where planID=@planID";
        SqlCommand cmd = new SqlCommand(deleteField, connect);
        connect.Open();
        cmd.Parameters.AddWithValue("@planID", lblplanID.Text);
        cmd.ExecuteNonQuery();
        connect.Close();
        BindData();



        connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        int userId = Convert.ToInt32(Session["UserId"]);
        string checkEmail = "select count(*) from tblplanning where userId='" + userId + "'";
        SqlCommand cmdEmail = new SqlCommand(checkEmail, connect);
        connect.Open();
        int temp = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
        connect.Close();





        if (temp == 0)
        {
            Response.Redirect("Plan.aspx");
        }
    }
}