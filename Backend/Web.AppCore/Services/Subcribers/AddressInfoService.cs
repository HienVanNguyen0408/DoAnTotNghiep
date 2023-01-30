using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Utils;

namespace Web.AppCore.Services
{
    public class AddressInfoService : BaseDomainService<AddressInfoService>, IAddressInfoService
    {
        #region Declaration
        private const string TAG = "AddressInfoService";
        protected readonly IAddressInfoUoW _addressInfoUoW;
        #endregion
        #region Contructor
        public AddressInfoService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _addressInfoUoW = serviceProvider.GetRequiredService<IAddressInfoUoW>();
        }


        public async Task<bool> DeleteAddressInfo(string id)
        {
            try
            {
                var resDelete = await _addressInfoUoW.AddressInfos.DeleteOneAsync(id);
                return resDelete;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<AddressInfo> GetAddressInfo(string id)
        {
            try
            {
                var addressInfo = await _addressInfoUoW.AddressInfos.GetByIdAsync(id);
                return addressInfo;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<AddressInfo> GetAddressInfoDefault(string userId)
        {
            try
            {
                var addressInfo = await _addressInfoUoW.AddressInfos.GetOneAsync(x => x.user_id == userId && x.is_default);
                return addressInfo;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<AddressInfo>> GetAddressInfos(string userId)
        {
            try
            {
                var addressInfos = await _addressInfoUoW.AddressInfos.GetAllAsync(x => x.user_id == userId);
                if (addressInfos.CountExt() <= 0) return new List<AddressInfo>();
                return addressInfos.ToList();
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public async Task<bool> InsertAddressInfo(AddressInfo addressInfo)
        {
            try
            {
                var resInsert = await _addressInfoUoW.AddressInfos.InsertOneAsync(addressInfo);
                return resInsert != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> SetDefaultAddress(string userId, string id, bool isDefault)
        {
            try
            {
                //Bỏ mặc định
                if (isDefault)
                {
                    var addressInfo = await _addressInfoUoW.AddressInfos.GetOneAsync(x => x.user_id == userId && x.id == id);
                    if (addressInfo == null) return false;
                    addressInfo.is_default = false;
                    await _addressInfoUoW.AddressInfos.UpdateOneAsync(addressInfo);
                    return true;
                }

                var addressInfos = await _addressInfoUoW.AddressInfos.GetAllAsync(x => x.user_id == userId);
                if (addressInfos.CountExt() <= 0) return false;
                foreach (var addressInfo in addressInfos)
                {
                    if (addressInfo.id == id) addressInfo.is_default = true;
                    else addressInfo.is_default = false;
                }
                await _addressInfoUoW.AddressInfos.UpdateManyAsync(addressInfos);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> UpdateAddressInfo(AddressInfo addressInfo)
        {
            try
            {
                var resUpdate = await _addressInfoUoW.AddressInfos.UpdateOneAsync(addressInfo);
                return resUpdate;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion


    }
}
