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
public partial class AdminData : System.Web.UI.Page
{
    Button btnApprove;
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
            string getFields = "Select tblRegistration.RegID,tblRegistration.Name,tblRegistration.Email,tblRegistration.PW,tblRegistration.SecurityQuestion,tblRegistration.Answer,tblRegistration.Phone,tblRegistration.DOB,tblRegistration.City,tblAdmin.Approved FROM tblRegistration INNER JOIN tblAdmin ON tblRegistration.RegID=tblAdmin.RegID";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridViewAdminData.DataSource = ds;
            GridViewAdminData.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            //Response.Write("ERROR = " + ex.ToString());
        }
    }
    protected void GridViewAdminData_EditRow(object sender, GridViewEditEventArgs e)
    {
        GridViewAdminData.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void GridViewAdminData_CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewAdminData.EditIndex = -1;
        BindData();
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
    protected void GridViewAdminData_UpdateRow(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewAdminData.Rows[e.RowIndex];
        Label RegId = (Label)row.FindControl("lblRegId");
        TextBox tbxName = (TextBox)row.FindControl("tbxName");
        TextBox tbxEmail = (TextBox)row.FindControl("tbxEmail");
        Label tbxPassword = (Label)row.FindControl("lblPassword");
        TextBox tbxQues = (TextBox)row.FindControl("tbxQues");
        TextBox tbxAns = (TextBox)row.FindControl("tbxAns");
        TextBox tbxPhone = (TextBox)row.FindControl("tbxPhone");
        TextBox tbxDOB = (TextBox)row.FindControl("tbxDOB");
        TextBox tbxCity = (TextBox)row.FindControl("tbxCity");
        TextBox tbxApprove = (TextBox)row.FindControl("tbxApprove");
        TextBox tbxNewPassword = (TextBox)row.FindControl("tbxNewPassword");
        string newPassword = Encrypt(tbxNewPassword.Text);
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string updateRegData = "UPDATE tblRegistration set Name=@Name, Email=@Email, PW=@PW, SecurityQuestion=@SecurityQuestion, Answer=@Answer, Phone=@Phone, DOB=@DOB, City=@City where RegID=@RegId";

        try
        {
            SqlCommand RegCmd = new SqlCommand(updateRegData, connect);
            RegCmd.Parameters.AddWithValue("@RegId", RegId.Text);
            RegCmd.Parameters.AddWithValue("@Name", tbxName.Text);
            RegCmd.Parameters.AddWithValue("@Email", tbxEmail.Text);
            RegCmd.Parameters.AddWithValue("@PW", newPassword);
            RegCmd.Parameters.AddWithValue("@SecurityQuestion", tbxQues.Text);
            RegCmd.Parameters.AddWithValue("@Answer", tbxAns.Text);
            RegCmd.Parameters.AddWithValue("@Phone", tbxPhone.Text);
            RegCmd.Parameters.AddWithValue("@DOB", tbxDOB.Text);
            RegCmd.Parameters.AddWithValue("@City", tbxCity.Text);

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
    protected void GridViewAdminData_DeleteRow(object sender, GridViewDeleteEventArgs e)
    {
        Label lblRegId = (Label)GridViewAdminData.Rows[e.RowIndex].FindControl("lblRegID");
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string deleteField = "delete from tblRegistration where RegID=@RegID";
        SqlCommand cmd = new SqlCommand(deleteField, connect);
        connect.Open();
        cmd.Parameters.AddWithValue("@RegID", lblRegId.Text);
        cmd.ExecuteNonQuery();
        connect.Close();
        BindData();
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string isVerified = "update tblAdmin set Approved=@approved where RegID=@RegID";
        try
        {
            SqlCommand cmd = new SqlCommand(isVerified, connect);
            if (btnApprove.Text == "Add Admin")
            {
                btnApprove.Text = "Remove Admin";
               //lblApprove.Text = "True";
                // cmd.Parameters.AddWithValue(@approved, tbxApprove.Text);
                connect.Open();
                cmd.ExecuteNonQuery();
                connect.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["AdminLogin"] = null;
        Response.Redirect("Login.aspx");
    }
}
