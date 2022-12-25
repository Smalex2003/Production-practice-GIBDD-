using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Gibdd
{
    /// <summary>
    /// Логика взаимодействия для MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DriversWindow wind = new DriversWindow();
            wind.Show();
            
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            IncidentWindow wind = new IncidentWindow();
            wind.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            DriverLicense wind = new DriverLicense();
            wind.Show();
        }
    }
}
