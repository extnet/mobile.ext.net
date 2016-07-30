using System.Collections.Generic;
using System.Linq;

namespace Ext.Net.Mobile.Examples.Models.KitchenSink
{
    public class States
    {
        private static string[] statesUsa =
        {
            "Alabama",
            "Alaska",
            "Arizona",
            "Arkansas",
            "California",
            "Colorado",
            "Connecticut",
            "Delaware",
            "District of Columbia",
            "Florida",
            "Georgia",
            "Hawaii",
            "Idaho",
            "Illinois",
            "Indiana",
            "Iowa",
            "Kansas",
            "Kentucky",
            "Louisiana",
            "Maine",
            "Maryland",
            "Massachusetts",
            "Michigan",
            "Minnesota",
            "Mississippi",
            "Missouri",
            "Montana",
            "Nebraska",
            "Nevada",
            "New Hampshire",
            "New Jersey",
            "New Mexico",
            "New York",
            "North Carolina",
            "North Dakota",
            "Ohio",
            "Oklahoma",
            "Oregon",
            "Pennsylvania",
            "Rhode Island",
            "South Carolina",
            "South Dakota",
            "Tennessee",
            "Texas",
            "Utah",
            "Vermont",
            "Virginia",
            "Washington",
            "West Virginia",
            "Wisconsin",
            "Wyoming"
        };

        private static string[] statesCanada =
        {
            "Ontario",
            "Quebec",
            "Nova Scotia",
            "New Brunswick",
            "Manitoba",
            "British Columbia",
            "Prince Edward Island",
            "Saskatchewan",
            "Alberta",
            "Newfoundland and Labrador"
        };

        public static List<State> Get(int countryId = 1)
        {
            if (countryId < 1 || countryId > 2)
            {
                countryId = 1;
            }

            var states = new List<State>();
            string[] chosenList = statesUsa;
            var i = 1;

            if (countryId == 2)
            {
                i += statesUsa.Count();
                chosenList = statesCanada;
            }

            foreach (var state in chosenList)
            {
                states.Add(new State() { Id = i++, CountryId = countryId, Name = state });
            }

            return states;
        }

        public static List<State> GetAll()
        {
            var totalList = Get(1);
            totalList.AddRange(Get(2));

            return totalList;
        }
    }

    public class State
    {
        public int Id { get; set; }
        public int CountryId { get; set; }
        public string Name { get; set; }
    }
}