using System;
using System.Collections.Generic;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Web.Stockets
{
    public abstract class WebSocketHandler
    {
        protected ConnectionManager WebSocketConnectionManager { get; set; }

        public WebSocketHandler(ConnectionManager webSocketConnectionManager)
        {
            WebSocketConnectionManager = webSocketConnectionManager;
        }

        /// <summary>
        /// Kết nối web stockets
        /// </summary>
        /// <param name="socket"></param>
        /// <returns></returns>
        public virtual async Task OnConnected(WebSocket socket)
        {
            WebSocketConnectionManager.AddSocket(socket);
        }

        public virtual async Task OnDisconnected(WebSocket socket)
        {
            await WebSocketConnectionManager.RemoveSocket(WebSocketConnectionManager.GetId(socket));
        }

        public async Task SendMessageAsync(WebSocket socket, string message)
        {
            if (socket.State != WebSocketState.Open)
                return;

            await socket.SendAsync(buffer: new ArraySegment<byte>(array: Encoding.ASCII.GetBytes(message),
                                                                    offset: 0,
                                                                    count: message.Length),
                                    messageType: WebSocketMessageType.Text,
                                    endOfMessage: true,
                                    cancellationToken: CancellationToken.None);
        }

        /// <summary>
        /// Gửi message
        /// </summary>
        /// <param name="socketId">stocket id</param>
        /// <param name="message">Tin nhắn</param>
        /// <returns></returns>
        public async Task SendMessageAsync(string socketId, string message)
        {
            await SendMessageAsync(WebSocketConnectionManager.GetSocketById(socketId), message);
        }

        /// <summary>
        /// Send message to all
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public async Task SendMessageToAllAsync(string message)
        {
            foreach (var pair in WebSocketConnectionManager.GetAll())
            {
                if (pair.Value.State == WebSocketState.Open)
                    await SendMessageAsync(pair.Value, message);
            }
        }

        /// <summary>
        /// Nhân tin nhắn
        /// </summary>
        /// <param name="socket"></param>
        /// <param name="result"></param>
        /// <param name="buffer"></param>
        /// <returns></returns>
        public abstract Task ReceiveAsync(WebSocket socket, WebSocketReceiveResult result, byte[] buffer);
    }
}
