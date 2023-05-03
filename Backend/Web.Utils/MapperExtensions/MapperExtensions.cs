using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils
{
    public static class MapperExtensions
    {
        public static TDestination MapperData<TSource, TDestination>(TSource source)
        {
            try
            {
                var config = new MapperConfiguration(cfg => cfg.CreateMap<TSource, TDestination>());
                var mapper = config.CreateMapper();
                TDestination destination = mapper.Map<TDestination>(source);
                return destination;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return default;
            }
        }
    }
}
