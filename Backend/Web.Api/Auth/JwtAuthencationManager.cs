using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Ultility;
using Web.Models.Entities;
using Web.Models.Request;
using Web.Models.Settings;

namespace Web.Api.Auth
{
    public class JwtAuthencationManager  : IJwtAuthencationManager
    {
        private const string TAG = "JwtAuthencationManager";
        private readonly JwtSettings _jwtSettings;
        protected readonly IUserService _userService;
        protected readonly ILogger<JwtAuthencationManager> _logger;
        public JwtAuthencationManager(IUserService userService, ILogger<JwtAuthencationManager> logger, IOptions<JwtSettings> options)
        {
            _jwtSettings = options.Value;
            _userService = userService;
            _logger = logger;
        }

        public async Task<string> Autheticate(UserRequest userRequest)
        {
            try
            {
                var users = await _userService.GetUsersAsync();
                if (userRequest.IsLoginGoogle)
                {
                    if (!users.Any(x => x.user_name.Equals(userRequest.UserName) && x.email.Equals(userRequest.Email)))
                    {
                        var userEntity = new User();
                        userEntity = userEntity.ConvertData(userRequest);
                        // Register
                        await _userService.InsertUserAsync(userEntity);
                    }
                    return GetToken(userRequest);
                }
                if (!users.Any(x => x.user_name == userRequest.UserName && x.password == userRequest.Password))
                {
                    return null;
                }
                return GetToken(userRequest);
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm Autheticate::Exception::{ex.Message}");
                return String.Empty;
            }
        }

        public string GetToken(UserRequest user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var tokenKey = Encoding.ASCII.GetBytes(_jwtSettings.Key);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name,user.UserName),
                    new Claim(ClaimTypes.Role, $"{user.RoleType}"),
                    new Claim(ClaimTypes.Expired, $"{_jwtSettings.ExpireDate}")
                }),
                Expires = DateTime.UtcNow.AddHours(_jwtSettings.ExpireDate),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(tokenKey),
                    SecurityAlgorithms.HmacSha256Signature),
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

    }
}
