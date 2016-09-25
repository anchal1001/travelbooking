using System;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;


public partial class Security : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSendEmail_Click(object sender, EventArgs e)
    {

        try
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            string getSecurityQuestion = "select SecurityQuestion from tblRegistration where Email='" + tbxEmail.Text + "'";
            string getAnswer = "select Answer from tblRegistration where Email ='" + tbxEmail.Text + "'";
            string getpass_word = "select PW from tblRegistration where Email ='" + tbxEmail.Text + "'";
            string getname = "select Name from tblRegistration where Email ='" + tbxEmail.Text + "'";
            SqlCommand cmdSecurityQuestion = new SqlCommand(getSecurityQuestion, connect);
            SqlCommand cmdAnswer = new SqlCommand(getAnswer, connect);
            SqlCommand cmdpass_word = new SqlCommand(getpass_word, connect);
            SqlCommand cmdname = new SqlCommand(getname, connect);
            string question = cmdSecurityQuestion.ExecuteScalar().ToString();
            string answer = cmdAnswer.ExecuteScalar().ToString();
            string pass_word = cmdpass_word.ExecuteScalar().ToString();
            string name = cmdname.ExecuteScalar().ToString();
            //lblSecQues.Text = question;
            //lblAns.Text = answer;
            if (question != dropQues.SelectedItem.ToString() || answer != tbxAns.Text)
            {
                lblInfo.Text = "Incorrect Question-Answer Combination!!";
            }
            else
            {
                lblInfo.Text = "Sending Mail ";
                cmdSecurityQuestion.ExecuteNonQuery();
                cmdAnswer.ExecuteNonQuery();
                connect.Close();
                string activationCode = Guid.NewGuid().ToString();
                using (MailMessage mm = new MailMessage("divyanshushukla1997@gmail.com", tbxEmail.Text))
                {
                    mm.Subject = "Forgot Password";
                    string body = "Hello " + name + ",  " + "Forgot Password " + "Your original Password was : " + pass_word + "";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("divyanshushukla1997@gmail.com", "28Mnids@97");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    lblInfo.Text = "Sending Mail ";
                    SentMail(sender, e);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error : " + ex.Message);
        }
    }

    protected void SentMail(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void dropQues_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}