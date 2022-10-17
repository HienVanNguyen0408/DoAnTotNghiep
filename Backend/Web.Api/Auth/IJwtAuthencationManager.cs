using System.Threading.Tasks;
using Web.Api.Controllers;
using Web.Models.Request;

namespace Web.Api.Auth
{
    public interface IJwtAuthencationManager
    {
        Task<string> Autheticate(UserRequest user);
        string GetToken(UserRequest user);
    }
}
