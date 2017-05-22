using System;
using System.Data.Entity.Validation;

namespace Kalyan.Property.Infrastructure
{

    public class UnitOfWork : IUnitOfWork
    {
        protected string ConnectionString;
        private CustomeDbContext context;

        public UnitOfWork(string connectionString)
        {
            this.ConnectionString = "DefaultConnection";
        }

        public CustomeDbContext DbContext
        {
            get
            {
                if (context == null)
                {
                    context = new CustomeDbContext(ConnectionString);
                }
                return context;
            }
        }

        public int Save()
        {
            try
            {
                // Your code...
                // Could also be before try if you know the exception occurs in SaveChanges

                return context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }

        public void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (context != null)
                {
                    context.Dispose();
                    context = null;
                }
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
