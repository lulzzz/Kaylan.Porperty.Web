﻿using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class CityViewModel
    {
        
        public IPagedList<City> CityList { get;  set; }

        public string CityName { get;  set; }

        public int CountryId { get;  set; }//rupesh test

        public int StateId { get;  set; }//test
    }


    //public class AreaViewModelasds
    //public class AreaViewModelzzzz
    //{
    //    public IPagedList<Area> AreaList { get; internal set; }asd
    //    public IPagedList<Area> AreaList { get; internal set; }zzzz

    //    public string AreaName { get; internal set; }asd

    //    public int CountryId { get; internal set; }asd

    //    public int CityId { get; internal set; }

    //    public int StateId { get; internal set; }
    //}
}