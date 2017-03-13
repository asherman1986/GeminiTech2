using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnGetQuote_Click(object sender, EventArgs e)
    {
        try
        {
            SendMail();
        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType, "Alert", "alert(" + ex.Message + ")", true);   
        }
        finally
        {
            //UP1.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowConfirm", "confirm()", true);
        }
    }

    protected void SendMail()
    {
        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        message.To.Add("asherman@gemini-tech.net");
        //message.Bcc.Add("asherman1986@gmail.com");
        message.Subject = "Quote Request from " + this.txtName.Text;
        message.From = new System.Net.Mail.MailAddress("postmaster@gemini-tech.net");
        message.Body =
            "Message from:\t" + this.txtName.Text + "\n" +
            "Email Address:\t" + this.txtEmail.Text + "\n" +
            "Services Requested: \n" +
            (this.DDL1.SelectedItem.Text) + '\n' +
            "Project Details: \n" +
            "\t" + this.txtDetails.Text;
        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("mail.gemini-tech.net");
        smtp.Port = 8889;
        System.Net.NetworkCredential Credentials = new System.Net.NetworkCredential("postmaster@gemini-tech.net", "T@hd2d62");
        smtp.Credentials = Credentials;
        smtp.Send(message);

    }

    public void ClearForm()
    {
        this.txtName.Text = "";
        this.txtEmail.Text = "";
        this.txtDetails.Text = "";
    }
}