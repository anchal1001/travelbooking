using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        try
        {
            if (tbxPassword.Text == tbxConfirmPassword.Text)
            {
                SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                connect.Open();
                string getFields = "insert into tblRegistration(Name,Email,PW,SecurityQuestion,Answer,Category_Id,Phone,DOB,ZIP) values(@name, @email, @pw, @question, @answer, @category, @phone, @dob, @zip)";
                SqlCommand cmd = new SqlCommand(getFields, connect);
                cmd.Parameters.AddWithValue("@name", tbxName.Text);
                cmd.Parameters.AddWithValue("@email", tbxEmail.Text);
                cmd.Parameters.AddWithValue("@pw", tbxPassword.Text);
                cmd.Parameters.AddWithValue("@question", dropQues.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@answer", tbxAns.Text);
                cmd.Parameters.AddWithValue("@category", dropRoles.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@phone", tbxPhone.Text);
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text);
                cmd.Parameters.AddWithValue("@zip", tbxCity.Text);
                cmd.ExecuteNonQuery();
                //Response.Redirect("databaseManager.aspx");
                connect.Close();
            }
            else
                Response.Write("Passwords do not match");
            
        }
        catch(Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }
    }
}