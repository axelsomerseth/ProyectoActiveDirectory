using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ActiveDirectory.Startup))]
namespace ActiveDirectory
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
