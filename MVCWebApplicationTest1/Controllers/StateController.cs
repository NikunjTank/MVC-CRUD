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
    public class StateController : Controller
    {
        private IState iState;
        private ICountry iCountry;
        public StateController()
        {
            iState = new StateRepository();
            iCountry = new CountryRepository();
        }
        // GET: State
        public ActionResult Index()
        {
            IEnumerable<State> states = new List<State>();
            try
            {
                states = iState.GetState(new State());
            }
            catch (Exception)
            {

            }
            return View(states);
        }

        public ActionResult Create()
        {
            try
            {
                ViewBag.Countries = new SelectList(iCountry.GetCountry(new Country()), "CountryId", "CountryName");

            }
            catch (Exception)
            {

            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(AddState addState)
        {
            int result = 0;
            try
            {
                result = iState.AddState(addState);
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
                ViewBag.Countries = new SelectList(iCountry.GetCountry(new Country()), "CountryId", "CountryName");

                var state = iState.GetState(new State() { StateId = id }).FirstOrDefault();
                if (state == null)
                    return RedirectToAction("Index");

                UpdateState updateState = new UpdateState();
                updateState.StateId = id;   
                updateState.StateName = state.StateName;
                updateState.CountryId = Convert.ToInt32(state.CountryId);                
                return View(updateState);
            }
            catch (Exception)
            {

            }
            return View();
        }

        [HttpPost]
        [ActionName("Update")]
        [ValidateAntiForgeryToken]
        public ActionResult Update_Post(UpdateState updateState)
        {
            int result = 0;
            try
            {
                result = iState.UpdateState(updateState);
            }
            catch
            {
                result = -1;
            }
            return Json(result);
        }

    }
}