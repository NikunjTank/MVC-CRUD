using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MVCWebApplicationTest1.Models;

namespace MVCWebApplicationTest1.Repository
{
    interface IUser
    {
        IEnumerable<UserProfile> GetUserProfile(UserProfile userProfile);
        int AddUserProfile(AddUserProfile addUserProfile);
        User UserLogin(UserLogin userLogin);
    }
}
