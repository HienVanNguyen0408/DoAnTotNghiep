using Microsoft.Extensions.DependencyInjection;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.Entities;
using Web.Models.Settings;
using Web.Utils;

namespace Web.AppCore.Services
{
    public class CustomerService : BaseDomainService<CustomerService>, ICustomerService
    {
        #region Declaration
        private readonly ICustomerUoW _customerUoW;
        private readonly IRedisCached _cached;
        private readonly AppSettings _appSettings;
        #endregion
        #region Contructor
        public CustomerService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _customerUoW = serviceProvider.GetRequiredService<ICustomerUoW>();
            _cached = serviceProvider.GetRequiredService<IRedisCached>();
            _appSettings = new AppSettings();
        }


        #endregion
        #region Properties

        #endregion
        #region Methods
        public async Task<bool> InsertManyCustomersAsync(List<Customer> customers)
        {
            try
            {
                await _customerUoW.Customers.InsertManyAsync(customers);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public async Task<bool> DeleteCustomerAsync(string customerId)
        {
            var filter = Builders<Customer>.Filter.Eq(x => x.CustomerId, customerId);
            var countDelete = await _customerUoW.Customers.DeleteOneAsync(filter);
            return countDelete > 0;
        }

        public async Task<bool> DeleteManyCustomerAsync(List<string> customerIds)
        {
            var filter = Builders<Customer>.Filter.In(x => x.CustomerId, customerIds);
            var countDelete = await _customerUoW.Customers.DeleteManyAsync(filter);
            return countDelete > 0;
        }

        public async Task<Customer> GetCustomerByIdAsync(string customerId)
        {
            var filter = Builders<Customer>.Filter.Eq(x => x.CustomerId, customerId);
            return await _customerUoW.Customers.GetOneAsync(filter);
        }

        public async Task<List<Customer>> GetCustomersAsync()
        {
            var filter = Builders<Customer>.Filter.Where(x => true);
            return await _customerUoW.Customers.GetAllAsync(filter);
        }

        public async Task<bool> InsertCustomerAsync(Customer customer)
        {
            try
            {
                await _customerUoW.Customers.InsertOneAsync(customer);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> UpdateCustomerAsync(string customerId, Customer customer)
        {
            var filter = Builders<Customer>.Filter.Eq(x => x.CustomerId, customerId);
            var customerDb = await _customerUoW.Customers.GetOneAsync(filter);
            UpdateDefinition<Customer> updateDefinetion = null;
            updateDefinetion = updateDefinetion.Set(s => s.ModifiedDate, DateTime.Now);
            var updateRes = await _customerUoW.Customers.UpdateOneAsync(filter, updateDefinetion);
            return updateRes;
        }

        public async Task<Pagging<Customer>> GetPaggingCustomer(Pagination pagination)
        {
            var skip = (pagination.PageIndex - 1) * pagination.PageSize;
            var take = pagination.PageSize;
            var keyCached = GetKeyCached(skip, take);
            var filter = Builders<Customer>.Filter.Empty;


            if (!pagination.Filter.IsNullOrEmptyOrWhiteSpace())
            {
                var textSearch = pagination.Filter.Trim().ToLower();
                //Sử dụng fulltext search hay không
                if (_appSettings.IsFullTextSearch)
                {
                    filter = Builders<Customer>.Filter.Text($"\"{textSearch}\"");
                }
                else
                {
                    filter = Builders<Customer>.Filter.Where(x =>
                                    x.CustomerCode.ToLower().Contains(textSearch) || x.Gender.ToLower().Contains(textSearch)
                                    || x.Contract.ToLower().Contains(textSearch) || x.PaymentMethod.ToLower().Contains(textSearch)
                            );
                }
            }


            var customers = await _customerUoW.Customers.GetPaginatedAsync(filter, sortDefinition: null, skip, take);
            if (customers == null)
            {
                return new Pagging<Customer>()
                {
                    Data = null,
                    TotalPages = 0,
                    TotalRecord = 0,
                    PageIndex = pagination.PageIndex,
                    PageSize = pagination.PageSize
                };
            }

            var totalRecord = await _customerUoW.Customers.CountDocumentNumber(filter);
            var pageResult = new Pagging<Customer>()
            {
                Data = customers,
                TotalPages = totalRecord % pagination.PageSize == 0 ? totalRecord / pagination.PageSize : totalRecord / pagination.PageSize + 1,
                TotalRecord = totalRecord,
                PageIndex = pagination.PageIndex,
                PageSize = pagination.PageSize
            };
            //Lưu cached dữ liệu customer
            //Lưu cached 1 giờ
            //var timeCached = 1 * 60 * 60;
            //await _cached.SetAsync(keyCached, pageResult, timeCached);
            return pageResult;
        }

        private void RemoveCachedCustomerPaggingAsync(int skip, int take) => _cached.Remove(GetKeyCached(skip, take));
        #endregion
    }
}
