using System.Web.Mvc;
using Microsoft.Practices.Unity;
using Unity.Mvc5;
using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Kalyan.Property.Infrastructure.BaseRepository;
using Microsoft.AspNet.Identity;
using System.Data.Entity;

namespace Kaylan.Porperty.Web
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

            container.RegisterType<IUnitOfWork, UnitOfWork>(new HierarchicalLifetimeManager(),
      new InjectionConstructor("DefaultConnection"));
            container.RegisterType(typeof(IRepository<>), typeof(Repository<>));

            container.RegisterType<IUserStore<Users, int>, UserStore<Users, Roles, int, UserLogin, UserRole, UserClaim>>();
            container.RegisterType<UserManager<Users, int>>();
            container.RegisterType<DbContext, CustomeDbContext>();
            container.RegisterType<ApplicationUserManager>();
            container.RegisterType<Controllers.AccountController>(new InjectionConstructor());

            //container.RegisterType<Controllers.PublicApplicationController>(new InjectionConstructor());
            //container.RegisterType<IApplicationsRepository, ApplicationsRepository>();
            //container.RegisterType<IDepartmentRepository, DepartmentRepository>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));


            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}