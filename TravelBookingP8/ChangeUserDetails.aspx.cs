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

public partial class ChangeUserDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null && Session["AdminLogin"] == null)
        {
            Response.Redirect("Home.aspx");
        }
        if (!IsPostBack)
            {
                try
                {
                    SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    connect.Open();
                    
                    tbxNameAns.Text = Session["LoginEmail"].ToString();

                    string checkname = "select Name from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkpasssword = "select PW from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkcategory = "select Category_Id from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkSecurityQuestion = "select SecurityQuestion from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkAnswer = "select Answer from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkPhone = "select Phone from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";

                    string checkDOB = "select DOB from tblRegistration where Email='" + Session["LoginEmail"].ToString() + "'";


                    SqlCommand cmdname = new SqlCommand(checkname, connect);

                    SqlCommand cmdpassword = new SqlCommand(checkpasssword, connect);

                    SqlCommand cmdCategory = new SqlCommand(checkcategory, connect);

                    SqlCommand cmdSecurityQuestion = new SqlCommand(checkSecurityQuestion, connect);

                    SqlCommand cmdAnswer = new SqlCommand(checkAnswer, connect);

                    SqlCommand cmdPhone = new SqlCommand(checkPhone, connect);

                    SqlCommand cmdDOB = new SqlCommand(checkDOB, connect);

                    cmdname.ExecuteNonQuery();

                    cmdpassword.ExecuteNonQuery();

                    cmdCategory.ExecuteNonQuery();

                    cmdSecurityQuestion.ExecuteNonQuery();

                    cmdAnswer.ExecuteNonQuery();

                    cmdPhone.ExecuteNonQuery();

                    cmdDOB.ExecuteNonQuery();

                    string password = cmdpassword.ExecuteScalar().ToString();

                    string Category = cmdCategory.ExecuteScalar().ToString();

                    string SecurityQuestion = cmdSecurityQuestion.ExecuteScalar().ToString();

                    string Answer = cmdAnswer.ExecuteScalar().ToString();

                    string Phone = cmdPhone.ExecuteScalar().ToString();

                    string DOB = cmdDOB.ExecuteScalar().ToString();

                    string name = cmdname.ExecuteScalar().ToString();


                    tbxNameAns.Text = name;

                    tbxEmailAns.Text = Session["LoginEmail"].ToString();

                string decryptedPassword = decrypt(password);
                    lblPWAns.Text = decryptedPassword;

                    dropQues.SelectedIndex = Convert.ToInt32(SecurityQuestion);

                    tbxAnswerAns.Text = Answer;

                    tbxPhoneAns.Text = Phone;

                if (Convert.ToInt32(Category) == 1)
                {
                    lblCategory_IdAns.Text = "Admin";
                }
                else
                {
                    lblCategory_IdAns.Text = "User";
                }
                connect.Close();
                }
                catch (Exception except)
                {
                    Response.Write("Error :- " + except.Message);
                }
            }
    }



    private string decrypt(string decryptedPassword)
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


    protected void checking(object sender,EventArgs e)
    {

        if (Convert.ToInt64(tbxPhoneAns.Text)< 7777777777 || Convert.ToInt64(tbxPhoneAns.Text) > 9999999999)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Wrong Phone Number');", true);
        }
        else
        {

            changeDetails(sender, e);
        }
    }
    protected void changeDetails(object sender,EventArgs e)
    {

        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string change = "update tblRegistration SET Name=@Name,Email=@Email,SecurityQuestion=@SecurityQuestion,Answer=@Answer,Phone=@Phone WHERE RegID=@userId";
        try
        {
            SqlCommand cmd = new SqlCommand(change, connect);
            cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["UserId"]));
            cmd.Parameters.AddWithValue("@Name", tbxNameAns.Text);
            cmd.Parameters.AddWithValue("@Email", tbxEmailAns.Text);
            cmd.Parameters.AddWithValue("@SecurityQuestion", dropQues.SelectedIndex);
            cmd.Parameters.AddWithValue("@Answer", tbxAnswerAns.Text);
            
            cmd.Parameters.AddWithValue("@Phone", tbxPhoneAns.Text);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
            Response.Redirect("~/Personals.aspx");

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());

        }


    }
}