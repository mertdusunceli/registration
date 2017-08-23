using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Register.Models;

namespace Register.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        #region Index method.  
        /// <summary>  
        /// Index method.   
        /// </summary>  
        /// <returns>Returns - Index view</returns>  
        public ActionResult Index()
        {
            return this.View();
        }
        #endregion

        //bunlar ekleme about ve contact 
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult PersonnelList()
        {
            List<RegisterViewModel> personnels = new List<RegisterViewModel>();
            using (AdoNetIntegrationEntities db = new AdoNetIntegrationEntities())
            {
                var model = db.Logins.ToList();
                foreach (var personnelItem in model)
                {
                    RegisterViewModel personnel = new RegisterViewModel();
                    personnel.Username = personnelItem.name;
                    personnel.Password = personnelItem.password;

                    
                    personnels.Add(personnel);
                }
            }
            return View(personnels);
        }
    }

    //public class HomeController : Controller
    //{
    //    public ActionResult Index()
    //    {
    //        return View();
    //    }

    //    public ActionResult About()
    //    {
    //        ViewBag.Message = "Your application description page.";

    //        return View();
    //    }

    //    public ActionResult Contact()
    //    {
    //        ViewBag.Message = "Your contact page.";

    //        return View();
    //    }
    // }


    
}