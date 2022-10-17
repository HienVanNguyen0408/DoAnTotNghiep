using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;
using Web.AppCore.Exceptions;

namespace Web.Api
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate _next;

        public ErrorHandlingMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private static Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            //HttpStatusCode status;
            //string message;
            var response = new
            {
                devMsg = exception.Message,
                userMsg = "Có lỗi xảy ra vui lòng liên hệ Văn Hiến",
                Code = "002",
                Data = exception.Data
            };

            if(exception is ClientException)
            {
                response = new
                {
                    devMsg = exception.Message,
                    userMsg = exception.Message,
                    Code = "001",
                    Data = exception.Data
                };
                context.Response.StatusCode = 400;
            }
            else
            {
                response = new
                {
                    devMsg = exception.Message,
                    userMsg = "Có lỗi xảy ra vui lòng liên hệ Văn Hiến",
                    Code = "003",
                    Data = exception.Data
                };
                context.Response.StatusCode = 500;

            }
            var result = JsonSerializer.Serialize(response);
            context.Response.ContentType = "application/json";
            return context.Response.WriteAsync(result);
        }
    }
}
