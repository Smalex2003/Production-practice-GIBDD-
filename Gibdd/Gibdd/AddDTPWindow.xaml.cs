using Microsoft.Win32;
using System;
using System.IO;
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
    /// Логика взаимодействия для AddDTPWindow.xaml
    /// </summary>
    public partial class AddDTPWindow : Window
    {
        GibddEntities db = new GibddEntities();
        PhotoOfVehicleAccident photo = new PhotoOfVehicleAccident();
        public AddDTPWindow()
        {
            InitializeComponent();
        }
        
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                VehicleAccident dtp = new VehicleAccident();
                Driver driverdtp = new Driver();
                Vehicle cardtp = new Vehicle();
               
                dtp.Address = AdresT.Text;
                dtp.Description = DescripT.Text;
                dtp.RowOfRoad = RowT.Text;
                dtp.TrafficLane = TraficT.Text;
                dtp.VictimsCount = int.Parse(VictimsT.Text);
                dtp.Date = DatePick.SelectedDate.Value;
                dtp.Time = File.GetCreationTime(photo.Photo).TimeOfDay;
                MessageBox.Show(dtp.Time.ToString() + dtp.Date.ToString());
                db.PhotoOfVehicleAccident.Add(photo);
                db.VehicleAccident.Add(dtp);
                db.SaveChanges();
                MessageBox.Show("ДТП успешно добавлено");
            }
            catch
            {
                MessageBox.Show("Возникла ошибка! Проверьте правильность данных");
            }
        }

        private void PhotoBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                OpenFileDialog ofd = new OpenFileDialog();
                ofd.Filter = "Файлы изображений (*.jpg, *.png)|*.jpg;*.png";
                ofd.ShowDialog();
                photo.Photo = ofd.FileName;


                photo.VehicleAccidentId = int.Parse(idT.Text);
                photo.Name = System.IO.Path.GetFileNameWithoutExtension(ofd.FileName);
                photo.Id= int.Parse(idT.Text);
                
                MessageBox.Show("Файл успешно выбран");

            }
            catch
            {
                MessageBox.Show("Произошла ошибка");
            }
        }

        private void SchemBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
