using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
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
            string checkPassword = "select PW from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            string checkRoleId = "select Category_Id from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            SqlCommand cmdPassword = new SqlCommand(checkPassword, connect);
            SqlCommand cmdRole = new SqlCommand(checkRoleId, connect);
            string password = cmdPassword.ExecuteScalar().ToString();
            string roleId = cmdRole.ExecuteScalar().ToString();
            if (password == tbxEnterPassword.Text)
            {
                if (dropRoles.SelectedValue.ToString() == roleId)
                {
                    if (roleId == "1")
                    {
                        Response.Write("Logged in as admin");
                        //Response.Redirect("adminHome.aspx");
                    }
                    else
                    {
                        Response.Write("Logged in as user");
                        //Response.Redirect("userHome.aspx");
                    }
                }
            }
            else
            {
                Response.Write("Incorrect Password");
            }
            connect.Close();
        }
    }
}