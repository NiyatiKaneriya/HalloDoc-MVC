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
            string? UserName = null;
            if (_contextAccessor.HttpContext.Session.GetString("UserName") != null)
            {
                UserName = _contextAccessor.HttpContext.Session.GetString("UserName").ToString();
            }
            return UserName;
        }

        public static string? UserID()
        {
            string? UserID = null;

            if (_contextAccessor.HttpContext.Session.GetString("UserID") != null)
            {
                UserID = _contextAccessor.HttpContext.Session.GetString("UserID");

            }
            return UserID;
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
            string cookieValue = _contextAccessor.HttpContext.Request.Cookies["jwt"];
            var handler = new JwtSecurityTokenHandler();

            var jsonToken = handler.ReadToken(cookieValue);
            var tokenS = jsonToken as JwtSecurityToken;
            var jti = tokenS.Claims.First(claim => claim.Type == "UserId").Value;
            return "ed";
        }
    }
}