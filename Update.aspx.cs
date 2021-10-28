using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        // Use the session state object variable to retrieve the user's record
        SqlDataReader MyReader;
        SqlConnection myConnection = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand myCommand = new SqlCommand(SqlDataSource1.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("@email", Session["UserEmail"]);
        myConnection.Open();
        try
        {
            // populate the labels if the retrieve is successful
            MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            while (MyReader.Read())
            {
                lblFirstName.Text = MyReader.GetString(2).Trim();
                lblLastName.Text = MyReader.GetString(3).Trim();
                lblPassword.Text = MyReader.GetString(1).Trim();
                lblEmail.Text = MyReader.GetString(0).Trim();
                lblYoB.Text = Convert.ToString(MyReader.GetInt32(4));
            }
        }
        catch (Exception)
        {
            // what to do if the retrieval fails
            Response.Redirect("login.aspx");
        }
        myConnection.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string FirstName;
        string LastName;
        // Has user changed email (used as primary key)?
        if (((txtEmail.Text.Trim() != "")
                    && (lblEmail.Text.Trim() != txtEmail.Text.Trim())))
        {
            SqlConnection MyConnection = new SqlConnection(SqlDataSource1.ConnectionString);
            // Destroy the current record with a SQL DELETE using old email as key
            SqlCommand MyCommand = new SqlCommand(SqlDataSource1.DeleteCommand);
            MyCommand.Connection = MyConnection;
            MyCommand.Parameters.AddWithValue("@Email", lblEmail.Text);
            SqlDataReader MyReader;
            MyConnection.Open();
            MyReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);
            MyConnection.Close();
            // Now start building a completely new record
            SqlCommand MyCommand2 = new SqlCommand(SqlDataSource1.InsertCommand);
            MyCommand2.Connection = MyConnection;
            MyCommand2.Parameters.AddWithValue("@email", txtEmail.Text);
            // Password changed?
            if ((txtPassword.Text == ""))
            {
                MyCommand2.Parameters.AddWithValue("@Password", lblPassword.Text);
            }
            else
            {
                MyCommand2.Parameters.AddWithValue("@Password", txtPassword.Text);
            }
            // First name changed?
            if ((txtFName.Text == ""))
            {
                MyCommand2.Parameters.AddWithValue("@FName", lblFirstName.Text);
                FirstName = lblFirstName.Text.Trim();
            }
            else
            {
                MyCommand2.Parameters.AddWithValue("@FName", txtFName.Text);
                FirstName = txtFName.Text.Trim();
            }
            // Last name changed?
            if ((txtLName.Text == ""))
            {
                MyCommand2.Parameters.AddWithValue("@LName", lblLastName.Text);
                LastName = lblLastName.Text.Trim();
            }
            else
            {
                MyCommand2.Parameters.AddWithValue("@LName", txtLName.Text);
                LastName = txtLName.Text.Trim();
            }
            // Year of birth changed?
            if ((txtYear.Text == ""))
            {
                MyCommand2.Parameters.AddWithValue("@YoB", Convert.ToInt32(lblYoB.Text));
            }
            else
            {
                MyCommand2.Parameters.AddWithValue("@YoB", Convert.ToInt32(txtYear.Text));
            }
            SqlDataReader MyReader2;
            MyConnection.Open();
            MyReader2 = MyCommand2.ExecuteReader(CommandBehavior.CloseConnection);
            // Update both session state object variables
            Session["UserEmail"] = txtEmail.Text;
            Session["UserName"] = (FirstName + (" " + LastName));
        }
        else
        {
            // What to do if user keeps email but makes any other change(s)
            SqlConnection MyConnection = new SqlConnection(SqlDataSource1.ConnectionString);
            // change the current record by using a SQL UPDATE
            SqlCommand MyCommand = new SqlCommand(SqlDataSource1.UpdateCommand);
            MyCommand.Connection = MyConnection;
            // If txtEmail.Text() = "" Then
            MyCommand.Parameters.AddWithValue("@email", lblEmail.Text);
            // Else
            // MyCommand.Parameters.AddWithValue("@email", txtEmail.Text)
            // End If
            // Password changed?
            if ((txtPassword.Text == ""))
            {
                MyCommand.Parameters.AddWithValue("@Password", lblPassword.Text);
            }
            else
            {
                MyCommand.Parameters.AddWithValue("@Password", txtPassword.Text);
            }
            // First name changed?
            if ((txtFName.Text == ""))
            {
                MyCommand.Parameters.AddWithValue("@FName", lblFirstName.Text);
                FirstName = lblFirstName.Text.Trim();
            }
            else
            {
                MyCommand.Parameters.AddWithValue("@FName", txtFName.Text);
                FirstName = txtFName.Text.Trim();
            }
            // Last name changed?
            if ((txtLName.Text == ""))
            {
                MyCommand.Parameters.AddWithValue("@LName", lblLastName.Text);
                LastName = lblLastName.Text.Trim();
            }
            else
            {
                MyCommand.Parameters.AddWithValue("@LName", txtLName.Text);
                LastName = txtLName.Text.Trim();
            }
            // Year of birth changed?
            if ((txtYear.Text == ""))
            {
                MyCommand.Parameters.AddWithValue("@YoB", Convert.ToInt32(lblYoB.Text));
            }
            else
            {
                MyCommand.Parameters.AddWithValue("@YoB", Convert.ToInt32(txtYear.Text));
            }
            // Write the record
            SqlDataReader MyReader;
            MyConnection.Open();
            MyReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);
            MyConnection.Close();
            // Update session state object variable in case changed
            Session["UserName"] = (FirstName + (" " + LastName));
        }
        Response.Redirect("Welcome.aspx");
        // either way, redirect
    }
}