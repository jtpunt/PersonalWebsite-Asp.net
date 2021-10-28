using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int NumberOfDays;
        DateTime GradDate = Convert.ToDateTime("12/12/2015");
        edu.unt.itds.atlas.DaysUntil ws2 = new edu.unt.itds.atlas.DaysUntil();
        NumberOfDays = ws2.CallDaysUntil(GradDate);
        lblDays.Text = ("There are "
                    + (NumberOfDays.ToString() + " Days until Graduation"));
    }
}