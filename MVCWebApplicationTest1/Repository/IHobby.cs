using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MVCWebApplicationTest1.Models;

namespace MVCWebApplicationTest1.Repository
{
    interface IHobby
    {
        IEnumerable<Hobby> GetHobby(Hobby hobby);
        int AddHobby(AddHobby addHobby);
        int UpdateHobby(UpdateHobby updateHobby);
        int DeleteHobby(DeleteHobby deleteHobby);
    }
}
