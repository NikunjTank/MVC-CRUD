using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MVCWebApplicationTest1.Models;

namespace MVCWebApplicationTest1.Repository
{
    interface ICountry
    {
        IEnumerable<Country> GetCountry(Country country);
        int AddCountry(AddCountry addCountry);
        int UpdateCountry(UpdateCountry updateCountry);
        int DeleteCountry(DeleteCountry deleteCountry);
    }
}
