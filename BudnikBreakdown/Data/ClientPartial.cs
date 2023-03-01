using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BudnikBreakdown.Data
{
    public partial class Client
    {
        public override string ToString()
        {
            return $"{LastName} {FirstName} {Patronymic}";
        }

        public string PhotoPathForList
        {
            get
            {
                return @"\" + PhotoPath;
            }
            set { PhotoPath = value; }
        }
    }
}
