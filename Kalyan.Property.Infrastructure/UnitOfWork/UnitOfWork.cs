using Kalyan.Property.Infrastructure.BaseRepository;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;

namespace Kalyan.Property.Infrastructure
{

    //public class UnitOfWork : IUnitOfWork
    //{
    //    protected string ConnectionString;
    //    private CustomeDbContext context;

    //    public UnitOfWork(string connectionString)
    //    {
    //        this.ConnectionString = "DefaultConnection";
    //    }

    //    public CustomeDbContext DbContext
    //    {
    //        get
    //        {
    //            if (context == null)
    //            {
    //                context = new CustomeDbContext(ConnectionString);
    //            }
    //            return context;
    //        }
    //    }

    //    public int Save()
    //    {
    //        try
    //        {
    //            // Your code...
    //            // Could also be before try if you know the exception occurs in SaveChanges

    //            return context.SaveChanges();
    //        }
    //        catch (DbEntityValidationException e)
    //        {
    //            foreach (var eve in e.EntityValidationErrors)
    //            {
    //                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
    //                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
    //                foreach (var ve in eve.ValidationErrors)
    //                {
    //                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
    //                        ve.PropertyName, ve.ErrorMessage);
    //                }
    //            }
    //            throw;
    //        }
    //    }

    //    public void Dispose(bool disposing)
    //    {
    //        if (disposing)
    //        {
    //            if (context != null)
    //            {
    //                context.Dispose();
    //                context = null;
    //            }
    //        }
    //    }

    //    public void Dispose()
    //    {
    //        Dispose(true);
    //        GC.SuppressFinalize(this);
    //    }
    //}

    public class UnitOfWork : IUnitOfWork, IDisposable
    {

        private readonly IDictionary<Type, object> repositories;
        private CustomeDbContext context;
        private bool disposed = false;

        public UnitOfWork()
        {
            this.context = new CustomeDbContext();
            repositories = new Dictionary<Type, object>();
        }


        public IRepository<T> Repository<T>() where T : class
        {
            if (repositories.Keys.Contains(typeof(T)) == true)
            {
                return repositories[typeof(T)] as Repository<T>;
            }
            IRepository<T> repo = new Repository<T>(context);
            repositories.Add(typeof(T), repo);
            return repo;
        }

        public bool Commit()
        {
            using (var dbContextTransaction = context.Database.BeginTransaction())
            {
                try
                {
                    int affectedRows = context.SaveChanges();
                    dbContextTransaction.Commit();
                    return affectedRows > 0;
                }
                catch (DbEntityValidationException ex)
                {
                    // Retrieve the error messages as a list of strings.
                    var errorMessages = ex.EntityValidationErrors
                            .SelectMany(x => x.ValidationErrors)
                            .Select(x => x.ErrorMessage);

                    // Join the list to a single string.
                    var fullErrorMessage = string.Join("; ", errorMessages);

                    // Combine the original exception message with the new one.
                    var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                    // Throw a new DbEntityValidationException with the improved exception message.
                    throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
                }
                catch (Exception ex)
                {
                    dbContextTransaction.Rollback();

                    throw ex;
                }
            }
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
