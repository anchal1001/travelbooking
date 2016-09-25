using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(Session["Login"]!="0")
        //    {
        //    Response.Redirect("UserHomePage.aspx");
        //}
    }
    private string Decrypt(string decryptedPassword)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] encriptBytes = Convert.FromBase64String(decryptedPassword);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(encriptBytes, 0, encriptBytes.Length);
                    cs.Close();
                }
                decryptedPassword = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return decryptedPassword;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        int temp;
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        connect.Open();
        string checkEmail = "select count(*) from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
        SqlCommand cmdEmail = new SqlCommand(checkEmail, connect);
        temp = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
        connect.Close();
        if (temp == 1)
        {
            connect.Open();
            string name = "select Name  from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            string regId = "select RegID from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            string checkPassword = "select PW from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            string checkRoleId = "select Category_Id from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            SqlCommand cmdPassword = new SqlCommand(checkPassword, connect);
            SqlCommand cmdRole = new SqlCommand(checkRoleId, connect);
            SqlCommand cmdName = new SqlCommand(name, connect);
            SqlCommand cmdRegId = new SqlCommand(regId, connect);
            string loginName = cmdName.ExecuteScalar().ToString();
            string password = cmdPassword.ExecuteScalar().ToString().Trim();
            string roleId = cmdRole.ExecuteScalar().ToString();
            string regID = cmdRegId.ExecuteScalar().ToString();
            string loginPassword = Decrypt(password);
            if (loginName != null)
            {
                Session["LoginEmail"] = tbxEnterEmail.Text;
                if (loginPassword == tbxEnterPassword.Text)
                {
                    if (dropRoles.SelectedValue.ToString() == roleId)
                    {
                        if (roleId == "1")
                        {
                            string approval = "select Approved from tblAdmin where RegID=regID";
                            SqlCommand cmdApprove = new SqlCommand(approval, connect);
                            string approved = cmdApprove.ExecuteScalar().ToString().Trim();
                            if (approved == "True")
                            {
                                Session["AdminLogin"] = loginName;
                                Session["Login"] = "1";
                                //Response.Write("Logged in as Admin");

                                Response.Redirect("AdminHome.aspx");
                                //Response.Redirect("admin.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Admin not approved')</script>");
                            }
                        }
                        else
                        {
                            Session["UserId"] = regID;
                            Session["UserLogin"] = loginName;
                            Session["Login"] = "1";
                            //Response.Write("Logged in as user");
                            Response.Redirect("UserHomePage.aspx");
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Incorrect Password');", true);
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Not Registered');", true);
        }
            connect.Close();

        }
    }