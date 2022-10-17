using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Web.Stockets.VideoChats
{
    public interface IVideoService
    {
        string GetTwilioJwt(string identity);
        Task<IEnumerable<RoomDetails>> GetAllRoomsAsync();
    }
}
