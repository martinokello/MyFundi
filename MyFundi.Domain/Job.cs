using System;
using System.Collections.Generic;
using System.Text;

namespace MyFundi.Domain
{
    public class Job
    {
        public int JobId { get; set; }
        public string JobDescription { get; set; }
        public int LocationId { get; set; }
        public int ClientProfileId { get; set; }
        public Guid ClientUserId { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;
        public DateTime DateUpdated { get; set; } = DateTime.Now;
        public bool HasCompleted { get; set; }
        public int ClientFundiContractId { get; set; }
       
    }
}
