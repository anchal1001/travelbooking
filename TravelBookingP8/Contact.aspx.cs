using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendMail(object sender,EventArgs e)
    {
        try
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(tbxYourMail.Text, "Senders name");

            msg.To.Add(new MailAddress("divyanshushukla1997@gmail.com")); //my mail
            msg.Subject = tbxSubject.Text+ "  :  "+ tbxYourMail.Text;
            msg.Body = tbxBody.Text;
            msg.IsBodyHtml = true;
            //msg.Attachments.Add(new Attachment(@"C:\Users\win10\Documents\Visual Studio 2015\WebSites\PartyPlanner\App_Data"));
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("divyanshushukla1997@gmail.com", "28Mnids@97");
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Send(msg);
            /*lblInfo.Visible = true;*/    // Take a look 
            //lblInfo.Text = "email send successfully";

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email Sent');", true);

            msg.From = new MailAddress("divyanshushukla1997@gmail.com", "Senders name");

            msg.To.Add(new MailAddress(tbxYourMail.Text)); //my mail
            msg.Subject = "Thank You";
            msg.Body = "Thank you very much for your suggestion and ideas we would like to be linked with you countinuously";
            msg.IsBodyHtml = true;
            //msg.Attachments.Add(new Attachment(@"C:\Users\win10\Documents\Visual Studio 2015\WebSites\PartyPlanner\App_Data"));
            
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("divyanshushukla1997@gmail.com", "28Mnids@97");
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Send(msg);


        }
        catch (Exception except)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Some Error Occured');", true);
        }
    }
}