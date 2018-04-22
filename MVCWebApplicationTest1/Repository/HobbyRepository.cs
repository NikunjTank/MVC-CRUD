using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCWebApplicationTest1.Models;
using System.Data.Entity.Core.Objects;

namespace MVCWebApplicationTest1.Repository
{
    public class HobbyRepository : IHobby
    {
        public IEnumerable<Hobby> GetHobby(Hobby hobby)
        {
            List<Hobby> hobbyList = new List<Hobby>();
            using (TestingSample1Entities dataContext = new TestingSample1Entities())
            {
                var hobbies = dataContext.HobbyGet(hobby.HobbyId).ToList();
                foreach (var hobbyItem in hobbies)
                {
                    hobbyList.Add(new Hobby()
                    {
                        HobbyId = hobbyItem.HobbyId,
                        HobbyName = hobbyItem.HobbyName
                    });
                }
            }
            return hobbyList;
        }
        public int AddHobby(AddHobby addHobby)
        {
            ObjectParameter result = new ObjectParameter("Result", typeof(int));
            using (TestingSample1Entities dataContext = new TestingSample1Entities())
            {
                dataContext.HobbyAdd(addHobby.HobbyName, result);
            }
            return Convert.ToInt32(result.Value);
        }
        public int UpdateHobby(UpdateHobby updateHobby)
        {
            ObjectParameter result = new ObjectParameter("Result", typeof(int));
            using (TestingSample1Entities dataContext = new TestingSample1Entities())
            {
                dataContext.HobbyUpdate(updateHobby.HobbyId, updateHobby.HobbyName, result);
            }
            return Convert.ToInt32(result.Value);
        }

        public int DeleteHobby(DeleteHobby deleteHobby)
        {
            ObjectParameter result = new ObjectParameter("Result", typeof(int));
            using (TestingSample1Entities dataContext = new TestingSample1Entities())
            {
                dataContext.HobbyDelete(deleteHobby.HobbyId, result);
            }
            return Convert.ToInt32(result.Value);
        }
        
    }
}