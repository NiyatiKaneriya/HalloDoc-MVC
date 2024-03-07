using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.IdentityModel.JsonWebTokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace HalloDoc_MVC.Controllers
{
    [AttributeUsage(AttributeTargets.All)]
    public class CustomAuthorize : Attribute, IAuthorizationFilter
    {
        private readonly string _role;
        public CustomAuthorize(string role = "")
        {
            _role = role;
        }
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var jwtService = context.HttpContext.RequestServices.GetService<IJwtService>();

            if(jwtService == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", action = "Index" }));
                return;
            }

            var request = context.HttpContext.Request;
            var token = request.Cookies["jwt"];

            if(token == null || !jwtService.ValidateToken(token, out JwtSecurityToken jwtToken))
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", action = "Index" }));
                return;
            }
            var roles = jwtToken.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Role);
              
            if(roles == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", action = "Index" }));
            }
            if(string.IsNullOrEmpty(_role) || roles.Value != _role)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", action = "AccessDenied" }));
            }
           
        }
    }
    
}
