using MyFundi.Domain;
using MyFundi.Services.RepositoryServices.Abstracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyFundi.Services.RepositoryServices.Concretes
{
   public class JobWorkCategoryRepository: AbstractRepository<JobWorkCategory>
    {
        public override bool Delete(JobWorkCategory toDelete)
        {
            try
            {
                toDelete = GetById(toDelete.JobWorkCategoryId);
                MyFundiDBContext.Remove(toDelete);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public override JobWorkCategory GetByGuid(Guid id)
        {
            throw new NotImplementedException();
        }

        public override JobWorkCategory GetById(int id)
        {
            return MyFundiDBContext.JobWorkCategories.SingleOrDefault(p => p.JobWorkCategoryId == id);
        }

        public override bool Update(JobWorkCategory toUpdate)
        {
            try
            {
                var item = GetById(toUpdate.JobWorkCategoryId);

                item.JobId = toUpdate.JobId;
                item.WorkCategoryId = toUpdate.WorkCategoryId;
                item.DateUpdated = DateTime.Now;
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
