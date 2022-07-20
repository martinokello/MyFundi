using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyFundi.Web.ViewModels
{
    public class JobWorkCategoryViewModel
    {
        public int JobWorkCategoryId { get; set; }
        public int JobId { get; set; }
        public int WorkCategoryId { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;
        public DateTime DateUpdated { get; set; } = DateTime.Now;
    }
}
