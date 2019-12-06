using FinalProject.UI.MVC.Models;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace FinalProject.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (ModelState.IsValid)
            {
                //email message we receive
                string message = $"Email from {cvm.Name} <br/>Email Address: {cvm.Email}<br/>Message:<br/>{cvm.Message}";

                //what sends the email
                MailMessage mm = new MailMessage("admin@rachelpunches.com", "aoffleash@gmail.com", null, message);

                //mail message properties
                //allow html formatting in email
                mm.IsBodyHtml = true;
                //high priority
                mm.Priority = MailPriority.High;
                //respond to sender's email
                mm.ReplyToList.Add(cvm.Email);

                //info from host - allow email to be sent
                SmtpClient client = new SmtpClient("mail.rachelpunches.com");
                //client credentials
                client.Credentials = new NetworkCredential("admin@rachelpunches.com", "Optimus!!11");

                // try/catch
                try
                {
                    client.Send(mm);
                }
                catch (Exception ex)
                {
                    ViewBag.CustomerMessage = $"We are sorry.  Your request could not be completed at this time.  Please try again later.<br/>Error Message: <br/>{ex.StackTrace}";
                    return View(cvm);
                }
                //return confirmation to user
                return View("EmailConfirmation", cvm);
            }
            return View(cvm);
        }
    }
}
