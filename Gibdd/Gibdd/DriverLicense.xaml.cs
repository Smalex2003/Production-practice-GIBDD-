using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для DriverLicense.xaml
    /// </summary>
    public partial class DriverLicense : Window
    {
        
        GibddEntities _db = new GibddEntities();
        public int licenseId;
        string categories = "";
        public DriverLicense()
        {

            InitializeComponent();
            
            Refresh();
            categories = "";
        }

        public void Refresh()
        {           
            GridLicense.ItemsSource = _db.License.ToList();
        }
        private void AddlicenseBtn_Click(object sender, RoutedEventArgs e)
        {
            AddLicense wind = new AddLicense(this);
            wind.Show();
          
        }


        private void BtnShowCategory_Click(object sender, RoutedEventArgs e)
        {
            License license = new License();
            license = (sender as Button).DataContext as License;
            
            CatrgoryOfLicense categoryoflicense = new CatrgoryOfLicense();
            foreach (CatrgoryOfLicense catoflicsense in _db.CatrgoryOfLicense)
            {
                if (catoflicsense.LicenseId == license.Id)
                {
                    foreach (LicenseCategory category in _db.LicenseCategory)
                    {

                        if (category.Id == catoflicsense.LicenseCategoryId)
                        {

                            categories = categories + category.Name + " ";
                        }
                    }
                }
            }
            
           
            MessageBox.Show(categories);
            categories = "";
        }
    }
}
