using MongoDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class DbShareRepo<TDocument> : IDbShareRepo<TDocument> where TDocument : IDocument
    {
        #region Declaration
        private readonly MongoDbSettings _mongoDbSettings;
        #endregion


        #region Properties

        #endregion

        #region Contructor
        public DbShareRepo(MongoDbSettings mongoDbSettings)
        {
            _mongoDbSettings  = mongoDbSettings;
        }
        #endregion

        #region Methods

        #endregion
    }
}
