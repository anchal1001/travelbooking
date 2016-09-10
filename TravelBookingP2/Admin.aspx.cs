using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnAdminRegister_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection connectAdmin = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connectAdmin.Open();
            string getFields = "insert into tblAdmin(Experience, Qualification) values(@experience, @qualification)";
            SqlCommand cmd = new SqlCommand(getFields, connectAdmin);
            cmd.Parameters.AddWithValue("@experience", tbxExperience.Text);
            cmd.Parameters.AddWithValue("@qualification", tbxQualification.Text);
            cmd.ExecuteNonQuery();
            connectAdmin.Close();
        }
        catch(Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }

    }
}