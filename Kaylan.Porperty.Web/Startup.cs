using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Kaylan.Porperty.Web.Startup))]
namespace Kaylan.Porperty.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
