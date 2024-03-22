using HalloDoc_DAL.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class ProvidersModel
    {
        public int PhysicianId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Physician { get; set; } /*=> $"{FirstName} {LastName}";*/
        public int RoleId { get; set; }
        public string email { get; set; }
        public string msgBody { get; set; }
        public string PhoneNumber { get; set; }
        public string OnCallStatus { get; set; }
        public int Status { get; set; }
        public int RegionId { get; set; }
        public string RoleName { get; set; }
        public BitArray IsNotificationStopped { get; set; }
    }
}
