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

public partial class addClasses : System.Web.UI.Page
{
    String savePathProject = @"D:\OneDrive\School\BCIS 4720\WebsiteEmployers\Documents\Project\";
    String savePathSyllabus = @"D:\OneDrive\School\BCIS 4720\WebsiteEmployers\Documents\Syllabus\";
    public string firstVariable = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbDataReader MyReader;
        OleDbConnection myConnection1 = new OleDbConnection();
        myConnection1.ConnectionString = @"PRovider=Microsoft.ACE.OLEDB.12.0;" +
        @"Data Source = D:\OneDrive\School\BCIS 4720\WebsiteEmployers\classes db.accdb";

        String myQuery3 = "SELECT MAX(Prof_ID) + 1 FROM Professors";
        OleDbCommand myCommand1 = new OleDbCommand(myQuery3, myConnection1);
        myCommand1.Connection = myConnection1;
        myConnection1.Open();
        myCommand1.ExecuteNonQuery();
        MyReader = myCommand1.ExecuteReader(CommandBehavior.CloseConnection);
        while (MyReader.Read())
        {
            firstVariable = MyReader[0].ToString();
            lblMessage.Text = firstVariable;
            if (firstVariable == "")
                lblMessage.Text = "No professors found";
        }
        myConnection1.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            // Append the name of the file to upload to the path.
            savePathSyllabus += FileUpload1.FileName;
            // Call the SaveAs method to save the 
            // uploaded file to the specified path.
            // This example does not perform all
            // the necessary error checking.               
            // If a file with the same name
            // already exists in the specified path,  
            // the uploaded file overwrites it.
            FileUpload1.SaveAs(savePathSyllabus);
        }
        else
        {
            lblMessage.Text = "Error on syllabus upload";
        }

        if (FileUpload2.HasFile)
        {
            savePathProject += FileUpload2.FileName;
            FileUpload2.SaveAs(savePathProject);
        }
        else
        {
            lblMessage.Text = "Error on project upload";
        }

        OleDbConnection myConnection = new OleDbConnection();
        myConnection.ConnectionString = @"PRovider=Microsoft.ACE.OLEDB.12.0;" +
            @"Data Source = D:\OneDrive\School\BCIS 4720\WebsiteEmployers\classes db.accdb";

        try
        {
            myConnection.Open();
            String pLName = txtProfLName.Text.ToString();
            String pFName = txtProfFName.Text.ToString();
            String classID = txtClassID.Text.ToString();
            String className = txtClassName.Text.ToString();
            String classDescription = txtClassDesc.Text.ToString();
            String semesterTaken = txtSemesterTaken.Text.ToString();
            String origSyllabusFileName = FileUpload1.FileName.ToString();
            String origProjectFileName = FileUpload2.FileName.ToString();
            String FinalGrade = txtFinalGrade.Text.ToString();
            String myQuery = "INSERT INTO Professors(Prof_ID, Prof_LName, Prof_FName)VALUES('"+firstVariable+"','"+pLName+"','"+pFName+ "')";
            String myQuery1 = "INSERT INTO Classes(Class_ID, Class_Name, Class_Description, Semester_Taken, Prof_ID, SyllabusFilePath, ProjectFile, FinalGrade)VALUES('" + classID + "','" + className + "','" + classDescription + "','"+ semesterTaken + "','"+ firstVariable + "','"+ origSyllabusFileName + "','"+ origProjectFileName + "','"+ FinalGrade + "')";
            OleDbCommand cmd = new OleDbCommand(myQuery, myConnection);
            OleDbCommand cmd1 = new OleDbCommand(myQuery1, myConnection);
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();

            lblMessage.Text = "Data saved successfuly...!";
        }
        catch (Exception ex)
        {
            lblMessage.Text = ("Failed due to" + ex.Message);
        }
        finally
        {
            myConnection.Close();
        }
    }
 }
