using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.MessageQ.Publisher;

namespace Web.AppCore.Services.MessageQueue
{
    public class PublisherQueue : IPublisherQueue
    {
        #region Declaration
        private readonly IPublisher _publisher;
        private readonly QueueNameSettings _queueNameSettings;
        #endregion

        #region Contructor
        public PublisherQueue(IPublisher publisher)
        {
            _publisher = publisher;
            _queueNameSettings = new QueueNameSettings();
        }
        #endregion

        #region Properties

        #endregion
        #region Methods

        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        /// <returns></returns>
        public async Task<bool> PublishUpdateOrderAsync(object data, IDictionary<string, object> headers = null)
        {
            await Task.CompletedTask;
            return _publisher.Publish(_queueNameSettings.QueueNameOrder, data, headers);
        }
        
        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        /// <returns></returns>
        public async Task<bool> PublishInsertOrderAsync(object data, IDictionary<string, object> headers = null)
        {
            await Task.CompletedTask;
            return _publisher.Publish(_queueNameSettings.QueueNameInsertOrder, data, headers);
        }

        /// <summary>
        /// Cập nhật lại số lượng của sản phẩm
        /// </summary>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        /// <returns></returns>
        public async Task<bool> PublishUpdateAmountProductAsync(object data, IDictionary<string, object> headers = null)
        {
            await Task.CompletedTask;
            return _publisher.Publish(_queueNameSettings.QueueNameUpdateQuantityProduct, data, headers);
        }
        #endregion
    }
}
