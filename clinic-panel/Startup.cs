using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(clinic_panel.Startup))]
namespace clinic_panel
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
