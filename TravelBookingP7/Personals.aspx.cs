using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Personals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            //string checkEmail = "select count(*) from tblRegistration where Email='" + tbxLoginEmail.Text + "'";
            lblNameAns.Text = Session["LoginEmail"].ToString();
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


            lblNameAns.Text = name;
            lblEmailAns.Text = Session["LoginEmail"].ToString();
            lblPWAns.Text = password;
            lblSecurityQuestionAns.Text = SecurityQuestion;
            lblAnswerAns.Text = Answer;
            lblPhoneAns.Text = Phone;
            lblCategory_IdAns.Text = Category;

            connect.Close();
        }
        catch(Exception except)
        {
            Response.Write("Error :- "+except.Message);
        }

    }
}