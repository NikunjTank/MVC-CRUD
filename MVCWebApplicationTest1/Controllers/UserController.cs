using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCWebApplicationTest1.Models;
using MVCWebApplicationTest1.Repository;
using System.Configuration;
using System.Web.Security;

namespace MVCWebApplicationTest1.Controllers
{
    [RoutePrefix("")]
    public class UserController : Controller
    {
        private IUser iUser;
        private ICountry iCountry;
        public UserController()
        {
            iUser = new UserRepository();
            iCountry = new CountryRepository();
        }

        [Route("login")]
        public ActionResult Login(string returnUrl)
        {
            UserLogin userLogin = new UserLogin();
            try
            {
                userLogin.ReturnUrl = returnUrl;
            }
            catch (Exception)
            {

            }
            return View(userLogin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]        
        public ActionResult Login(UserLogin userLogin)
        {
            int result = 0;
            string redirectUrl = string.Empty;
            try
            {
                var user = new User();
                user = iUser.UserLogin(userLogin);
                if (user != null && user.RoleId == Convert.ToInt32(ConfigurationManager.AppSettings["UserRole"]))
                {
                    FormsAuthentication.SetAuthCookie(user.Username, false);
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.UserId.ToString(), DateTime.Now, DateTime.Now.AddDays(1), false, "User");
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                    if (ticket.IsPersistent)
                    {
                        cookie.Expires = ticket.Expiration;
                    }
                    Response.Cookies.Add(cookie);
                    redirectUrl = string.IsNullOrEmpty(userLogin.ReturnUrl) ? "/Owner/Dashboard/Index" : userLogin.ReturnUrl;
                    result = 1;
                }
                else
                {
                    result = -2;
                }
            }
            catch (Exception)
            {
                result = -1;
            }
            return Json(new { Result = result, RedirectUrl = redirectUrl });
        }

        [Route("register")]
        public ActionResult Register()
        {
            ViewBag.Countries = new SelectList(iCountry.GetCountry(new Country()), "CountryId", "CountryName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]        
        public ActionResult Register(AddUserProfile addUserProfile)
        {
            int result = 0;
            try
            {
                result = iUser.AddUserProfile(addUserProfile);
            }
            catch (Exception)
            {
                result = -1;
            }
            return Json(result);
        }


    }
}