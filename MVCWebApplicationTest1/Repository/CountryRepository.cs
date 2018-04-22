using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCWebApplicationTest1.Models;
using System.Data.Entity.Core.Objects;

namespace MVCWebApplicationTest1.Repository
{
    public class CountryRepository : ICountry
    {
        public IEnumerable<Country> GetCountry(Country country)
        {
            List<Country> countryList = new List<Country>();
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {

                var countries = testingSample1Entities.CountryGet(country.CountryId).ToList();
                foreach (var countryItem in countries)
                {
                    countryList.Add(new Country()
                    {
                        CountryId = countryItem.CountryId,
                        CountryName = countryItem.CountryName
                    });
                }
            }
            return countryList;
        }

        public int AddCountry(AddCountry addCountry)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.CountryAdd(addCountry.CountryName, addCountry.CreatedBy, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }

        public int UpdateCountry(UpdateCountry updateCountry)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.CountryUpdate(updateCountry.CountryId, updateCountry.CountryName, updateCountry.ModifiedBy, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }

        public int DeleteCountry(DeleteCountry deleteCountry)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.CountryDelete(deleteCountry.CountryId, deleteCountry.ModifiedBy, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }
    }
}