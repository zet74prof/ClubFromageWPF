using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

using ModelLayer.Business;
using ModelLayer.Data;

namespace WpfClubFromage
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private Dbal thedbal;
        private DaoPays thedaopays;
        private DaoFromage thedaofromage;

        private void Application_Startup(object sender, StartupEventArgs e)
        {
            thedbal = new Dbal("dbclubfromage");
            thedaopays = new DaoPays(thedbal);
            thedaofromage = new DaoFromage(thedbal, thedaopays);

            // Create the startup window
            Home wnd = new Home(thedaopays, thedaofromage);
            //MainWindow wnd = new MainWindow(thedaopays, thedaofromage);
            wnd.Show();
            
        }

        private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            MessageBox.Show("An unhandled exception just occurred: " + e.Exception.Message, "Exception Sample", MessageBoxButton.OK, MessageBoxImage.Warning);
            e.Handled = true;
        }
    }
}
