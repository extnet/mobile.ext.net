using System.Collections.Generic;

namespace Ext.Net.Mobile.Examples.Models.KitchenSink
{
    public class Countries
    {
        public static List<Country> Get()
        {
            return new List<Country>() {
                new Country() { Id = 1, Name = "USA" },
                new Country() { Id = 2, Name = "Canada" }
            };
        }
    }

    public class Country
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}