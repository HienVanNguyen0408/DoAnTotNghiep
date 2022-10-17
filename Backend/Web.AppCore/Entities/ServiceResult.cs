using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class ServiceResult<T>
    {
        public T Data { get; set; }

        public bool Success { get; set; } = true;

        public ServiceResultStatus Status { get; set; }

        public string Message { get; set; }
    }

    public enum ServiceResultStatus
    {
        Ok = 200,
        Created = 201,
        Accepted = 202,
        NoContent  = 204,
        BadRequest = 400,
        Authorized = 401,
        NotFound = 404,
        ServerError = 500,
        BadGateway = 502,
    }
    public enum Message
    {
        
    }
}
