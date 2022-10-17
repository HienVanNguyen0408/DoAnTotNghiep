using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Stockets.VideoChats
{
    public class RoomDetails
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public int ParticipantCount { get; set; }
        public int MaxParticipants { get; set; }
    }
}
