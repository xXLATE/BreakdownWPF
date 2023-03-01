using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BudnikBreakdown.Data
{
    public partial class BreakdownDBEntities
    {
        private static BreakdownDBEntities _context;
        public static BreakdownDBEntities GetContext()
        {
            if( _context == null )
                _context = new BreakdownDBEntities();

            return _context;
        }
    }
}
