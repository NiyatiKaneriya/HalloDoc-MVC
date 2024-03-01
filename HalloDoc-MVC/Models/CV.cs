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

    }
}