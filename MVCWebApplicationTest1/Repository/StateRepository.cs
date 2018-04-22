using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCWebApplicationTest1.Models;
using System.Data.Entity.Core.Objects;

namespace MVCWebApplicationTest1.Repository
{
    public class StateRepository : IState
    {
        public IEnumerable<State> GetState(State state)
        {
            List<State> stateList = new List<State>();
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {

                var states = testingSample1Entities.StateGet(state.StateId, state.CountryId).ToList();
                foreach (var stateItem in states)
                {
                    stateList.Add(new State()
                    {
                        StateId = stateItem.StateId,
                        StateName = stateItem.StateName,
                        CountryId = stateItem.CountryId,
                        CountryName = stateItem.CountryName
                    });
                }
            }
            return stateList;
        }

        public int AddState(AddState addState)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.StateAdd(addState.StateName, addState.CountryId, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }

        public int UpdateState(UpdateState updateState)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.StateUpdate(updateState.StateId, updateState.StateName, updateState.CountryId, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }

        public int DeleteState(DeleteState deleteState)
        {
            int result = 0;
            using (TestingSample1Entities testingSample1Entities = new TestingSample1Entities())
            {
                ObjectParameter opResult = new ObjectParameter("Result", typeof(int));
                testingSample1Entities.StateDelete(deleteState.StateId, opResult);
                result = Convert.ToInt32(opResult.Value);
            }
            return result;
        }
    }
}