using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net.Mail;

namespace FollowMe_Batch
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Console.ReadLine();
            FollowMeDBEntities fmEF = new FollowMeDBEntities();
            string massageLostDetailes = "";
            foreach (var order in fmEF.Order.ToList())
            {
                string firstEPC = fmEF.OrderDetails.Where(x => x.OrderId == order.OrderId).First().FirstEPC;
                string lastEPC = fmEF.OrderDetails.Where(x => x.OrderId == order.OrderId).First().LastEPC;
                var ReadingForOrderId = fmEF.ReadingForOrderIdSelect(firstEPC, lastEPC).ToList();
                if (ReadingForOrderId.Count > 1)//אם הכביסה נמצאה בפיזור של כמה תחנות
                {
                    //שרשור שם הלקוח ופרטי התחנות
                    massageLostDetailes = " customer " + fmEF.Owners.Where(x => x.OwnerId == order.OwnerId).First().Name + " phone: " + fmEF.Owners.Where(x => x.OwnerId == order.OwnerId).First().Phone + "\n";
                    massageLostDetailes += "lost detailes in stations: ";
                    foreach (var item in ReadingForOrderId)
                    {
                        massageLostDetailes += item.Station + ",  ";
                    }
                    massageLostDetailes = massageLostDetailes.Substring(massageLostDetailes.LastIndexOf(","));
                    massageLostDetailes += "\n";
                    SendMail(massageLostDetailes);  //שליחת מייל
                }
            }
            //Application.EnableVisualStyles();
            //Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new Form1());
        }

        static void SendMail(string mailBody)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("leah1.roz@gmail.com");
            mail.From = new MailAddress("leah1.roz@gmail.com");
            mail.Subject = "lost detailes";
            mail.Body = mailBody;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential(
                               "leah1.roz@gmail.com", "12345678");
            smtp.EnableSsl = true;
            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
            }

        }
    }
}
