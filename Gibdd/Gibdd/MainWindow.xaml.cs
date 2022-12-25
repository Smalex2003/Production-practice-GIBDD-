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
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace Gibdd
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        int kolvoavtr = 0;
        int time = 120;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(PasswordBox.Password.ToString()=="Inspector"&& LoginText.Text== "Inspector")
            {
                MessageBox.Show("Вы успешно авторизовались");
                MenuWindow wind = new MenuWindow();
                wind.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Проверьте правильность данных!");
                kolvoavtr++;
                if (kolvoavtr >= 3)
                {
                    AvtrBtn.IsEnabled = false;
                    System.Windows.Threading.DispatcherTimer timer = new System.Windows.Threading.DispatcherTimer();
                    timer.Tick += new EventHandler(Timer_Tick);
                    timer.Interval = new TimeSpan(0, 0, 1);
                    timer.Start();
                    textfortime.Visibility = Visibility.Visible;

                    if (time == 0)
                    {
                        timer.Stop();
                        AvtrBtn.IsEnabled = true;
                        textfortime.Visibility = Visibility.Hidden;
                    }
                    kolvoavtr = 0;
                }
            }
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            time--;
            timetext.Content = time + "сек";
        }

    }
}
