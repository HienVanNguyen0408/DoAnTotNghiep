using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities.MOMO;

namespace Web.Infrastructure.Services.Momo
{
    public interface IMomoClient
    {
        /// <summary>
        /// Thanh toán momo
        /// </summary>
        Task<bool> PaymentMomoAsync(PaymentRequest request);
    }
}
