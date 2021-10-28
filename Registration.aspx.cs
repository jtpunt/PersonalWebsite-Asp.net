using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.InsertCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@email", txtEmail.Text);
        myCommand.Parameters.AddWithValue("@Password", txtPassword.Text);
        myCommand.Parameters.AddWithValue("@FName", txtFName.Text);
        myCommand.Parameters.AddWithValue("@LName", txtLName.Text);
        myCommand.Parameters.AddWithValue("@YoB", txtYear.Text);
        SqlDataReader myReader;
        myConnection.Open();
        myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        myConnection.Close();

        Response.Redirect("Login.aspx");


    }
}