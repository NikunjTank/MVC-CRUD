using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCWebApplicationTest1.Models;
using System.Data.Entity.Core.Objects;

namespace MVCWebApplicationTest1.Repository
{
    public class UserRepository : IUser
    {
        public int AddUserProfile(AddUserProfile addUserProfile)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.UserProfileAdd(addUserProfile.Username, addUserProfile.Password, addUserProfile.FirstName, addUserProfile.LastName, addUserProfile.Phone, addUserProfile.CountryId, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }

        public IEnumerable<UserProfile> GetUserProfile(UserProfile userProfile)
        {
            List<UserProfile> userProfileList = new List<UserProfile>();
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {

                var userProfiles = testingSample1Entities.UserProfileGet(userProfile.UserId).ToList();
                foreach (var userProfileItem in userProfiles)
                {
                    userProfileList.Add(new UserProfile()
                    {
                        UserId = userProfileItem.UserId,
                        Username = userProfileItem.Username,
                        FirstName = userProfileItem.FirstName,
                        LastName = userProfileItem.LastName,
                        Phone = userProfileItem.Phone,
                        CountryId = userProfileItem.CountryId
                    });
                }
            }
            return userProfileList;
        }

        public User UserLogin(UserLogin userLogin)
        {
            User user = new User();
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                var userDetail = testingSample1Entities.UserLogin(userLogin.Username, userLogin.Password).FirstOrDefault();
                if (userDetail != null)
                {
                    user.UserId = userDetail.UserId;
                    user.Username = userDetail.Username;
                    user.RoleId = userDetail.RoleId;
                }                
            }
            return user;
        }
    }
}