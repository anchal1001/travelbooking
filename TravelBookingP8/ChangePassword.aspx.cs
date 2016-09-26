using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

using System.IO;
using System.Text;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
       
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string change = "update tblRegistration SET PW = @pw WHERE Email=@email";
        //SqlCommand cmd = new SqlCommand(change, connect);
        //connect.Open();
        //cmd.Parameters.AddWithValue("@pw", tbxChangedPassword.Text);
        //cmd.Parameters.AddWithValue("@email", tbxEmail.Text);
        //connect.Close();
        //System.Threading.Thread.Sleep(3000);
        string password=Encrypt(tbxChangedPassword.Text);
        try
        {
            SqlCommand cmd = new SqlCommand(change, connect);
            cmd.Parameters.AddWithValue("@email", tbxEmail.Text);
            cmd.Parameters.AddWithValue("@PW", password);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
            Session["LoginId"] = password;
            Response.Redirect("~/Personals.aspx");

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());

        }
    }
}