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
    public class HobbyController : Controller
    {
        private IHobby iHobby;
        public HobbyController()
        {
            iHobby = new HobbyRepository();
        }
        // GET: Hobby
        public ActionResult Index()
        {
            IEnumerable<Hobby> hobbies = new List<Hobby>();
            try
            {
                hobbies = iHobby.GetHobby(new Hobby());
            }
            catch (Exception)
            {

            }
            return View(hobbies);
        }

        // GET: Hobby/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Hobby/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(AddHobby addHobby)
        {
            int result = 0;
            try
            {
                result = iHobby.AddHobby(addHobby);
            }
            catch
            {
                result = -1;
            }
            return Json(result);
        }

        // GET: Hobby/Edit/5
        public ActionResult Edit(int id)
        {
            UpdateHobby updateHobby = new UpdateHobby();
            try
            {
                Hobby hobby = new Hobby();
                hobby.HobbyId = id;
                var hobbyDetail = iHobby.GetHobby(hobby).FirstOrDefault();
                if (hobbyDetail != null)
                {
                    updateHobby.HobbyId = Convert.ToInt32(hobbyDetail.HobbyId);
                    updateHobby.HobbyName = hobbyDetail.HobbyName;
                }
            }
            catch (Exception)
            {

            }
            return View(updateHobby);
        }

        // POST: Hobby/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(UpdateHobby updateHobby)
        {
            int result = 0;
            try
            {
                result = iHobby.UpdateHobby(updateHobby);
            }
            catch
            {
                result = -1;
            }
            return Json(result);
        }



        // POST: Hobby/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            int result = 0;
            try
            {
                DeleteHobby deleteHobby = new DeleteHobby()
                {
                    HobbyId = id
                };
                result = iHobby.DeleteHobby(deleteHobby);
            }
            catch
            {
                result = -1;
            }
            return Json(result);
        }
    }
}
