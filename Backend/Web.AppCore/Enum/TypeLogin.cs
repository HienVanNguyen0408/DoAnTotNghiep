using System;
using System.Collections.Generic;
using System.Text;

namespace Web.AppCore.Enum
{
    public enum TypeLogin
    {
        /// <summary>
        /// Đăng nhập bằng số điện thoại và mật khẩu, hoặc tài khoản
        /// </summary>
        Normal = 0,

        /// <summary>
        /// Đăng nhập bằng tài khoản Google
        /// </summary>
        Google = 1, 

        /// <summary>
        /// Đăng nhập bằng facebook
        /// </summary>
        Facebok = 2,    

        /// <summary>
        /// Đăng nhập bằng gihub
        /// </summary>
        Github = 3 ,
    }
}
