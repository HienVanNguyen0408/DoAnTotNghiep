using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Services
{
    public interface IAddressInfoService
    {
        Task<List<AddressInfo>> GetAddressInfos(string userId);
        Task<AddressInfo> GetAddressInfo(string id);
        Task<bool> UpdateAddressInfo(AddressInfo addressInfo);
        Task<bool> InsertAddressInfo(AddressInfo addressInfo);
        Task<bool> DeleteAddressInfo(string id);

    }
}
