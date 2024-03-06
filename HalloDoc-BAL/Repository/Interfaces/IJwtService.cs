using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository.Interfaces
{
    public interface IJwtService
    {
        public string GenerateJWTAuthetication(UserInfo userInfo);
        public bool ValidateToken(string token, out JwtSecurityToken jwtSecurityTokenHandler);
    }
}
