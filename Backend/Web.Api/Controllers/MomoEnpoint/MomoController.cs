using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.Infrastructure.Services.Momo;
using Web.Models.Entities.MOMO;

namespace Web.Api.Controllers
{
    public class MomoController : BaseAuthController<MomoController>
    {
        #region Declaration
        private const string TAG = "MomoController";
        protected readonly IMomoClient _momo;
        #endregion
        #region contructor
        public MomoController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _momo = GetRequiredService<IMomoClient>();
        }
        #endregion

        #region Properties
        #endregion

        #region Methods
        [HttpPost("payment-momo")]
        public async Task<bool> PaymentMomoAsync()
        {
            var xxx = await _momo.PaymentMomoAsync(new PaymentRequest());
            return false;
        }
        #endregion

    }
}
