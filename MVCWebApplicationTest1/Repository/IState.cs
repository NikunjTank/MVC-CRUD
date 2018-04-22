using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MVCWebApplicationTest1.Models;

namespace MVCWebApplicationTest1.Repository
{
    interface IState
    {
        IEnumerable<State> GetState(State State);
        int AddState(AddState addState);
        int UpdateState(UpdateState updateState);
        int DeleteState(DeleteState deleteState);
    }
}
