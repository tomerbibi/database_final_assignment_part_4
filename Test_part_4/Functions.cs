using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test_part_4
{
    static class Functions
    {
        private static readonly log4net.ILog my_logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        static public List<District> GetDistricts()
        {
            using(Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                return se.Districts.ToList();
            }
        }
        static public District GetDistrictById(long id)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                return se.Districts.ToList()[0];
            }
        }
        static public void AddDistrict(District d)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Districts.Add(d);
                se.SaveChanges();
            }
            my_logger.Info("district was added to districts");
        }
        static public void UpdateDistrict(District d)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Districts.ToList().ForEach(district =>
                {
                    if (district.ID == d.ID)
                    {
                        se.Districts.Remove(district);
                        se.Districts.Add(d);
                        se.SaveChanges();
                    }
                });
            }
        }
        static public void DeleteDistrict(District d)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Districts.ToList().ForEach(district =>
                {
                    if (district.ID == d.ID)
                    {
                        se.Districts.Remove(district);
                        se.SaveChanges();
                    }
                });
            }
            my_logger.Info("district was deleted from districts");

        }
        static public List<City> GetCities()
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                return se.Cities.ToList();
            }
        }
        static public City GetCityById(long id)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                return se.Cities.ToList()[0];
            }
        }
        static public void AddCity(City c)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Cities.Add(c);
                se.SaveChanges();
            }
            my_logger.Info("city was added to cities");
        }
        static public void UpdateCity(City c)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Cities.ToList().ForEach(city =>
                {
                    if (city.ID == c.ID)
                    {
                        se.Cities.Remove(city);
                        se.Cities.Add(c);
                        se.SaveChanges();
                    }
                });
            }
        }
        static public void DeleteCity(City c)
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Cities.ToList().ForEach(city =>
                {
                    if (city.ID == c.ID)
                    {
                        se.Cities.Remove(city);
                        se.SaveChanges();
                    }
                });
            }
            my_logger.Info("city was removed from cities");

        }
        public static List<City> Get_all_cities_with_min_population_of(int minPopulation)
        {
            List<City> cities = new List<City>();

            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Cities.ToList().ForEach(city =>
                {
                    if (city.population > minPopulation)
                        cities.Add(city);
                });
            }
            return cities;
        }
        public static void Fill_population_in_districts()
        {
            using (Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                se.Cities.ToList().ForEach(city =>
                {
                    se.Districts.ToList().ForEach(district =>
                    {
                        if(district.ID == city.District_ID)
                        {
                            district.Population += city.population;
                            UpdateDistrict(district);
                            
                        }
                    });
                });
                se.SaveChanges();
                my_logger.Info("population in districts was updated");
            }
        }
        static public List<City> Get_cities_with_linq_query_suntax()
        {
            using(Test_part_4Entities2 se = new Test_part_4Entities2())
            {
                return se.Cities.ToList();
            }
        }

}   }
