using System.IdentityModel.Tokens.Jwt;

namespace HalloDoc_MVC.Models.CV
{
    public class CV
    {
        private static IHttpContextAccessor _contextAccessor;

        static CV()
        {
            _contextAccessor = new HttpContextAccessor();
        }

        public static string? UserName()
        {
            string cookieValue;
            string UserName = null;

            if (_contextAccessor.HttpContext.Request.Cookies["jwt"] != null)
            {
                cookieValue = _contextAccessor.HttpContext.Request.Cookies["jwt"].ToString();

                UserName = DecodedToken.DecodeJwt(DecodedToken.ConvertJwtStringToJwtSecurityToken(cookieValue)).claims.FirstOrDefault(t => t.Key == "UserName").Value;
            }

            return UserName;
        }

        public static string? UserID()
        {
            string cookieValue;
            string UserID = null;

            if (_contextAccessor.HttpContext.Request.Cookies["jwt"] != null)
            {
                cookieValue = _contextAccessor.HttpContext.Request.Cookies["jwt"].ToString();

                UserID = DecodedToken.DecodeJwt(DecodedToken.ConvertJwtStringToJwtSecurityToken(cookieValue)).claims.FirstOrDefault(t => t.Key == "UserId").Value;
            }

            return UserID;
        }
        public static string? AspNetUserID()
        {
            string cookieValue;
            string AspNetUserID = null;

            if (_contextAccessor.HttpContext.Request.Cookies["jwt"] != null)
            {
                cookieValue = _contextAccessor.HttpContext.Request.Cookies["jwt"].ToString();

                AspNetUserID = DecodedToken.DecodeJwt(DecodedToken.ConvertJwtStringToJwtSecurityToken(cookieValue)).claims.FirstOrDefault(t => t.Key == "UserID").Value;
            }

            return AspNetUserID;
        }

        //public static string? Role()
        //{
        //    string? Role = null;

        //    if (_contextAccessor.HttpContext.Session.GetString("Role") != null)
        //    {
        //        Role = _contextAccessor.HttpContext.Session.GetString("Role");

        //    }
        //    return Role;
        //}
        public static string? role()
        {
            string cookieValue;
            string role = null;

            if (_contextAccessor.HttpContext.Request.Cookies["jwt"] != null)
            {
                cookieValue = _contextAccessor.HttpContext.Request.Cookies["jwt"].ToString();

                role = DecodedToken.DecodeJwt(DecodedToken.ConvertJwtStringToJwtSecurityToken(cookieValue)).claims.FirstOrDefault(t => t.Key == "Role").Value;
            }

            return role;
        }
    }
}