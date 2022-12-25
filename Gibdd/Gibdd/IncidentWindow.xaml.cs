using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
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
using System.Diagnostics;

namespace Gibdd
{
    /// <summary>
    /// Логика взаимодействия для IncidentWindow.xaml
    /// </summary>
    public partial class IncidentWindow : Window
    {
        GibddEntities db = new GibddEntities();
        public IncidentWindow()
        {
            InitializeComponent();
            Refresh();
        }
        public void Refresh()
        {
            GibddEntities _db = new GibddEntities();
            GridDTP.ItemsSource = _db.VehicleAccident.ToList();
        }
        private void AddDTPBtn_Click(object sender, RoutedEventArgs e)
        {
            AddDTPWindow wind = new AddDTPWindow();
            wind.Show();
        }


        private void PhotoSeeBtn_Click(object sender, RoutedEventArgs e)
        {
            VehicleAccident vehicle = new VehicleAccident();
            vehicle = (sender as Button).DataContext as VehicleAccident;
            
            foreach(PhotoOfVehicleAccident photo in db.PhotoOfVehicleAccident)
            {
                if (photo.VehicleAccidentId == vehicle.Id)
                {
                    Process.Start(photo.Photo);
                }
            }
        }

        private void MemberSeeBtn_Click(object sender, RoutedEventArgs e)
        {
            VehicleAccident accident = new VehicleAccident();
            accident = (sender as Button).DataContext as VehicleAccident;
            
            string cars = "Vin автомобилей: ";
            string drivers = "Код водителей: ";
            foreach(DriverOfAccident driverof in db.DriverOfAccident)
            {
                if(driverof.VehicleAccidentId== accident.Id)
                {
                    drivers = drivers + driverof.DriverID + ";";
                }
            }
            foreach(CarofAccident carofAccident in db.CarofAccident)
            {
                if(carofAccident.AccidentId == accident.Id)
                {
                    cars=cars+carofAccident.VehicleVIN+ ";";
                }
            }
            MessageBox.Show(drivers +" "+ cars);



        }
    }
}
