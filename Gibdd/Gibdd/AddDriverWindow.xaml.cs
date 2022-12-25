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
    /// Логика взаимодействия для AddDriverWindow.xaml
    /// </summary>
    public partial class AddDriverWindow : Window
    {
        
        GibddEntities db = new GibddEntities();
        Driver driver = new Driver();
        private DriversWindow _drwind;
        string photo;
        public AddDriverWindow(DriversWindow _driversWindow)
        {
            InitializeComponent();
            _drwind = _driversWindow;
            
                foreach (Driver driver in db.Driver)
                {

                    if (driver.Id == _drwind.driverid)
                    {
                        idT.Text = driver.Id.ToString();
                        NameT.Text = driver.Name;
                        SurT.Text = driver.Surname;
                        MidNmT.Text = driver.Patronymic;
                        SerT.Text = driver.PassportSerial.ToString();
                        NumT.Text = driver.PassportNumber.ToString();
                        IndexT.Text = driver.Postcode.ToString();
                        RegT.Text = driver.RegistrationAddress;
                        AdrPT.Text = driver.ResidentialAddress;
                        JobT.Text = driver.CompanyName;
                        JST.Text = driver.JobTitle;
                        PNubT.Text = driver.PhoneNumber;
                        emailT.Text = driver.Email;
                        DescrT.Text = driver.Description;
                        photo = driver.Photo;


                    }
                }
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int check = 0;
                string emailcheck = emailT.Text;
               
                if (AcceptBtn.Content.ToString()== "Добавить водителя")
                {
                    


                   
                    driver.Name = NameT.Text;
                    driver.Surname = SurT.Text;
                    driver.Patronymic = MidNmT.Text;
                    driver.PassportSerial = int.Parse(SerT.Text);
                    driver.PassportNumber = int.Parse(NumT.Text);
                    driver.Postcode = int.Parse(IndexT.Text);
                    driver.RegistrationAddress = RegT.Text;
                    driver.ResidentialAddress = AdrPT.Text;
                    driver.CompanyName = JobT.Text;
                    driver.JobTitle = JST.Text;
                    driver.PhoneNumber = PNubT.Text;
                    driver.Email = emailT.Text;
                    driver.Description = DescrT.Text;

                    for (int i = 0; i < emailcheck.Length; i++)
                    {
                        if (emailcheck[i] == '@')
                        {
                            check++;
                        }
                    }
                    if (check >= 1)
                    {
                        
                        db.Driver.Add(driver);
                        db.SaveChanges();
                        MessageBox.Show("Водитель успешно добавлен");
                        check = 0;
                        _drwind.Refresh();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Проверьте корректность эл.почты");
                    }
                }
                else 
                {

                    foreach (Driver driver1 in db.Driver)
                    {

                        if (driver1.Id == _drwind.driverid)
                        {

                           
                            driver1.Name = NameT.Text;
                            driver1.Surname = SurT.Text;
                            driver1.Patronymic = MidNmT.Text;
                            driver1.PassportSerial = int.Parse(SerT.Text);
                            driver1.PassportNumber = int.Parse(NumT.Text);
                            driver1.Postcode = int.Parse(IndexT.Text);
                            driver1.RegistrationAddress = RegT.Text;
                            driver1.ResidentialAddress = AdrPT.Text;
                            driver1.CompanyName = JobT.Text;
                            driver1.JobTitle = JST.Text;
                            driver1.PhoneNumber = NumT.Text;
                            driver1.Email = emailT.Text;
                            driver1.Description = DescrT.Text;
                            driver1.Photo = photo;
                         }
                }

                for (int i = 0; i <= emailcheck.Length-1; i++)
                            {
                                if (emailcheck[i] == '@')
                                {
                                    check++;
                                }
                            }
                    
                            if (check >= 1)
                            {
                                db.SaveChanges();
                                MessageBox.Show("Водитель успешно изменен");
                                check = 0;
                              _drwind.Refresh();
                              this.Close();
                            }
                    else
                    {
                        MessageBox.Show("Проверьте корректность эл.почты");
                    }

                }
          }
           catch
           {
               MessageBox.Show("Произошла ошибка");
          }


        }

        private void PhotoBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                
                OpenFileDialog ofd = new OpenFileDialog();
                ofd.Filter = "Файлы изображений (*.jpg, *.png)|*.jpg;*.png";
                ofd.ShowDialog();
                driver.Photo = ofd.FileName;
                MessageBox.Show("Файл успешно выбран");
                

            }
            catch
            {
                MessageBox.Show("Произошла ошибка");
            }

            
        }
    }
}
