using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GF.Startup))]
namespace GF
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
