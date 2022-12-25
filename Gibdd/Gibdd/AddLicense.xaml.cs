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
    /// Логика взаимодействия для AddLicense.xaml
    /// </summary>
    public partial class AddLicense : Window
    {
        GibddEntities db = new GibddEntities();
        DriverLicense licwind = new DriverLicense();
        public AddLicense(DriverLicense licensewind)
        {
            InitializeComponent();
            licwind=licensewind;
            List<string> colorlist = new List<string>();
            List<string> categorylist = new List<string>();
            foreach (LicenseState status in db.LicenseState)
            {
                colorlist.Add(status.State);
            }
            StatusCmb.ItemsSource = colorlist;
                    foreach (LicenseCategory category in db.LicenseCategory)
                    {
                      categorylist.Add(category.Name);
                        
                    }
            CategoryCmb.ItemsSource = categorylist;
                
            

        }

        private void AddLicense_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                License license = new License();
                license.LicenseDate = DateFirst.SelectedDate.Value;
                license.ExpireDate = DateLast.SelectedDate.Value;
                license.LicenseSeries = SerT.Text;
                license.LicenseNumber = int.Parse(NumT.Text);
                license.DriverId = int.Parse(DriverT.Text);
                MessageBox.Show(StatusCmb.SelectedItem.ToString());
                foreach (LicenseState status in db.LicenseState)
                {
                    if (StatusCmb.SelectedItem.ToString() == status.State)
                    {
                        license.LicenseStateId = status.Id;
                    }
                }
                db.License.Add(license);
                db.SaveChanges();
                int licid = 0;
                foreach (License lic in db.License)
                {
                    if (lic.LicenseNumber == int.Parse(NumT.Text))
                    {
                        licid = lic.Id;
                    }
                }
                int categoryid = 0;
                foreach (LicenseCategory categor in db.LicenseCategory)
                {
                    if (categor.Name == CategoryCmb.SelectedItem.ToString())
                    {
                        categoryid = categor.Id;
                    }
                }
                CatrgoryOfLicense categoroflic = new CatrgoryOfLicense();
                categoroflic.LicenseId = licid;
                categoroflic.LicenseCategoryId = categoryid;
                db.CatrgoryOfLicense.Add(categoroflic);
                db.SaveChanges();
                MessageBox.Show("ВУ успешно добавлено");
                licwind.Refresh();
            }
            catch
            {
                MessageBox.Show("Произошла ошибка,проверьте правильность введенных данных");
            }
        }
    }
}
