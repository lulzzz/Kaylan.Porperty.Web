using Kalyan.Property.Infrastructure.BaseRepository;
using System;

namespace Kalyan.Property.Infrastructure
{
    public interface IUnitOfWork : IDisposable
    {

        IRepository<TEntity> Repository<TEntity>()
                where TEntity : class;

        bool Commit();
    }
}