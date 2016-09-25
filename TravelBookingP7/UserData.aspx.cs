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
    private string Encrypt(string enteredPassword)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(enteredPassword);
        try
        {
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    enteredPassword = Convert.ToBase64String(ms.ToArray());
                }
            }

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
        return enteredPassword;
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
        Label tbxPassword = (Label)row.FindControl("lblPassword");
        TextBox tbxQues = (TextBox)row.FindControl("tbxQues");
        TextBox tbxAns = (TextBox)row.FindControl("tbxAns");
        TextBox tbxRole = (TextBox)row.FindControl("tbxRole");
        TextBox tbxPhone = (TextBox)row.FindControl("tbxPhone");
        TextBox tbxDOB = (TextBox)row.FindControl("tbxDOB");
        TextBox tbxCity = (TextBox)row.FindControl("tbxCity");
        TextBox tbxNewPassword = (TextBox)row.FindControl("tbxNewPassword");
        string newPassword = Encrypt(tbxNewPassword.Text);
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string updateFields = "update tblRegistration set Name=@Name, Email=@Email, PW=@PW, SecurityQuestion=@SecurityQuestion, Answer=@Answer, Category_Id=@Category_Id, Phone=@Phone, DOB=@DOB, City=@City where RegID=@RegId";
        try
        {
            SqlCommand cmd = new SqlCommand(updateFields, connect);
            cmd.Parameters.AddWithValue("@RegId", RegId.Text);
            cmd.Parameters.AddWithValue("@Name", tbxName.Text);
            cmd.Parameters.AddWithValue("@Email", tbxEmail.Text);
            cmd.Parameters.AddWithValue("@PW", newPassword);
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

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}
