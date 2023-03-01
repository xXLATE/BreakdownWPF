﻿using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using BudnikBreakdown.Data;
using Microsoft.Win32;

namespace BudnikBreakdown.Pages
{
    /// <summary>
    /// Interaction logic for ClientPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        public Client Client { get; set; }
        public List<Gender> Genders { get; set; }

        public List<Service> Services { get; set; }
        public ClientPage(Client client)
        {
            InitializeComponent();
            Client = client;
            Genders = DataAccess.GetGenders();
            Services = DataAccess.GetServices();
            if (client.ID == 0)
                btnDelete.Visibility = Visibility.Collapsed;

            DataContext = this;
        }

        private void btnChangePhoto_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog().Value == true)
            {
                Client.Photo = File.ReadAllBytes(openFileDialog.FileName);
                ClientImage.Source = new BitmapImage(new Uri(openFileDialog.FileName));
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите удалить клиента?", "Предупреждение", MessageBoxButton.OKCancel, MessageBoxImage.Question) == MessageBoxResult.OK)
            {
                DataAccess.DeleteClient(Client);
                NavigationService.GoBack();
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            var stringBuilder = new StringBuilder();

            if (string.IsNullOrEmpty(Client.FirstName))
                stringBuilder.AppendLine("Введите имя");
            if (string.IsNullOrEmpty(Client.LastName))
                stringBuilder.AppendLine("Введите фамилию");
            if (string.IsNullOrEmpty(Client.Phone))
                stringBuilder.AppendLine("Введите телефон");
            if (Client.Gender == null)
                stringBuilder.AppendLine("Выберите пол");

            if (stringBuilder.Length > 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Ошибка",MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }


            DataAccess.SaveClient(Client);
            NavigationService.GoBack();
        }

        private void lvServices_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var service = lvServices.SelectedItem as ClientService;
            if (service != null)
            {
                if(!(bool)(new Windows.ChangeServiceWindow(service)).ShowDialog())
                {
                    Client.ClientServices.Remove(service);
                    lvServices.ItemsSource = Client.ClientServices;
                    lvServices.Items.Refresh();
                };
            }
        }

        private void cbService_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var service = cbService.SelectedItem as Service;
            if (service != null)
            {
                Client.ClientServices.Add(new ClientService { Client = Client, Service = service, StartTime = DateTime.Now });
                lvServices.ItemsSource = Client.ClientServices;
                lvServices.Items.Refresh();
            }

        }

        private void cbService_TextChanged(object sender, TextChangedEventArgs e)
        {
            cbService.ItemsSource = Services.Where(p => p.Title.ToLower().Contains(cbService.Text.ToLower())).ToList();
            cbService.IsDropDownOpen = true;
        }
    }
}
