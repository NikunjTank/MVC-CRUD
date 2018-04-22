using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCWebApplicationTest1.Models;
using MVCWebApplicationTest1.Repository;

namespace MVCWebApplicationTest1.Controllers
{
    [AllowAnonymous]
    public class CountryController : Controller
    {
        private ICountry iCountry;

        public CountryController()
        {
            iCountry = new CountryRepository();
        }

        public ActionResult Index()
        {
            var countries = iCountry.GetCountry(new Country());

            return View(countries);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create(AddCountry addCountry)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View();
        //    }

        //    int result = iCountry.AddCountry(addCountry);
        //    if (result > 0)
        //        return RedirectToAction("Index");
        //    else
        //        return View();
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(AddCountry addCountry)
        {
            int result = 0;
            try
            {
                if (!ModelState.IsValid)
                {
                    result = -1;
                }
                result = iCountry.AddCountry(addCountry);                
            }
            catch (Exception)
            {
                result = -1;
            }            
            return Json(result);
        }


        [HttpGet]
        [ActionName("Update")]
        public ActionResult Update_Get(int id)
        {
            try
            {
                var country = iCountry.GetCountry(new Country() { CountryId = id }).FirstOrDefault();
                if (country == null)
                    return RedirectToAction("Index");

                UpdateCountry updateCountry = new UpdateCountry();
                updateCountry.CountryId = Convert.ToInt32(country.CountryId);
                updateCountry.CountryName = country.CountryName;
                return View(updateCountry);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost]
        [ActionName("Update")]
        [ValidateAntiForgeryToken]
        public ActionResult Update_Post(UpdateCountry updateCountry)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            int result = iCountry.UpdateCountry(updateCountry);
            if (result > 0)
                return RedirectToAction("Index");
            else
                return View();
        }

        [HttpPost]
        public ActionResult DeleteCountry(int id)
        {
            try
            {
                DeleteCountry deleteCountry = new DeleteCountry();
                deleteCountry.CountryId = id;                
                int result = iCountry.DeleteCountry(deleteCountry);
                return Json(result);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}