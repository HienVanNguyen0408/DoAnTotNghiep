using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Web.Stockets.VideoChats;

namespace Web.Api.Controllers
{
    [ApiController]
    [Route("api/v1/[Controller]")]
    public class VideoChatsController : BaseAuthController<VideoChatsController>
    {
        protected readonly IVideoService _videoService;
        public VideoChatsController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _videoService = GetRequiredService<IVideoService>();
        }

        [HttpGet("token")]
        public IActionResult GetToken()  => new JsonResult(new { token = _videoService.GetTwilioJwt(User.Identity.Name) });

        [HttpGet("rooms")]
        public async Task<IActionResult> GetRooms() => new JsonResult(await _videoService.GetAllRoomsAsync());

    }
}
