using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DATrackingWeb.Startup))]
namespace DATrackingWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
