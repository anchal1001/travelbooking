using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        try
        {
                string getFields = "insert into tblRegistration(Name,Email,PW,SecurityQuestion,Answer,Category_Id,Phone,DOB,City) values(@name, @email, @pw, @question, @answer, @category, @phone, @dob, @city)";
                SqlCommand cmd = new SqlCommand(getFields, connect);
                connect.Open();
                cmd.Parameters.AddWithValue("@name", tbxName.Text);
                cmd.Parameters.AddWithValue("@email", tbxEmail.Text);
                cmd.Parameters.AddWithValue("@pw", tbxPassword.Text);
                cmd.Parameters.AddWithValue("@question", dropQues.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@answer", tbxAns.Text);
                cmd.Parameters.AddWithValue("@category", dropRoles.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@phone", tbxPhone.Text);
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text);
                cmd.Parameters.AddWithValue("@city", tbxCity.Text);
                cmd.ExecuteNonQuery();
                connect.Close();
                string message;
            if (dropRoles.SelectedValue.ToString() == "1")
            {
                Response.Redirect("Login.aspx");
            }
            else if (dropRoles.SelectedValue.ToString() == "2")
            {
                message = "Registration successful. Confirmation email sent.";
                SendActivationEmail();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                Response.Redirect("Login.aspx");
            }
        }
        catch(Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }
    }
     private void SendActivationEmail()
     {
        try
        {
            using (MailMessage mm = new MailMessage("anchal.chaudhary329@gmail.com", tbxEmail.Text))
            {
                mm.Subject = "Account Activation";
                string body = "Hello " + tbxName.Text.Trim() + ", your account has been activated. Your login id is " + tbxEmail.Text + " and password is " + tbxPassword.Text;
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("anchal.chaudhary329@gmail.com", "Google.Anchal");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
        catch(Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
    }
}