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
    /// Логика взаимодействия для DriversWindow.xaml
    /// </summary>
    public partial class DriversWindow : Window
    {
        
        GibddEntities db = new GibddEntities();
        public DriversWindow()
        {
            InitializeComponent();

            Refresh();
        }
        public void Refresh()
        {
            GibddEntities _db = new GibddEntities();
            GridDrivers.ItemsSource = _db.Driver.ToList();
        }
        public int driverid;
        public int check=0;
        private void BtnEditDriver_Click(object sender, RoutedEventArgs e)
        {
            
            Driver driver = new Driver();
            driver = (sender as Button).DataContext as Driver;
            driverid = driver.Id;
            AddDriverWindow wind = new AddDriverWindow(this);
            wind.AcceptBtn.Content = "Применить";
            wind.Show();
            
        }

        private void AddworkerBtn_Click(object sender, RoutedEventArgs e)
        {
            AddDriverWindow wind = new AddDriverWindow(this);
            wind.Show();
            driverid = 9999999;
        }

        private void BtnLicenseDriver_Click(object sender, RoutedEventArgs e)
        {
            string category = "Категории: ";
            string numberlicense = "";
            Driver driver = new Driver();
            driver = (sender as Button).DataContext as Driver;
            License licensethisdriver= new License();
            foreach(License lic in db.License)
            {
                if (lic.DriverId == driver.Id)
                {
                    licensethisdriver = lic;
                    numberlicense = "Серия ВУ: " + licensethisdriver.LicenseSeries.ToString() + " Номер ВУ: " + licensethisdriver.LicenseNumber.ToString();
                }
            }
           
            CatrgoryOfLicense categoryoflicense = new CatrgoryOfLicense();
            foreach (CatrgoryOfLicense catoflicsense in db.CatrgoryOfLicense)
            {
                if (catoflicsense.LicenseId == licensethisdriver.Id)
                {
                    foreach (LicenseCategory category1 in db.LicenseCategory)
                    {

                        if (category1.Id == catoflicsense.LicenseCategoryId)
                        {

                            category = category + category1.Name + " ";
                        }
                    }
                }
            }
            MessageBox.Show(numberlicense + " " + category);
        }
    }
}
