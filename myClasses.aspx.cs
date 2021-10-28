using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;

public partial class myClasses : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ProjectPDF"] = DropDownList1.SelectedItem.Value.ToString();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("addClasses.aspx");
    }
}