using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class Projects : System.Web.UI.Page
{
    public string firstVariable = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbDataReader MyReader;
        OleDbConnection myConnection = new OleDbConnection(AccessDataSource1.ConnectionString);
        OleDbCommand myCommand = new OleDbCommand(AccessDataSource1.SelectCommand);
        myCommand.Connection = myConnection;
        myCommand.Parameters.AddWithValue("?", Session["ProjectPDF"]);
        myConnection.Open();
        MyReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (MyReader.Read())
                            {
                                firstVariable = MyReader[0].ToString();
                    if (firstVariable == "")
                    Label1.Text = "No projects found";
                            }
                            myConnection.Close();
    }
}
