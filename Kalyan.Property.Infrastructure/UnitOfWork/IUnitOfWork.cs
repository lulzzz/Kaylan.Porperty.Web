using System;

namespace Kalyan.Property.Infrastructure
{
    public interface IUnitOfWork : IDisposable
    {
        CustomeDbContext DbContext { get; }

        int Save();
    }
}