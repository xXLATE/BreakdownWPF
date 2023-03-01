using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BudnikBreakdown.Data
{
    public class DataAccess
    {
        public delegate void RefreshListDelegate();
        public static event RefreshListDelegate RefreshList;

        public static List<Client> GetClients()
        {
            return BreakdownDBEntities.GetContext().Clients.ToList();
        }

        public static List<Service> GetServices()
        {
            return BreakdownDBEntities.GetContext().Services.ToList();
        }

        public static List<Gender> GetGenders()
        {
            return BreakdownDBEntities.GetContext().Genders.ToList();
        }

        public static void SaveClient(Client client)
        {
            if (client.ID == 0)
                BreakdownDBEntities.GetContext().Clients.Add(client);

            BreakdownDBEntities.GetContext().SaveChanges();
            RefreshList?.Invoke();
        }

        public static void DeleteClient(Client client)
        {
            BreakdownDBEntities.GetContext().Clients.Remove(client);
            BreakdownDBEntities.GetContext().SaveChanges();
            RefreshList?.Invoke();
        }
    }
}
