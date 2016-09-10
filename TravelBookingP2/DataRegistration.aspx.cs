using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        try
        {
               
            string getFields = "SELECT * FROM tblRegistration";
            SqlCommand cmd = new SqlCommand(getFields, connect);
            connect.Open();
            GridViewData.DataSource = cmd.ExecuteReader();
            GridViewData.DataBind();
            connect.Close();
        }
        catch (Exception ex)
        {
            //Response.Write("ERROR = " + ex.ToString());
        }
    }
}