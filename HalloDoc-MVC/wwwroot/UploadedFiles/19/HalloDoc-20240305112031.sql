toc.dat                                                                                             0000600 0004000 0002000 00000303277 14567624677 0014503 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       
                |            HalloDoc    16.1    16.0    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         [           1262    16439    HalloDoc    DATABASE     }   CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "HalloDoc";
                postgres    false         �            1259    16508    Admin    TABLE     �  CREATE TABLE public."Admin" (
    "AdminId" integer NOT NULL,
    "AspNetUserId" character varying(128) NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" boolean,
    "RoleId" integer
);
    DROP TABLE public."Admin";
       public         heap    postgres    false         �            1259    16577    AdminRegion    TABLE     �   CREATE TABLE public."AdminRegion" (
    "AdminRegionId" integer NOT NULL,
    "AdminId" integer NOT NULL,
    "RegionId" integer NOT NULL
);
 !   DROP TABLE public."AdminRegion";
       public         heap    postgres    false         �            1259    16576    AdminRegion_AdminRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."AdminRegion_AdminRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."AdminRegion_AdminRegionId_seq";
       public          postgres    false    226         \           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."AdminRegion_AdminRegionId_seq" OWNED BY public."AdminRegion"."AdminRegionId";
          public          postgres    false    225         �            1259    16507    Admin_AdminId_seq    SEQUENCE     �   CREATE SEQUENCE public."Admin_AdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Admin_AdminId_seq";
       public          postgres    false    218         ]           0    0    Admin_AdminId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Admin_AdminId_seq" OWNED BY public."Admin"."AdminId";
          public          postgres    false    217         �            1259    16502    AspNetRoles    TABLE     |   CREATE TABLE public."AspNetRoles" (
    "Id" character varying(128) NOT NULL,
    "Name" character varying(256) NOT NULL
);
 !   DROP TABLE public."AspNetRoles";
       public         heap    postgres    false         �            1259    16495    AspNetUsers    TABLE     w  CREATE TABLE public."AspNetUsers" (
    "Id" character varying(128) NOT NULL,
    "UserName" character varying(256) NOT NULL,
    "PasswordHash" character varying,
    "Email" character varying(256),
    "PhoneNumber" character varying,
    "IP" character varying(20),
    "ModifiedDate" timestamp without time zone,
    "CreatedDate" timestamp without time zone NOT NULL
);
 !   DROP TABLE public."AspNetUsers";
       public         heap    postgres    false         �            1259    16547    BlockRequests    TABLE     �  CREATE TABLE public."BlockRequests" (
    "BlockRequestId" integer NOT NULL,
    "PhoneNumber" character varying(50),
    "Email" character varying(50),
    "IsActive" bit(1),
    "Reason" character varying,
    "RequestId" character varying(50) NOT NULL,
    "IP" character varying(20),
    "CreatedDate" timestamp without time zone,
    "ModifiedDate" timestamp without time zone
);
 #   DROP TABLE public."BlockRequests";
       public         heap    postgres    false         �            1259    16546     BlockRequests_BlockRequestId_seq    SEQUENCE     �   CREATE SEQUENCE public."BlockRequests_BlockRequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."BlockRequests_BlockRequestId_seq";
       public          postgres    false    220         ^           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."BlockRequests_BlockRequestId_seq" OWNED BY public."BlockRequests"."BlockRequestId";
          public          postgres    false    219         �            1259    16594    Business    TABLE     �  CREATE TABLE public."Business" (
    "BusinessId" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(50),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "PhoneNumber" character varying(20),
    "FaxNumber" character varying(20),
    "IsRegistered" bit(1),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20)
);
    DROP TABLE public."Business";
       public         heap    postgres    false         �            1259    16593    Business_BusinessId_seq    SEQUENCE     �   CREATE SEQUENCE public."Business_BusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Business_BusinessId_seq";
       public          postgres    false    228         _           0    0    Business_BusinessId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Business_BusinessId_seq" OWNED BY public."Business"."BusinessId";
          public          postgres    false    227         �            1259    16563    CaseTag    TABLE     o   CREATE TABLE public."CaseTag" (
    "CaseTagId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
    DROP TABLE public."CaseTag";
       public         heap    postgres    false         �            1259    16562    CaseTag_CaseTagId_seq    SEQUENCE     �   CREATE SEQUENCE public."CaseTag_CaseTagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."CaseTag_CaseTagId_seq";
       public          postgres    false    222         `           0    0    CaseTag_CaseTagId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."CaseTag_CaseTagId_seq" OWNED BY public."CaseTag"."CaseTagId";
          public          postgres    false    221         �            1259    16623 	   Concierge    TABLE     �  CREATE TABLE public."Concierge" (
    "ConciergeId" integer NOT NULL,
    "ConciergeName" character varying(100) NOT NULL,
    "Address" character varying(150),
    "Street" character varying(50) NOT NULL,
    "City" character varying(50) NOT NULL,
    "State" character varying(50) NOT NULL,
    "ZipCode" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "IP" character varying(20)
);
    DROP TABLE public."Concierge";
       public         heap    postgres    false         �            1259    16622    Concierge_ConciergeId_seq    SEQUENCE     �   CREATE SEQUENCE public."Concierge_ConciergeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Concierge_ConciergeId_seq";
       public          postgres    false    230         a           0    0    Concierge_ConciergeId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Concierge_ConciergeId_seq" OWNED BY public."Concierge"."ConciergeId";
          public          postgres    false    229         �            1259    16656    EmailLog    TABLE     4  CREATE TABLE public."EmailLog" (
    "EmailLogID" numeric(9,0) NOT NULL,
    "EmailTemplate" character varying,
    "SubjectName" character varying(200) NOT NULL,
    "EmailID" character varying(200) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "FilePath" character varying,
    "RoleId" integer,
    "RequestId" integer,
    "AdminId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsEmailSent" bit(1),
    "SentTries" integer,
    "Action" integer
);
    DROP TABLE public."EmailLog";
       public         heap    postgres    false         �            1259    16664    HealthProfessionalType    TABLE     �   CREATE TABLE public."HealthProfessionalType" (
    "HealthProfessionalId" integer NOT NULL,
    "ProfessionName" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsActive" bit(1),
    "IsDeleted" bit(1)
);
 ,   DROP TABLE public."HealthProfessionalType";
       public         heap    postgres    false         �            1259    16663 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE     �   CREATE SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq";
       public          postgres    false    234         b           0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq" OWNED BY public."HealthProfessionalType"."HealthProfessionalId";
          public          postgres    false    233         �            1259    16671    HealthProfessionals    TABLE     �  CREATE TABLE public."HealthProfessionals" (
    "VendorId" integer NOT NULL,
    "VendorName" character varying(100) NOT NULL,
    "Profession" integer,
    "FaxNumber" character varying(50) NOT NULL,
    "Address" character varying(150),
    "City" character varying(100),
    "State" character varying(50),
    "Zip" character varying(50),
    "RegionId" integer,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedDate" timestamp without time zone,
    "PhoneNumber" character varying(100),
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "Email" character varying(50),
    "BusinessContact" character varying(100)
);
 )   DROP TABLE public."HealthProfessionals";
       public         heap    postgres    false         �            1259    16670     HealthProfessionals_VendorId_seq    SEQUENCE     �   CREATE SEQUENCE public."HealthProfessionals_VendorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."HealthProfessionals_VendorId_seq";
       public          postgres    false    236         c           0    0     HealthProfessionals_VendorId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."HealthProfessionals_VendorId_seq" OWNED BY public."HealthProfessionals"."VendorId";
          public          postgres    false    235         
           1259    16932    Menu    TABLE     �   CREATE TABLE public."Menu" (
    "MenuId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "SortOrder" integer,
    CONSTRAINT "Menu_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);
    DROP TABLE public."Menu";
       public         heap    postgres    false         	           1259    16931    Menu_MenuId_seq    SEQUENCE     �   CREATE SEQUENCE public."Menu_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Menu_MenuId_seq";
       public          postgres    false    266         d           0    0    Menu_MenuId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Menu_MenuId_seq" OWNED BY public."Menu"."MenuId";
          public          postgres    false    265         �            1259    16685    OrderDetails    TABLE     u  CREATE TABLE public."OrderDetails" (
    "Id" integer NOT NULL,
    "VendorId" integer,
    "RequestId" integer,
    "FaxNumber" character varying(50),
    "Email" character varying(50),
    "BusinessContact" character varying(100),
    "Prescription" text,
    "NoOfRefill" integer,
    "CreatedDate" timestamp without time zone,
    "CreatedBy" character varying(100)
);
 "   DROP TABLE public."OrderDetails";
       public         heap    postgres    false         �            1259    16684    OrderDetails_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."OrderDetails_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."OrderDetails_Id_seq";
       public          postgres    false    238         e           0    0    OrderDetails_Id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."OrderDetails_Id_seq" OWNED BY public."OrderDetails"."Id";
          public          postgres    false    237         �            1259    16694 	   Physician    TABLE       CREATE TABLE public."Physician" (
    "PhysicianId" integer NOT NULL,
    "Id" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "MedicalLicense" character varying(500),
    "Photo" character varying(100),
    "AdminNotes" character varying(500),
    "IsAgreementDoc" bit(1),
    "IsBackgroundDoc" bit(1),
    "IsTrainingDoc" bit(1),
    "IsNonDisclosureDoc" bit(1),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "BusinessName" character varying(100) NOT NULL,
    "BusinessWebsite" character varying(200) NOT NULL,
    "IsDeleted" bit(1),
    "RoleId" integer,
    "NPINumber" character varying(500),
    "IsLicenseDoc" bit(1),
    "Signature" character varying(100),
    "IsCredentialDoc" bit(1),
    "IsTokenGenerate" bit(1),
    "SyncEmailAddress" character varying(50)
);
    DROP TABLE public."Physician";
       public         heap    postgres    false                    1259    17015    PhysicianLocation    TABLE     .  CREATE TABLE public."PhysicianLocation" (
    "LocationId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6),
    "CreatedDate" timestamp without time zone,
    "PhysicianName" character varying(50),
    "Address" character varying(500)
);
 '   DROP TABLE public."PhysicianLocation";
       public         heap    postgres    false                    1259    17014     PhysicianLocation_LocationId_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianLocation_LocationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."PhysicianLocation_LocationId_seq";
       public          postgres    false    277         f           0    0     PhysicianLocation_LocationId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."PhysicianLocation_LocationId_seq" OWNED BY public."PhysicianLocation"."LocationId";
          public          postgres    false    276         �            1259    16718    PhysicianNotification    TABLE     �   CREATE TABLE public."PhysicianNotification" (
    id integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "IsNotificationStopped" bit(1) NOT NULL
);
 +   DROP TABLE public."PhysicianNotification";
       public         heap    postgres    false         �            1259    16717    PhysicianNotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianNotification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."PhysicianNotification_id_seq";
       public          postgres    false    242         g           0    0    PhysicianNotification_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."PhysicianNotification_id_seq" OWNED BY public."PhysicianNotification".id;
          public          postgres    false    241         �            1259    16730    PhysicianRegion    TABLE     �   CREATE TABLE public."PhysicianRegion" (
    "PhysicianRegionId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "RegionId" integer NOT NULL
);
 %   DROP TABLE public."PhysicianRegion";
       public         heap    postgres    false         �            1259    16729 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq";
       public          postgres    false    244         h           0    0 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq" OWNED BY public."PhysicianRegion"."PhysicianRegionId";
          public          postgres    false    243         �            1259    16693    Physician_PhysicianId_seq    SEQUENCE     �   CREATE SEQUENCE public."Physician_PhysicianId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Physician_PhysicianId_seq";
       public          postgres    false    240         i           0    0    Physician_PhysicianId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Physician_PhysicianId_seq" OWNED BY public."Physician"."PhysicianId";
          public          postgres    false    239         �            1259    16570    Region    TABLE     �   CREATE TABLE public."Region" (
    "RegionId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Abbreviation" character varying(50)
);
    DROP TABLE public."Region";
       public         heap    postgres    false         �            1259    16569    Region_RegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."Region_RegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Region_RegionId_seq";
       public          postgres    false    224         j           0    0    Region_RegionId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Region_RegionId_seq" OWNED BY public."Region"."RegionId";
          public          postgres    false    223         �            1259    16747    Request    TABLE     ,  CREATE TABLE public."Request" (
    "RequestId" integer NOT NULL,
    "RequestTypeId" integer NOT NULL,
    "UserId" integer,
    "FirstName" character varying(100),
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Email" character varying(50),
    "Status" smallint NOT NULL,
    "PhysicianId" integer,
    "ConfirmationNumber" character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsDeleted" bit(1),
    "ModifiedDate" timestamp without time zone,
    "DeclinedBy" character varying(250),
    "IsUrgentEmailSent" bit(1),
    "LastWellnessDate" timestamp without time zone,
    "IsMobile" bit(1),
    "CallType" smallint,
    "CompletedByPhysician" bit(1),
    "LastReservationDate" timestamp without time zone,
    "AcceptedDate" timestamp without time zone,
    "RelationName" character varying(100),
    "CaseNumber" character varying(50),
    "IP" character varying(20),
    "CaseTag" character varying(50),
    "CaseTagPhysician" character varying(50),
    "PatientAccountId" character varying(128),
    "CreatedUserId" integer,
    CONSTRAINT "Request_RequestTypeId_check" CHECK (("RequestTypeId" = ANY (ARRAY[1, 2, 3, 4]))),
    CONSTRAINT "Request_Status_check" CHECK (("Status" = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])))
);
    DROP TABLE public."Request";
       public         heap    postgres    false         �            1259    16768    RequestBusiness    TABLE     �   CREATE TABLE public."RequestBusiness" (
    "RequestBusinessId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "BusinessId" integer NOT NULL,
    "IP" character varying(20)
);
 %   DROP TABLE public."RequestBusiness";
       public         heap    postgres    false         �            1259    16767 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestBusiness_RequestBusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."RequestBusiness_RequestBusinessId_seq";
       public          postgres    false    248         k           0    0 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."RequestBusiness_RequestBusinessId_seq" OWNED BY public."RequestBusiness"."RequestBusinessId";
          public          postgres    false    247         �            1259    16785    RequestClient    TABLE     �  CREATE TABLE public."RequestClient" (
    "RequestClientId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Location" character varying(100),
    "Address" character varying(500),
    "RegionId" integer,
    "NotiMobile" character varying(20),
    "NotiEmail" character varying(50),
    "Notes" character varying(500),
    "Email" character varying(50),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "ZipCode" character varying(10),
    "CommunicationType" smallint,
    "RemindReservationCount" smallint,
    "RemindHouseCallCount" smallint,
    "IsSetFollowupSent" smallint,
    "IP" character varying(20),
    "IsReservationReminderSent" smallint,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6)
);
 #   DROP TABLE public."RequestClient";
       public         heap    postgres    false         �            1259    16784 !   RequestClient_RequestClientId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestClient_RequestClientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."RequestClient_RequestClientId_seq";
       public          postgres    false    250         l           0    0 !   RequestClient_RequestClientId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."RequestClient_RequestClientId_seq" OWNED BY public."RequestClient"."RequestClientId";
          public          postgres    false    249         �            1259    16833    RequestClosed    TABLE       CREATE TABLE public."RequestClosed" (
    "RequestClosedId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "RequestStatusLogId" integer NOT NULL,
    "PhyNotes" character varying(500),
    "ClientNotes" character varying(500),
    "IP" character varying(20)
);
 #   DROP TABLE public."RequestClosed";
       public         heap    postgres    false         �            1259    16832 !   RequestClosed_RequestClosedId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestClosed_RequestClosedId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."RequestClosed_RequestClosedId_seq";
       public          postgres    false    254         m           0    0 !   RequestClosed_RequestClosedId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."RequestClosed_RequestClosedId_seq" OWNED BY public."RequestClosed"."RequestClosedId";
          public          postgres    false    253                     1259    16852    RequestConcierge    TABLE     �   CREATE TABLE public."RequestConcierge" (
    "Id" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "ConciergeId" integer NOT NULL,
    "IP" character varying(20)
);
 &   DROP TABLE public."RequestConcierge";
       public         heap    postgres    false         �            1259    16851    RequestConcierge_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestConcierge_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."RequestConcierge_Id_seq";
       public          postgres    false    256         n           0    0    RequestConcierge_Id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RequestConcierge_Id_seq" OWNED BY public."RequestConcierge"."Id";
          public          postgres    false    255                    1259    16869    RequestNotes    TABLE     .  CREATE TABLE public."RequestNotes" (
    "RequestNotesId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "PhysicianNotes" character varying(500),
    "AdminNotes" character varying(500),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IP" character varying(20),
    "AdministrativeNotes" character varying(500)
);
 "   DROP TABLE public."RequestNotes";
       public         heap    postgres    false                    1259    16868    RequestNotes_RequestNotesId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestNotes_RequestNotesId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."RequestNotes_RequestNotesId_seq";
       public          postgres    false    258         o           0    0    RequestNotes_RequestNotesId_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."RequestNotes_RequestNotesId_seq" OWNED BY public."RequestNotes"."RequestNotesId";
          public          postgres    false    257         �            1259    16804    RequestStatusLog    TABLE     �  CREATE TABLE public."RequestStatusLog" (
    "RequestStatusLogId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "Status" smallint NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "TransToPhysicianId" integer,
    "Notes" character varying(500),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20),
    "TransToAdmin" bit(1)
);
 &   DROP TABLE public."RequestStatusLog";
       public         heap    postgres    false         �            1259    16803 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq";
       public          postgres    false    252         p           0    0 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq" OWNED BY public."RequestStatusLog"."RequestStatusLogId";
          public          postgres    false    251                    1259    16893    RequestType    TABLE     w   CREATE TABLE public."RequestType" (
    "RequestTypeId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
 !   DROP TABLE public."RequestType";
       public         heap    postgres    false                    1259    16892    RequestType_RequestTypeId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestType_RequestTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."RequestType_RequestTypeId_seq";
       public          postgres    false    260         q           0    0    RequestType_RequestTypeId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."RequestType_RequestTypeId_seq" OWNED BY public."RequestType"."RequestTypeId";
          public          postgres    false    259                    1259    16900    RequestWiseFile    TABLE     �  CREATE TABLE public."RequestWiseFile" (
    "RequestWiseFileID" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FileName" character varying(500) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "DocType" smallint,
    "IsFrontSide" bit(1),
    "IsCompensation" bit(1),
    "IP" character varying(20),
    "IsFinalize" bit(1),
    "IsDeleted" bit(1),
    "IsPatientRecords" bit(1)
);
 %   DROP TABLE public."RequestWiseFile";
       public         heap    postgres    false                    1259    16899 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq";
       public          postgres    false    262         r           0    0 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq" OWNED BY public."RequestWiseFile"."RequestWiseFileID";
          public          postgres    false    261         �            1259    16746    Request_RequestId_seq    SEQUENCE     �   CREATE SEQUENCE public."Request_RequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Request_RequestId_seq";
       public          postgres    false    246         s           0    0    Request_RequestId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Request_RequestId_seq" OWNED BY public."Request"."RequestId";
          public          postgres    false    245                    1259    16924    Role    TABLE     �  CREATE TABLE public."Role" (
    "RoleId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IsDeleted" bit(1) NOT NULL,
    "IP" character varying(20),
    CONSTRAINT "Role_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);
    DROP TABLE public."Role";
       public         heap    postgres    false                    1259    16940    RoleMenu    TABLE     �   CREATE TABLE public."RoleMenu" (
    "RoleMenuId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "MenuId" integer NOT NULL
);
    DROP TABLE public."RoleMenu";
       public         heap    postgres    false                    1259    16939    RoleMenu_RoleMenuId_seq    SEQUENCE     �   CREATE SEQUENCE public."RoleMenu_RoleMenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."RoleMenu_RoleMenuId_seq";
       public          postgres    false    268         t           0    0    RoleMenu_RoleMenuId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RoleMenu_RoleMenuId_seq" OWNED BY public."RoleMenu"."RoleMenuId";
          public          postgres    false    267                    1259    16923    Role_RoleId_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_RoleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Role_RoleId_seq";
       public          postgres    false    264         u           0    0    Role_RoleId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Role_RoleId_seq" OWNED BY public."Role"."RoleId";
          public          postgres    false    263                    1259    17007    SMSLog    TABLE     �  CREATE TABLE public."SMSLog" (
    "SMSLogID" numeric(9,0) NOT NULL,
    "SMSTemplate" character varying NOT NULL,
    "MobileNumber" character varying(50) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "RoleId" integer,
    "AdminId" integer,
    "RequestId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsSMSSent" bit(1),
    "SentTries" integer NOT NULL,
    "Action" integer
);
    DROP TABLE public."SMSLog";
       public         heap    postgres    false                    1259    16957    Shift    TABLE     c  CREATE TABLE public."Shift" (
    "ShiftId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "StartDate" date NOT NULL,
    "IsRepeat" bit(1) NOT NULL,
    "WeekDays" character(7),
    "RepeatUpto" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20)
);
    DROP TABLE public."Shift";
       public         heap    postgres    false                    1259    16974    ShiftDetail    TABLE     "  CREATE TABLE public."ShiftDetail" (
    "ShiftDetailId" integer NOT NULL,
    "ShiftId" integer NOT NULL,
    "ShiftDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL,
    "Status" smallint NOT NULL,
    "IsDeleted" bit(1) NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "LastRunningDate" timestamp without time zone,
    "EventId" character varying(100),
    "IsSync" bit(1)
);
 !   DROP TABLE public."ShiftDetail";
       public         heap    postgres    false                    1259    16991    ShiftDetailRegion    TABLE     �   CREATE TABLE public."ShiftDetailRegion" (
    "ShiftDetailRegionId" integer NOT NULL,
    "ShiftDetailId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    "IsDeleted" bit(1)
);
 '   DROP TABLE public."ShiftDetailRegion";
       public         heap    postgres    false                    1259    16990 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq";
       public          postgres    false    274         v           0    0 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq" OWNED BY public."ShiftDetailRegion"."ShiftDetailRegionId";
          public          postgres    false    273                    1259    16973    ShiftDetail_ShiftDetailId_seq    SEQUENCE     �   CREATE SEQUENCE public."ShiftDetail_ShiftDetailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ShiftDetail_ShiftDetailId_seq";
       public          postgres    false    272         w           0    0    ShiftDetail_ShiftDetailId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ShiftDetail_ShiftDetailId_seq" OWNED BY public."ShiftDetail"."ShiftDetailId";
          public          postgres    false    271                    1259    16956    Shift_ShiftId_seq    SEQUENCE     �   CREATE SEQUENCE public."Shift_ShiftId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Shift_ShiftId_seq";
       public          postgres    false    270         x           0    0    Shift_ShiftId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Shift_ShiftId_seq" OWNED BY public."Shift"."ShiftId";
          public          postgres    false    269                    1259    24593    user_sequence_id    SEQUENCE     y   CREATE SEQUENCE public.user_sequence_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_sequence_id;
       public          postgres    false         �            1259    16634    User    TABLE     �  CREATE TABLE public."User" (
    "UserId" integer DEFAULT nextval('public.user_sequence_id'::regclass) NOT NULL,
    "Id" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "IsRequestWithEmail" bit(1)
);
    DROP TABLE public."User";
       public         heap    postgres    false    278         �           2604    16511    Admin AdminId    DEFAULT     t   ALTER TABLE ONLY public."Admin" ALTER COLUMN "AdminId" SET DEFAULT nextval('public."Admin_AdminId_seq"'::regclass);
 @   ALTER TABLE public."Admin" ALTER COLUMN "AdminId" DROP DEFAULT;
       public          postgres    false    217    218    218         �           2604    16580    AdminRegion AdminRegionId    DEFAULT     �   ALTER TABLE ONLY public."AdminRegion" ALTER COLUMN "AdminRegionId" SET DEFAULT nextval('public."AdminRegion_AdminRegionId_seq"'::regclass);
 L   ALTER TABLE public."AdminRegion" ALTER COLUMN "AdminRegionId" DROP DEFAULT;
       public          postgres    false    225    226    226         �           2604    16550    BlockRequests BlockRequestId    DEFAULT     �   ALTER TABLE ONLY public."BlockRequests" ALTER COLUMN "BlockRequestId" SET DEFAULT nextval('public."BlockRequests_BlockRequestId_seq"'::regclass);
 O   ALTER TABLE public."BlockRequests" ALTER COLUMN "BlockRequestId" DROP DEFAULT;
       public          postgres    false    220    219    220         �           2604    16597    Business BusinessId    DEFAULT     �   ALTER TABLE ONLY public."Business" ALTER COLUMN "BusinessId" SET DEFAULT nextval('public."Business_BusinessId_seq"'::regclass);
 F   ALTER TABLE public."Business" ALTER COLUMN "BusinessId" DROP DEFAULT;
       public          postgres    false    227    228    228         �           2604    16566    CaseTag CaseTagId    DEFAULT     |   ALTER TABLE ONLY public."CaseTag" ALTER COLUMN "CaseTagId" SET DEFAULT nextval('public."CaseTag_CaseTagId_seq"'::regclass);
 D   ALTER TABLE public."CaseTag" ALTER COLUMN "CaseTagId" DROP DEFAULT;
       public          postgres    false    221    222    222         �           2604    16626    Concierge ConciergeId    DEFAULT     �   ALTER TABLE ONLY public."Concierge" ALTER COLUMN "ConciergeId" SET DEFAULT nextval('public."Concierge_ConciergeId_seq"'::regclass);
 H   ALTER TABLE public."Concierge" ALTER COLUMN "ConciergeId" DROP DEFAULT;
       public          postgres    false    230    229    230         �           2604    16667 +   HealthProfessionalType HealthProfessionalId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" SET DEFAULT nextval('public."HealthProfessionalType_HealthProfessionalId_seq"'::regclass);
 ^   ALTER TABLE public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" DROP DEFAULT;
       public          postgres    false    234    233    234         �           2604    16674    HealthProfessionals VendorId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionals" ALTER COLUMN "VendorId" SET DEFAULT nextval('public."HealthProfessionals_VendorId_seq"'::regclass);
 O   ALTER TABLE public."HealthProfessionals" ALTER COLUMN "VendorId" DROP DEFAULT;
       public          postgres    false    235    236    236         
           2604    16935    Menu MenuId    DEFAULT     p   ALTER TABLE ONLY public."Menu" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Menu_MenuId_seq"'::regclass);
 >   ALTER TABLE public."Menu" ALTER COLUMN "MenuId" DROP DEFAULT;
       public          postgres    false    266    265    266         �           2604    16688    OrderDetails Id    DEFAULT     x   ALTER TABLE ONLY public."OrderDetails" ALTER COLUMN "Id" SET DEFAULT nextval('public."OrderDetails_Id_seq"'::regclass);
 B   ALTER TABLE public."OrderDetails" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    237    238    238         �           2604    16697    Physician PhysicianId    DEFAULT     �   ALTER TABLE ONLY public."Physician" ALTER COLUMN "PhysicianId" SET DEFAULT nextval('public."Physician_PhysicianId_seq"'::regclass);
 H   ALTER TABLE public."Physician" ALTER COLUMN "PhysicianId" DROP DEFAULT;
       public          postgres    false    240    239    240                    2604    17018    PhysicianLocation LocationId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianLocation" ALTER COLUMN "LocationId" SET DEFAULT nextval('public."PhysicianLocation_LocationId_seq"'::regclass);
 O   ALTER TABLE public."PhysicianLocation" ALTER COLUMN "LocationId" DROP DEFAULT;
       public          postgres    false    276    277    277         �           2604    16721    PhysicianNotification id    DEFAULT     �   ALTER TABLE ONLY public."PhysicianNotification" ALTER COLUMN id SET DEFAULT nextval('public."PhysicianNotification_id_seq"'::regclass);
 I   ALTER TABLE public."PhysicianNotification" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242         �           2604    16733 !   PhysicianRegion PhysicianRegionId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" SET DEFAULT nextval('public."PhysicianRegion_PhysicianRegionId_seq"'::regclass);
 T   ALTER TABLE public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" DROP DEFAULT;
       public          postgres    false    244    243    244         �           2604    16573    Region RegionId    DEFAULT     x   ALTER TABLE ONLY public."Region" ALTER COLUMN "RegionId" SET DEFAULT nextval('public."Region_RegionId_seq"'::regclass);
 B   ALTER TABLE public."Region" ALTER COLUMN "RegionId" DROP DEFAULT;
       public          postgres    false    223    224    224                     2604    16750    Request RequestId    DEFAULT     |   ALTER TABLE ONLY public."Request" ALTER COLUMN "RequestId" SET DEFAULT nextval('public."Request_RequestId_seq"'::regclass);
 D   ALTER TABLE public."Request" ALTER COLUMN "RequestId" DROP DEFAULT;
       public          postgres    false    245    246    246                    2604    16771 !   RequestBusiness RequestBusinessId    DEFAULT     �   ALTER TABLE ONLY public."RequestBusiness" ALTER COLUMN "RequestBusinessId" SET DEFAULT nextval('public."RequestBusiness_RequestBusinessId_seq"'::regclass);
 T   ALTER TABLE public."RequestBusiness" ALTER COLUMN "RequestBusinessId" DROP DEFAULT;
       public          postgres    false    248    247    248                    2604    16788    RequestClient RequestClientId    DEFAULT     �   ALTER TABLE ONLY public."RequestClient" ALTER COLUMN "RequestClientId" SET DEFAULT nextval('public."RequestClient_RequestClientId_seq"'::regclass);
 P   ALTER TABLE public."RequestClient" ALTER COLUMN "RequestClientId" DROP DEFAULT;
       public          postgres    false    250    249    250                    2604    16836    RequestClosed RequestClosedId    DEFAULT     �   ALTER TABLE ONLY public."RequestClosed" ALTER COLUMN "RequestClosedId" SET DEFAULT nextval('public."RequestClosed_RequestClosedId_seq"'::regclass);
 P   ALTER TABLE public."RequestClosed" ALTER COLUMN "RequestClosedId" DROP DEFAULT;
       public          postgres    false    254    253    254                    2604    16855    RequestConcierge Id    DEFAULT     �   ALTER TABLE ONLY public."RequestConcierge" ALTER COLUMN "Id" SET DEFAULT nextval('public."RequestConcierge_Id_seq"'::regclass);
 F   ALTER TABLE public."RequestConcierge" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    255    256    256                    2604    16872    RequestNotes RequestNotesId    DEFAULT     �   ALTER TABLE ONLY public."RequestNotes" ALTER COLUMN "RequestNotesId" SET DEFAULT nextval('public."RequestNotes_RequestNotesId_seq"'::regclass);
 N   ALTER TABLE public."RequestNotes" ALTER COLUMN "RequestNotesId" DROP DEFAULT;
       public          postgres    false    258    257    258                    2604    16807 #   RequestStatusLog RequestStatusLogId    DEFAULT     �   ALTER TABLE ONLY public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" SET DEFAULT nextval('public."RequestStatusLog_RequestStatusLogId_seq"'::regclass);
 V   ALTER TABLE public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" DROP DEFAULT;
       public          postgres    false    251    252    252                    2604    16896    RequestType RequestTypeId    DEFAULT     �   ALTER TABLE ONLY public."RequestType" ALTER COLUMN "RequestTypeId" SET DEFAULT nextval('public."RequestType_RequestTypeId_seq"'::regclass);
 L   ALTER TABLE public."RequestType" ALTER COLUMN "RequestTypeId" DROP DEFAULT;
       public          postgres    false    259    260    260                    2604    16903 !   RequestWiseFile RequestWiseFileID    DEFAULT     �   ALTER TABLE ONLY public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" SET DEFAULT nextval('public."RequestWiseFile_RequestWiseFileID_seq"'::regclass);
 T   ALTER TABLE public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" DROP DEFAULT;
       public          postgres    false    262    261    262         	           2604    16927    Role RoleId    DEFAULT     p   ALTER TABLE ONLY public."Role" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Role_RoleId_seq"'::regclass);
 >   ALTER TABLE public."Role" ALTER COLUMN "RoleId" DROP DEFAULT;
       public          postgres    false    263    264    264                    2604    16943    RoleMenu RoleMenuId    DEFAULT     �   ALTER TABLE ONLY public."RoleMenu" ALTER COLUMN "RoleMenuId" SET DEFAULT nextval('public."RoleMenu_RoleMenuId_seq"'::regclass);
 F   ALTER TABLE public."RoleMenu" ALTER COLUMN "RoleMenuId" DROP DEFAULT;
       public          postgres    false    267    268    268                    2604    16960    Shift ShiftId    DEFAULT     t   ALTER TABLE ONLY public."Shift" ALTER COLUMN "ShiftId" SET DEFAULT nextval('public."Shift_ShiftId_seq"'::regclass);
 @   ALTER TABLE public."Shift" ALTER COLUMN "ShiftId" DROP DEFAULT;
       public          postgres    false    269    270    270                    2604    16977    ShiftDetail ShiftDetailId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetail" ALTER COLUMN "ShiftDetailId" SET DEFAULT nextval('public."ShiftDetail_ShiftDetailId_seq"'::regclass);
 L   ALTER TABLE public."ShiftDetail" ALTER COLUMN "ShiftDetailId" DROP DEFAULT;
       public          postgres    false    271    272    272                    2604    16994 %   ShiftDetailRegion ShiftDetailRegionId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" SET DEFAULT nextval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"'::regclass);
 X   ALTER TABLE public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" DROP DEFAULT;
       public          postgres    false    273    274    274                   0    16508    Admin 
   TABLE DATA             COPY public."Admin" ("AdminId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "RoleId") FROM stdin;
    public          postgres    false    218       5145.dat !          0    16577    AdminRegion 
   TABLE DATA           O   COPY public."AdminRegion" ("AdminRegionId", "AdminId", "RegionId") FROM stdin;
    public          postgres    false    226       5153.dat           0    16502    AspNetRoles 
   TABLE DATA           5   COPY public."AspNetRoles" ("Id", "Name") FROM stdin;
    public          postgres    false    216       5143.dat           0    16495    AspNetUsers 
   TABLE DATA           �   COPY public."AspNetUsers" ("Id", "UserName", "PasswordHash", "Email", "PhoneNumber", "IP", "ModifiedDate", "CreatedDate") FROM stdin;
    public          postgres    false    215       5142.dat           0    16547    BlockRequests 
   TABLE DATA           �   COPY public."BlockRequests" ("BlockRequestId", "PhoneNumber", "Email", "IsActive", "Reason", "RequestId", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
    public          postgres    false    220       5147.dat #          0    16594    Business 
   TABLE DATA           �   COPY public."Business" ("BusinessId", "Name", "Address1", "Address2", "City", "RegionId", "ZipCode", "PhoneNumber", "FaxNumber", "IsRegistered", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    228       5155.dat           0    16563    CaseTag 
   TABLE DATA           8   COPY public."CaseTag" ("CaseTagId", "Name") FROM stdin;
    public          postgres    false    222       5149.dat %          0    16623 	   Concierge 
   TABLE DATA           �   COPY public."Concierge" ("ConciergeId", "ConciergeName", "Address", "Street", "City", "State", "ZipCode", "CreatedDate", "RegionId", "IP") FROM stdin;
    public          postgres    false    230       5157.dat '          0    16656    EmailLog 
   TABLE DATA           �   COPY public."EmailLog" ("EmailLogID", "EmailTemplate", "SubjectName", "EmailID", "ConfirmationNumber", "FilePath", "RoleId", "RequestId", "AdminId", "PhysicianId", "CreateDate", "SentDate", "IsEmailSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    232       5159.dat )          0    16664    HealthProfessionalType 
   TABLE DATA           �   COPY public."HealthProfessionalType" ("HealthProfessionalId", "ProfessionName", "CreatedDate", "IsActive", "IsDeleted") FROM stdin;
    public          postgres    false    234       5161.dat +          0    16671    HealthProfessionals 
   TABLE DATA           �   COPY public."HealthProfessionals" ("VendorId", "VendorName", "Profession", "FaxNumber", "Address", "City", "State", "Zip", "RegionId", "CreatedDate", "ModifiedDate", "PhoneNumber", "IsDeleted", "IP", "Email", "BusinessContact") FROM stdin;
    public          postgres    false    236       5163.dat I          0    16932    Menu 
   TABLE DATA           N   COPY public."Menu" ("MenuId", "Name", "AccountType", "SortOrder") FROM stdin;
    public          postgres    false    266       5193.dat -          0    16685    OrderDetails 
   TABLE DATA           �   COPY public."OrderDetails" ("Id", "VendorId", "RequestId", "FaxNumber", "Email", "BusinessContact", "Prescription", "NoOfRefill", "CreatedDate", "CreatedBy") FROM stdin;
    public          postgres    false    238       5165.dat /          0    16694 	   Physician 
   TABLE DATA           �  COPY public."Physician" ("PhysicianId", "Id", "FirstName", "LastName", "Email", "Mobile", "MedicalLicense", "Photo", "AdminNotes", "IsAgreementDoc", "IsBackgroundDoc", "IsTrainingDoc", "IsNonDisclosureDoc", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "BusinessName", "BusinessWebsite", "IsDeleted", "RoleId", "NPINumber", "IsLicenseDoc", "Signature", "IsCredentialDoc", "IsTokenGenerate", "SyncEmailAddress") FROM stdin;
    public          postgres    false    240       5167.dat T          0    17015    PhysicianLocation 
   TABLE DATA           �   COPY public."PhysicianLocation" ("LocationId", "PhysicianId", "Latitude", "Longitude", "CreatedDate", "PhysicianName", "Address") FROM stdin;
    public          postgres    false    277       5204.dat 1          0    16718    PhysicianNotification 
   TABLE DATA           ]   COPY public."PhysicianNotification" (id, "PhysicianId", "IsNotificationStopped") FROM stdin;
    public          postgres    false    242       5169.dat 3          0    16730    PhysicianRegion 
   TABLE DATA           [   COPY public."PhysicianRegion" ("PhysicianRegionId", "PhysicianId", "RegionId") FROM stdin;
    public          postgres    false    244       5171.dat           0    16570    Region 
   TABLE DATA           F   COPY public."Region" ("RegionId", "Name", "Abbreviation") FROM stdin;
    public          postgres    false    224       5151.dat 5          0    16747    Request 
   TABLE DATA           �  COPY public."Request" ("RequestId", "RequestTypeId", "UserId", "FirstName", "LastName", "PhoneNumber", "Email", "Status", "PhysicianId", "ConfirmationNumber", "CreatedDate", "IsDeleted", "ModifiedDate", "DeclinedBy", "IsUrgentEmailSent", "LastWellnessDate", "IsMobile", "CallType", "CompletedByPhysician", "LastReservationDate", "AcceptedDate", "RelationName", "CaseNumber", "IP", "CaseTag", "CaseTagPhysician", "PatientAccountId", "CreatedUserId") FROM stdin;
    public          postgres    false    246       5173.dat 7          0    16768    RequestBusiness 
   TABLE DATA           a   COPY public."RequestBusiness" ("RequestBusinessId", "RequestId", "BusinessId", "IP") FROM stdin;
    public          postgres    false    248       5175.dat 9          0    16785    RequestClient 
   TABLE DATA           �  COPY public."RequestClient" ("RequestClientId", "RequestId", "FirstName", "LastName", "PhoneNumber", "Location", "Address", "RegionId", "NotiMobile", "NotiEmail", "Notes", "Email", "strMonth", "intYear", "intDate", "IsMobile", "Street", "City", "State", "ZipCode", "CommunicationType", "RemindReservationCount", "RemindHouseCallCount", "IsSetFollowupSent", "IP", "IsReservationReminderSent", "Latitude", "Longitude") FROM stdin;
    public          postgres    false    250       5177.dat =          0    16833    RequestClosed 
   TABLE DATA           �   COPY public."RequestClosed" ("RequestClosedId", "RequestId", "RequestStatusLogId", "PhyNotes", "ClientNotes", "IP") FROM stdin;
    public          postgres    false    254       5181.dat ?          0    16852    RequestConcierge 
   TABLE DATA           T   COPY public."RequestConcierge" ("Id", "RequestId", "ConciergeId", "IP") FROM stdin;
    public          postgres    false    256       5183.dat A          0    16869    RequestNotes 
   TABLE DATA           �   COPY public."RequestNotes" ("RequestNotesId", "RequestId", "strMonth", "intYear", "intDate", "PhysicianNotes", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IP", "AdministrativeNotes") FROM stdin;
    public          postgres    false    258       5185.dat ;          0    16804    RequestStatusLog 
   TABLE DATA           �   COPY public."RequestStatusLog" ("RequestStatusLogId", "RequestId", "Status", "PhysicianId", "AdminId", "TransToPhysicianId", "Notes", "CreatedDate", "IP", "TransToAdmin") FROM stdin;
    public          postgres    false    252       5179.dat C          0    16893    RequestType 
   TABLE DATA           @   COPY public."RequestType" ("RequestTypeId", "Name") FROM stdin;
    public          postgres    false    260       5187.dat E          0    16900    RequestWiseFile 
   TABLE DATA           �   COPY public."RequestWiseFile" ("RequestWiseFileID", "RequestId", "FileName", "CreatedDate", "PhysicianId", "AdminId", "DocType", "IsFrontSide", "IsCompensation", "IP", "IsFinalize", "IsDeleted", "IsPatientRecords") FROM stdin;
    public          postgres    false    262       5189.dat G          0    16924    Role 
   TABLE DATA           �   COPY public."Role" ("RoleId", "Name", "AccountType", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    264       5191.dat K          0    16940    RoleMenu 
   TABLE DATA           F   COPY public."RoleMenu" ("RoleMenuId", "RoleId", "MenuId") FROM stdin;
    public          postgres    false    268       5195.dat R          0    17007    SMSLog 
   TABLE DATA           �   COPY public."SMSLog" ("SMSLogID", "SMSTemplate", "MobileNumber", "ConfirmationNumber", "RoleId", "AdminId", "RequestId", "PhysicianId", "CreateDate", "SentDate", "IsSMSSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    275       5202.dat M          0    16957    Shift 
   TABLE DATA           �   COPY public."Shift" ("ShiftId", "PhysicianId", "StartDate", "IsRepeat", "WeekDays", "RepeatUpto", "CreatedBy", "CreatedDate", "IP") FROM stdin;
    public          postgres    false    270       5197.dat O          0    16974    ShiftDetail 
   TABLE DATA           �   COPY public."ShiftDetail" ("ShiftDetailId", "ShiftId", "ShiftDate", "RegionId", "StartTime", "EndTime", "Status", "IsDeleted", "ModifiedBy", "ModifiedDate", "LastRunningDate", "EventId", "IsSync") FROM stdin;
    public          postgres    false    272       5199.dat Q          0    16991    ShiftDetailRegion 
   TABLE DATA           n   COPY public."ShiftDetailRegion" ("ShiftDetailRegionId", "ShiftDetailId", "RegionId", "IsDeleted") FROM stdin;
    public          postgres    false    274       5201.dat &          0    16634    User 
   TABLE DATA           )  COPY public."User" ("UserId", "Id", "FirstName", "LastName", "Email", "Mobile", "IsMobile", "Street", "City", "State", "RegionId", "ZipCode", "strMonth", "intYear", "intDate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP", "IsRequestWithEmail") FROM stdin;
    public          postgres    false    231       5158.dat y           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."AdminRegion_AdminRegionId_seq"', 1, false);
          public          postgres    false    225         z           0    0    Admin_AdminId_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Admin_AdminId_seq"', 1, false);
          public          postgres    false    217         {           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."BlockRequests_BlockRequestId_seq"', 1, false);
          public          postgres    false    219         |           0    0    Business_BusinessId_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Business_BusinessId_seq"', 2, true);
          public          postgres    false    227         }           0    0    CaseTag_CaseTagId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."CaseTag_CaseTagId_seq"', 4, true);
          public          postgres    false    221         ~           0    0    Concierge_ConciergeId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Concierge_ConciergeId_seq"', 5, true);
          public          postgres    false    229                    0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."HealthProfessionalType_HealthProfessionalId_seq"', 1, false);
          public          postgres    false    233         �           0    0     HealthProfessionals_VendorId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."HealthProfessionals_VendorId_seq"', 1, false);
          public          postgres    false    235         �           0    0    Menu_MenuId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Menu_MenuId_seq"', 1, false);
          public          postgres    false    265         �           0    0    OrderDetails_Id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."OrderDetails_Id_seq"', 1, false);
          public          postgres    false    237         �           0    0     PhysicianLocation_LocationId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."PhysicianLocation_LocationId_seq"', 1, false);
          public          postgres    false    276         �           0    0    PhysicianNotification_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."PhysicianNotification_id_seq"', 1, false);
          public          postgres    false    241         �           0    0 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."PhysicianRegion_PhysicianRegionId_seq"', 1, false);
          public          postgres    false    243         �           0    0    Physician_PhysicianId_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Physician_PhysicianId_seq"', 1, false);
          public          postgres    false    239         �           0    0    Region_RegionId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Region_RegionId_seq"', 1, false);
          public          postgres    false    223         �           0    0 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."RequestBusiness_RequestBusinessId_seq"', 1, true);
          public          postgres    false    247         �           0    0 !   RequestClient_RequestClientId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClient_RequestClientId_seq"', 35, true);
          public          postgres    false    249         �           0    0 !   RequestClosed_RequestClosedId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClosed_RequestClosedId_seq"', 1, false);
          public          postgres    false    253         �           0    0    RequestConcierge_Id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."RequestConcierge_Id_seq"', 3, true);
          public          postgres    false    255         �           0    0    RequestNotes_RequestNotesId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."RequestNotes_RequestNotesId_seq"', 1, false);
          public          postgres    false    257         �           0    0 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."RequestStatusLog_RequestStatusLogId_seq"', 18, true);
          public          postgres    false    251         �           0    0    RequestType_RequestTypeId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."RequestType_RequestTypeId_seq"', 1, false);
          public          postgres    false    259         �           0    0 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."RequestWiseFile_RequestWiseFileID_seq"', 16, true);
          public          postgres    false    261         �           0    0    Request_RequestId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Request_RequestId_seq"', 35, true);
          public          postgres    false    245         �           0    0    RoleMenu_RoleMenuId_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RoleMenu_RoleMenuId_seq"', 1, false);
          public          postgres    false    267         �           0    0    Role_RoleId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Role_RoleId_seq"', 1, false);
          public          postgres    false    263         �           0    0 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"', 1, false);
          public          postgres    false    273         �           0    0    ShiftDetail_ShiftDetailId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ShiftDetail_ShiftDetailId_seq"', 1, false);
          public          postgres    false    271         �           0    0    Shift_ShiftId_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Shift_ShiftId_seq"', 1, false);
          public          postgres    false    269         �           0    0    user_sequence_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_sequence_id', 12, true);
          public          postgres    false    278         !           2606    16582    AdminRegion AdminRegion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "AdminRegion_pkey" PRIMARY KEY ("AdminRegionId");
 J   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "AdminRegion_pkey";
       public            postgres    false    226                    2606    16515    Admin Admin_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("AdminId");
 >   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_pkey";
       public            postgres    false    218                    2606    16506    AspNetRoles AspNetRoles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "AspNetRoles_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."AspNetRoles" DROP CONSTRAINT "AspNetRoles_pkey";
       public            postgres    false    216                    2606    16501    AspNetUsers AspNetUsers_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "AspNetUsers_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."AspNetUsers" DROP CONSTRAINT "AspNetUsers_pkey";
       public            postgres    false    215                    2606    16554     BlockRequests BlockRequests_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."BlockRequests"
    ADD CONSTRAINT "BlockRequests_pkey" PRIMARY KEY ("BlockRequestId");
 N   ALTER TABLE ONLY public."BlockRequests" DROP CONSTRAINT "BlockRequests_pkey";
       public            postgres    false    220         #           2606    16601    Business Business_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessId");
 D   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_pkey";
       public            postgres    false    228                    2606    16568    CaseTag CaseTag_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."CaseTag"
    ADD CONSTRAINT "CaseTag_pkey" PRIMARY KEY ("CaseTagId");
 B   ALTER TABLE ONLY public."CaseTag" DROP CONSTRAINT "CaseTag_pkey";
       public            postgres    false    222         %           2606    16628    Concierge Concierge_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_pkey" PRIMARY KEY ("ConciergeId");
 F   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_pkey";
       public            postgres    false    230         )           2606    16662    EmailLog EmailLog_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."EmailLog"
    ADD CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("EmailLogID");
 D   ALTER TABLE ONLY public."EmailLog" DROP CONSTRAINT "EmailLog_pkey";
       public            postgres    false    232         +           2606    16669 2   HealthProfessionalType HealthProfessionalType_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionalType"
    ADD CONSTRAINT "HealthProfessionalType_pkey" PRIMARY KEY ("HealthProfessionalId");
 `   ALTER TABLE ONLY public."HealthProfessionalType" DROP CONSTRAINT "HealthProfessionalType_pkey";
       public            postgres    false    234         -           2606    16678 ,   HealthProfessionals HealthProfessionals_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_pkey" PRIMARY KEY ("VendorId");
 Z   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_pkey";
       public            postgres    false    236         K           2606    16938    Menu Menu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId");
 <   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_pkey";
       public            postgres    false    266         /           2606    16692    OrderDetails OrderDetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_pkey";
       public            postgres    false    238         W           2606    17022 (   PhysicianLocation PhysicianLocation_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_pkey" PRIMARY KEY ("LocationId");
 V   ALTER TABLE ONLY public."PhysicianLocation" DROP CONSTRAINT "PhysicianLocation_pkey";
       public            postgres    false    277         3           2606    16723 0   PhysicianNotification PhysicianNotification_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_pkey";
       public            postgres    false    242         5           2606    16735 $   PhysicianRegion PhysicianRegion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_pkey" PRIMARY KEY ("PhysicianRegionId");
 R   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_pkey";
       public            postgres    false    244         1           2606    16701    Physician Physician_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_pkey" PRIMARY KEY ("PhysicianId");
 F   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_pkey";
       public            postgres    false    240                    2606    16575    Region Region_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("RegionId");
 @   ALTER TABLE ONLY public."Region" DROP CONSTRAINT "Region_pkey";
       public            postgres    false    224         9           2606    16773 $   RequestBusiness RequestBusiness_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_pkey" PRIMARY KEY ("RequestBusinessId");
 R   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_pkey";
       public            postgres    false    248         ;           2606    16792     RequestClient RequestClient_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_pkey" PRIMARY KEY ("RequestClientId");
 N   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_pkey";
       public            postgres    false    250         ?           2606    16840     RequestClosed RequestClosed_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_pkey" PRIMARY KEY ("RequestClosedId");
 N   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_pkey";
       public            postgres    false    254         A           2606    16857 &   RequestConcierge RequestConcierge_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_pkey";
       public            postgres    false    256         C           2606    16876    RequestNotes RequestNotes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_pkey" PRIMARY KEY ("RequestNotesId");
 L   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_pkey";
       public            postgres    false    258         =           2606    16811 &   RequestStatusLog RequestStatusLog_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_pkey" PRIMARY KEY ("RequestStatusLogId");
 T   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_pkey";
       public            postgres    false    252         E           2606    16898    RequestType RequestType_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."RequestType"
    ADD CONSTRAINT "RequestType_pkey" PRIMARY KEY ("RequestTypeId");
 J   ALTER TABLE ONLY public."RequestType" DROP CONSTRAINT "RequestType_pkey";
       public            postgres    false    260         G           2606    16907 $   RequestWiseFile RequestWiseFile_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_pkey" PRIMARY KEY ("RequestWiseFileID");
 R   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_pkey";
       public            postgres    false    262         7           2606    16756    Request Request_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY ("RequestId");
 B   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_pkey";
       public            postgres    false    246         M           2606    16945    RoleMenu RoleMenu_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_pkey" PRIMARY KEY ("RoleMenuId");
 D   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_pkey";
       public            postgres    false    268         I           2606    16930    Role Role_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("RoleId");
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    264         U           2606    17013    SMSLog SMSLog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."SMSLog"
    ADD CONSTRAINT "SMSLog_pkey" PRIMARY KEY ("SMSLogID");
 @   ALTER TABLE ONLY public."SMSLog" DROP CONSTRAINT "SMSLog_pkey";
       public            postgres    false    275         S           2606    16996 (   ShiftDetailRegion ShiftDetailRegion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_pkey" PRIMARY KEY ("ShiftDetailRegionId");
 V   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_pkey";
       public            postgres    false    274         Q           2606    16979    ShiftDetail ShiftDetail_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_pkey" PRIMARY KEY ("ShiftDetailId");
 J   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_pkey";
       public            postgres    false    272         O           2606    16962    Shift Shift_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY ("ShiftId");
 >   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_pkey";
       public            postgres    false    270         '           2606    16640    User User_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    231         X           2606    16516    Admin Admin_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("Id");
 K   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_AspNetUserId_fkey";
       public          postgres    false    215    4885    218         Y           2606    16521    Admin Admin_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 H   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_CreatedBy_fkey";
       public          postgres    false    4885    215    218         Z           2606    16526    Admin Admin_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 I   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_ModifiedBy_fkey";
       public          postgres    false    215    218    4885         ]           2606    16612     Business Business_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 N   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_CreatedBy_fkey";
       public          postgres    false    215    228    4885         ^           2606    16617 !   Business Business_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 O   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_ModifiedBy_fkey";
       public          postgres    false    4885    215    228         _           2606    16607    Business Business_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 M   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_RegionId_fkey";
       public          postgres    false    228    224    4895         `           2606    16629 !   Concierge Concierge_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 O   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_RegionId_fkey";
       public          postgres    false    230    4895    224         [           2606    16583 "   AdminRegion FK_AdminRegion_AdminId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 P   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_AdminId";
       public          postgres    false    226    4889    218         \           2606    16588 #   AdminRegion FK_AdminRegion_RegionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 Q   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_RegionId";
       public          postgres    false    224    4895    226         d           2606    16679 7   HealthProfessionals HealthProfessionals_Profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_Profession_fkey" FOREIGN KEY ("Profession") REFERENCES public."HealthProfessionalType"("HealthProfessionalId");
 e   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_Profession_fkey";
       public          postgres    false    4907    236    234         h           2606    16724 <   PhysicianNotification PhysicianNotification_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 j   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_PhysicianId_fkey";
       public          postgres    false    240    242    4913         i           2606    16736 0   PhysicianRegion PhysicianRegion_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_PhysicianId_fkey";
       public          postgres    false    4913    244    240         j           2606    16741 -   PhysicianRegion PhysicianRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 [   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_RegionId_fkey";
       public          postgres    false    244    4895    224         e           2606    16707 "   Physician Physician_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 P   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_CreatedBy_fkey";
       public          postgres    false    4885    240    215         f           2606    16702    Physician Physician_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_Id_fkey" FOREIGN KEY ("Id") REFERENCES public."AspNetUsers"("Id");
 I   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_Id_fkey";
       public          postgres    false    4885    240    215         g           2606    16712 #   Physician Physician_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 Q   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_ModifiedBy_fkey";
       public          postgres    false    215    240    4885         m           2606    16779 /   RequestBusiness RequestBusiness_BusinessId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_BusinessId_fkey" FOREIGN KEY ("BusinessId") REFERENCES public."Business"("BusinessId");
 ]   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_BusinessId_fkey";
       public          postgres    false    228    248    4899         n           2606    16774 .   RequestBusiness RequestBusiness_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_RequestId_fkey";
       public          postgres    false    4919    248    246         o           2606    16798 )   RequestClient RequestClient_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 W   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RegionId_fkey";
       public          postgres    false    224    250    4895         p           2606    16793 *   RequestClient RequestClient_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RequestId_fkey";
       public          postgres    false    4919    250    246         u           2606    16841 *   RequestClosed RequestClosed_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestId_fkey";
       public          postgres    false    246    254    4919         v           2606    16846 3   RequestClosed RequestClosed_RequestStatusLogId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestStatusLogId_fkey" FOREIGN KEY ("RequestStatusLogId") REFERENCES public."RequestStatusLog"("RequestStatusLogId");
 a   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestStatusLogId_fkey";
       public          postgres    false    252    254    4925         w           2606    16863 2   RequestConcierge RequestConcierge_ConciergeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_ConciergeId_fkey" FOREIGN KEY ("ConciergeId") REFERENCES public."Concierge"("ConciergeId");
 `   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_ConciergeId_fkey";
       public          postgres    false    230    256    4901         x           2606    16858 0   RequestConcierge RequestConcierge_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_RequestId_fkey";
       public          postgres    false    4919    256    246         y           2606    16882 (   RequestNotes RequestNotes_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 V   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_CreatedBy_fkey";
       public          postgres    false    4885    258    215         z           2606    16887 )   RequestNotes RequestNotes_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 W   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_ModifiedBy_fkey";
       public          postgres    false    4885    258    215         {           2606    16877 (   RequestNotes RequestNotes_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 V   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_RequestId_fkey";
       public          postgres    false    4919    258    246         q           2606    16822 .   RequestStatusLog RequestStatusLog_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 \   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_AdminId_fkey";
       public          postgres    false    252    4889    218         r           2606    16817 2   RequestStatusLog RequestStatusLog_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 `   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_PhysicianId_fkey";
       public          postgres    false    4913    252    240         s           2606    16812 0   RequestStatusLog RequestStatusLog_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_RequestId_fkey";
       public          postgres    false    4919    252    246         t           2606    16827 9   RequestStatusLog RequestStatusLog_TransToPhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey" FOREIGN KEY ("TransToPhysicianId") REFERENCES public."Physician"("PhysicianId");
 g   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey";
       public          postgres    false    240    252    4913         |           2606    16918 ,   RequestWiseFile RequestWiseFile_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 Z   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_AdminId_fkey";
       public          postgres    false    262    218    4889         }           2606    16913 0   RequestWiseFile RequestWiseFile_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_PhysicianId_fkey";
       public          postgres    false    262    240    4913         ~           2606    16908 .   RequestWiseFile RequestWiseFile_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_RequestId_fkey";
       public          postgres    false    246    4919    262         k           2606    16762     Request Request_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 N   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_PhysicianId_fkey";
       public          postgres    false    240    246    4913         l           2606    16757    Request Request_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"("UserId");
 I   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_UserId_fkey";
       public          postgres    false    4903    246    231                    2606    16951    RoleMenu RoleMenu_MenuId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_MenuId_fkey" FOREIGN KEY ("MenuId") REFERENCES public."Menu"("MenuId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_MenuId_fkey";
       public          postgres    false    266    268    4939         �           2606    16946    RoleMenu RoleMenu_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_RoleId_fkey";
       public          postgres    false    268    264    4937         �           2606    17002 1   ShiftDetailRegion ShiftDetailRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 _   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_RegionId_fkey";
       public          postgres    false    4895    224    274         �           2606    16997 6   ShiftDetailRegion ShiftDetailRegion_ShiftDetailId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey" FOREIGN KEY ("ShiftDetailId") REFERENCES public."ShiftDetail"("ShiftDetailId");
 d   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey";
       public          postgres    false    4945    274    272         �           2606    16985 '   ShiftDetail ShiftDetail_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 U   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ModifiedBy_fkey";
       public          postgres    false    272    4885    215         �           2606    16980 $   ShiftDetail ShiftDetail_ShiftId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ShiftId_fkey" FOREIGN KEY ("ShiftId") REFERENCES public."Shift"("ShiftId");
 R   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ShiftId_fkey";
       public          postgres    false    272    4943    270         �           2606    16968    Shift Shift_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 H   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_CreatedBy_fkey";
       public          postgres    false    4885    270    215         �           2606    16963    Shift Shift_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 J   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_PhysicianId_fkey";
       public          postgres    false    270    240    4913         a           2606    16646    User User_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");
 F   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_CreatedBy_fkey";
       public          postgres    false    215    231    4885         b           2606    16641    User User_Id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_Id_fkey" FOREIGN KEY ("Id") REFERENCES public."AspNetUsers"("Id");
 ?   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_Id_fkey";
       public          postgres    false    215    231    4885         c           2606    16651    User User_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");
 G   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_ModifiedBy_fkey";
       public          postgres    false    231    4885    215                                                                                                                                                                                                                                                                                                                                         5145.dat                                                                                            0000600 0004000 0002000 00000000250 14567624677 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	13af6b84-5807-4404-b712-b0937f5f5b6f	Admin1	Admin	Admin@gmail.com\n	\N	\N	\N	\N	\N	\N	\N	13af6b84-5807-4404-b712-b0937f5f5b6f	2023-12-30 00:00:00	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                        5153.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5143.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5142.dat                                                                                            0000600 0004000 0002000 00000004374 14567624677 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        da3c4f9e-1c40-4d9b-907f-6c33dbd152a4	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	\N	\N	\N	2024-02-08 14:38:02.455537
4dfe159b-b471-4965-8883-99ef1ba359fa	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	\N	\N	\N	2024-02-08 14:40:10.032202
f0f8b316-af95-49f8-a206-164091957bb6	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	\N	\N	\N	2024-02-08 14:58:05.210436
3ac9f8b8-c0f5-4a33-af57-279d9320a2d0	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	\N	\N	\N	2024-02-08 14:58:50.738401
a0ba8ffa-be62-435a-9488-a67b0e550998	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	\N	\N	\N	2024-02-08 16:37:53.266642
bfadd279-8c94-4a4a-a651-12915f795704	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-08 18:24:38.709781
13af6b84-5807-4404-b712-b0937f5f5b6e	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-09 10:03:36.164639
fb9709fd-12ec-4a09-8e31-6d633c4d977a	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-09 12:46:47.74539
4181dfa4-297d-451e-9141-b1f54a38273a	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-09 12:49:41.954966
398907be-ce63-4918-a008-321d50189cb6	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-09 12:53:21.021544
e60db1c4-61c6-4a91-8e9a-4557781e948e	niyati.kaneriya@etatvasoft.com	\N	niyati.kaneriya@etatvasoft.com	79843 46545	\N	\N	2024-02-09 14:25:12.088846
60a7cd95-fb37-44c6-b13c-f6a336405818	gt	g	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-09 18:44:54.458272
d725128c-cc01-45d1-8f63-eb42fe67b42b	1	1	abvcf@hvjv.vyjj	+1 233-655-4789	\N	\N	2024-02-12 15:45:02.676868
ee0c98f9-ce6e-4fc9-b02c-221a14c12282	shreyans@g.com	g	shreyans@g.com	123 456	\N	\N	2024-02-13 11:59:13.247053
5df80732-5198-4c87-b1ea-ebf86cbd7530	niyatik@gmail.com	123456	niyatik@gmail.com	79843 49008	\N	\N	2024-02-13 15:12:13.362379
8509ddf2-17ef-4147-9af7-2d383b39a19e	abcd@etatvasoft.com	asdf	abcd@etatvasoft.com	+1 233-655-4789	\N	\N	2024-02-12 15:40:58.593073
13af6b84-5807-4404-b712-b0937f5f5b6f	Admin@gmail.com	123	Admin@gmail.com	7984349007	\N	\N	2023-12-30 00:00:00
\.


                                                                                                                                                                                                                                                                    5147.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5155.dat                                                                                            0000600 0004000 0002000 00000000145 14567624677 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Niyati-BusinessPartner k	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-09 14:35:03.548128	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                           5149.dat                                                                                            0000600 0004000 0002000 00000000141 14567624677 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Not Real Request
2	Facility not available
3	its has duplicate request 
4	Spamming request
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               5157.dat                                                                                            0000600 0004000 0002000 00000000371 14567624677 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	niyati.kaneriya@etatvasoft.com p	\N	abc	abc	abc	abc	2024-02-09 12:53:31.671292	1	\N
4	Niyati-Concierge k	\N	abc	abc	abc	abc	2024-02-09 14:27:50.981535	1	\N
5	niyati.kaneriya@etatvasoft.com p	\N	abc	abc	abc	abc	2024-02-09 17:22:37.066166	1	\N
\.


                                                                                                                                                                                                                                                                       5159.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5161.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5163.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5193.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5165.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5167.dat                                                                                            0000600 0004000 0002000 00000000232 14567624677 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	\N	dr.abc	p	dr.abc@gmail.com	3216549870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-20 00:00:00	\N	\N	\N	abc	abc.com	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                      5204.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5169.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5171.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5151.dat                                                                                            0000600 0004000 0002000 00000000031 14567624677 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	abc	abc
2	xyz	xyz
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       5173.dat                                                                                            0000600 0004000 0002000 00000011012 14567624677 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22	2	0	hfgjgh	dfgdh	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	2	1	\N	2024-02-12 17:55:36.31223	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	2	12	niyati	niyati	7984349008	niyatik@gmail.com	4	\N	\N	2024-02-13 15:50:21.815804	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	1	0	niyati.kaneriya@etatvasoft.com	p	\N	\N	4	1	\N	2024-02-08 14:58:20.462258	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	3	12	niyati	k	+1 798-434-9008	niyatik@gmail.com	4	\N	\N	2024-02-13 15:52:07.085378	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2	3	Niyati	Kaneriya	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-09 10:03:38.20059	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N
7	1	4	Niyati	Kaneriya	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	1	1	\N	2024-02-09 12:46:49.185318	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	3	12	Niyati	Kaneriya	79843 49008	niyatik@gmail.com	2	\N	\N	2024-02-13 15:12:13.682302	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	3	5	xyz	p	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	1	1	\N	2024-02-09 12:49:51.943031	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	1	\N	Niyati-family	k	1236 547 896	niyati.kaneriya@etatvasoft.com	2	\N	\N	2024-02-09 14:26:50.798975	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	2	12	bansi	k	+1 798-434-9008	niyatik@gmail.com	1	\N	\N	2024-02-14 10:23:41.377441	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N
17	1	9	abcd	abcd	+1 233-655-4789	abcd@etatvasoft.com	4	\N	\N	2024-02-12 15:40:58.833673	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	1	10	rtdhg	kuyy	+1 233-655-4789	abvcf@hvjv.vyjj	6	\N	\N	2024-02-12 15:45:57.413322	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	3	12	Niyati	Kaneriya	+1 798-434-9008	niyatik@gmail.com	1	\N	\N	2024-02-14 12:37:52.860675	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	2	12	Niyati	Kaneriya	+1 798-434-9008	niyatik@gmail.com	1	\N	\N	2024-02-14 12:40:10.553877	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	1	0	niyati.kaneriya	p	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	5	\N	\N	2024-02-13 11:20:50.417671	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	2	7	Niyati	K	+91 79843 46545	niyati.kaneriya@etatvasoft.com	8	1	\N	2024-02-09 14:25:13.574194	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	1	12	Niyati	Kaneriya	+1 798-434-9008	niyatik@gmail.com	3	1	\N	2024-02-14 12:38:50.723375	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	1	8	g	g	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	\N	\N	2024-02-09 18:44:55.909005	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N
10	1	\N	niyati.kaneriya@etatvasoft.com	p	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-09 13:58:46.939913	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	2	12	bansi	k	+1 798-434-9008	niyatik@gmail.com	3	1	\N	2024-02-14 10:21:32.629249	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	brother	\N	\N	3	\N	\N	\N
21	4	0	fngnfhj	nfhnhg	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	\N	\N	2024-02-12 16:03:52.672476	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N
20	1	0	fngnfhj	nfhnhg	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-12 16:03:16.820662	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	2	1	niyati.kaneriya@etatvasoft.com	p	\N	\N	3	1	\N	2024-02-08 16:37:54.774282	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N
35	3	12	niyati	k	2345456567	niyatik@gmail.com	3	\N	\N	2024-02-20 14:37:58.723937	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N
13	3	\N	Niyati	k	+91 233 655 4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-09 14:27:51.036719	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N
9	4	6	Niyati	Kaneriya	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-09 12:53:27.070957	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N	\N
31	4	12	dhara	k	+1 798-434-9008	niyatik@gmail.com	1	1	\N	2024-02-14 10:29:56.386806	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	sister	\N	\N	\N	\N	\N	\N
5	1	2	Niyati	asd	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-08 18:24:40.315775	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N
15	3	\N	xyz	p	7984346545	niyati.kaneriya@etatvasoft.com	3	1	\N	2024-02-09 17:22:38.4529	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	qwewrrtyhb	\N	\N	\N
14	4	\N	Niyati	K	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	2	\N	\N	2024-02-09 14:35:04.94229	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	2	0	fngnfhj	nfhnhg	+1 233-655-4789	niyati.kaneriya@etatvasoft.com	2	\N	\N	2024-02-12 15:52:43.55847	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	1	12	niyati	p	+1 798-434-9008	niyatik@gmail.com	3	\N	\N	2024-02-13 15:53:56.781002	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      5175.dat                                                                                            0000600 0004000 0002000 00000000017 14567624677 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	14	2	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 5177.dat                                                                                            0000600 0004000 0002000 00000006747 14567624677 0014323 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	4	niyati.kaneriya@etatvasoft.com	p	\N	\N	3YTYHRTFGw35	2	\N	\N	\N	\N	11	2020	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	Niyati	K	79843 46545	\N	i68i76s	2	\N	\N	Headache	\N	4	2006	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	Niyati	k	+91 233-655-4789	\N	\N	2	\N	\N	leg pain	\N	4	2006	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	13	Niyati	k	+91 233 655 4789	\N	teyh65ujgzfah	2	\N	\N	fever	\N	2	2006	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	Niyati	K	+1 233-655-4789	\N	\N	2	\N	\N	cold	\N	4	2002	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	15	xyz	p	7984346545	\N	tui8o87rf	1	\N	\N	dfbhn	\N	1	1963	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	16	g	g	+1 233-655-4789	\N	\N	1	\N	\N	g	\N	4	1963	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	18	rtdhg	kuyy	+1 233-655-4789	\N	tyik68uyghf	1	\N	\N	bjhgf	\N	4	1963	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	19	fngnfhj	nfhnhg	+1 233-655-4789	\N	\N	1	\N	\N	ghfj	\N	3	1963	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	20	fngnfhj	nfhnhg	+1 233-655-4789	\N	\N	1	\N	\N	ghfj	\N	10	1963	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	22	hfgjgh	dfgdh	+1 233-655-4789	\N	REGRTEHBFBDNTYJUKjytj	1	\N	\N	dfhngvjmh	\N	10	1963	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	23	niyati.kaneriya	p	+1 233-655-4789	\N	\N	2	\N	\N	bgnyjm	\N	11	1963	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	25	Niyati	Kaneriya	79843 49008	\N	\N	1	\N	\N	fever	\N	9	2016	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	26	niyati	niyati	7984349008	\N	thryuj626ygrfdsGREYEBH 	1	\N	\N	cold	\N	6	1963	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	27	niyati	k	+1 798-434-9008	\N	6u53whtgbgfb 	2	\N	\N	pain	\N	1	2006	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	28	niyati	p	+1 798-434-9008	\N	yw6uytiti	2	\N	\N	abc	\N	3	2002	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	29	bansi	k	+1 798-434-9008	\N	\N	1	\N	\N	fever	\N	2	2016	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	30	bansi	k	+1 798-434-9008	\N	rthjuwryu46uy5ujh	2	\N	\N	fever	\N	3	2006	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	31	dhara	k	+1 798-434-9008	\N	rue57i	1	\N	\N	asdfghjkl	\N	6	2016	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	32	Niyati	Kaneriya	+1 798-434-9008	\N	\N	1	\N	\N	jhfuiy	\N	2	2002	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	33	Niyati	Kaneriya	+1 798-434-9008	\N	dyhr6u3w	2	\N	\N	uigytc	\N	1	2016	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	34	niyati.kaneriya@etatvasoft.com	p	+1 798-434-9008	\N	\N	1	\N	\N	jhboub	\N	6	1963	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	9	Niyati	Kaneriya	+1 233-655-4789	\N	tyj6i7o78oy	1	\N	\N	\N	\N	12	2006	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	10	xyz	p	+1 233-655-4789	\N	\N	2	\N	\N	\N	\N	2	1963	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	17	abcd	abcd	+1 233-655-4789	\N	rtj67uik68uekghd	2	\N	\N	headache	\N	2	1963	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	35	niyati	kk	2345456567	\N	ty468u67o7p	2	\N	\N	bdgnfgj,	\N	8	2002	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	21	fngnfhj	kaneriya	(233) 655-4789	\N	ytj6utkmgdh 	2	\N	\N	ghfj	\N	2	2006	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	niyati.kaneriya@etatvasoft.com	p	\N	\N	erhthjytj	1	\N	\N	\N	\N	6	2002	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	5	Niyati	asd	+1 233-655-4789	\N	\N	1	\N	\N	\N	\N	1	2006	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	6	Niyati	Kaneriya	+1 233-655-4789	\N	wetryrwutgnbafegWRT35	1	\N	\N	\N	\N	2	2006	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	7	Niyati	Kaneriya	+1 233-655-4789	\N	j576irytdhytesz	2	\N	\N	\N	\N	6	2002	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	8	xyz	p	+1 233-655-4789	\N	\N	1	\N	\N	\N	\N	1	2006	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                         5181.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5183.dat                                                                                            0000600 0004000 0002000 00000000042 14567624677 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	9	3	\N
2	13	4	\N
3	15	5	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              5185.dat                                                                                            0000600 0004000 0002000 00000000360 14567624677 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	28	03	2002	6	asdfghjkl	dv ehtn4yu jh,uk,ni	13af6b84-5807-4404-b712-b0937f5f5b6e	2024-02-26 00:00:00	\N	\N	\N	--
2	30	03	2006	12	p-30 bn sfhnar	req-30-admin note\r\n	13af6b84-5807-4404-b712-b0937f5f5b6e	2024-02-25 00:00:00	\N	\N	\N	-
\.


                                                                                                                                                                                                                                                                                5179.dat                                                                                            0000600 0004000 0002000 00000001410 14567624677 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	30	6	\N	1	1	--	2024-02-27 00:00:00	\N	\N
7	35	3	\N	1	\N	sac 6k7,p;ogvfr	-infinity	\N	\N
8	9	3	\N	1	\N	wzdxrgen7ik,l	-infinity	\N	\N
9	9	3	\N	1	\N	wzdxrgen7ik,l	-infinity	\N	\N
10	28	3	\N	1	\N	fg rbjy,i,o	-infinity	\N	\N
12	6	3	\N	1	\N	wqs4rb5yjm	-infinity	\N	\N
4	30	1	\N	1	1	-----	2005-12-12 00:00:00	\N	\N
13	16	3	\N	1	\N	sqxcrmhki	-infinity	\N	\N
14	29	3	\N	1	\N	sdvenhm	-infinity	\N	\N
15	4	3	\N	1	\N	xbfhmt	2024-02-28 15:29:11.389753	\N	\N
16	13	3	\N	1	\N	fgnetu	2024-02-28 15:29:21.752655	\N	\N
1	28	1	\N	1	1	this is notes of id 28	2024-02-27 00:00:00	\N	\N
3	28	1	\N	1	1	28 is in 	2024-02-28 00:00:00	\N	\N
11	28	1	\N	1	1	fg rbjy,i,o	-infinity	\N	\N
17	5	3	\N	1	\N	wdf46u7u	2024-02-28 16:22:01.006888	\N	\N
18	15	3	\N	1	\N	WFGERG	2024-02-28 17:23:23.82024	\N	\N
\.


                                                                                                                                                                                                                                                        5187.dat                                                                                            0000600 0004000 0002000 00000000076 14567624677 0014311 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	BusinessPartners
3	Concierge
2	Family/Friend
1	Patient
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                  5189.dat                                                                                            0000600 0004000 0002000 00000003365 14567624677 0014317 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	28	/UploadedFiles/28/HalloDoc - DB (1)-20240213035357.xlsx	2024-02-13 15:53:57.09143	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	30	/UploadedFiles/30/Session 2 (1)-20240214102341.txt	2024-02-14 10:23:41.673231	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	31	/UploadedFiles/31/login-banner-20240214103304.png	2024-02-14 10:33:19.427672	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	32	/UploadedFiles/32/SRS-23-24-Trainees_12Feb24-20240214123753.pdf	2024-02-14 12:37:53.112406	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	33	/UploadedFiles/33/SRS-23-24-Trainees_12Feb24-20240214123850.pdf	2024-02-14 12:38:50.955673	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	34	/UploadedFiles/34/SRS-23-24-Trainees_12Feb24-20240214124010.pdf	2024-02-14 12:40:10.571367	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	34	/Upload/34/HalloDoc - DB updated-20240214055258.xlsx	2024-02-14 17:53:07.077571	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	30	/Upload/30/SRS-23-24-Trainees-14Feb24-20240214055529.pdf	2024-02-14 17:55:33.463509	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	34	/Upload/34/HalloDoc - DB updated-20240214055258 (1)-20240215122057.xlsx	2024-02-15 12:20:57.92791	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	34	/Upload/34/SRS-23-24-Trainees-20240215045111.pdf	2024-02-15 16:51:11.747806	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	34	/Upload/34/postgreSql_coding_exercise-20240216023614.sql	2024-02-16 14:36:14.91004	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	35	/UploadedFiles/35/niti-20240220023759.txt	2024-02-20 14:37:59.042857	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	34	/Upload/34/db tables-20240220024022.sql	2024-02-20 14:40:22.959999	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	35	/Upload/35/niti-20240227112511.txt	2024-02-27 11:25:11.137634	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	32	/Upload/32/db tables-20240227113057.sql	2024-02-27 11:30:57.226094	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	33	/Upload/33/SQL-20240227125318.pdf	2024-02-27 12:53:18.712879	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                           5191.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5195.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5202.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5197.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5199.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5201.dat                                                                                            0000600 0004000 0002000 00000000005 14567624677 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5158.dat                                                                                            0000600 0004000 0002000 00000005264 14567624677 0014313 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	a0ba8ffa-be62-435a-9488-a67b0e550998	niyati.kaneriya@etatvasoft.com	p	niyati.kaneriya@etatvasoft.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a0ba8ffa-be62-435a-9488-a67b0e550998	2024-02-08 16:37:54.651246	\N	\N	\N	\N	\N	\N
2	bfadd279-8c94-4a4a-a651-12915f795704	Niyati	asd	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	bfadd279-8c94-4a4a-a651-12915f795704	2024-02-08 18:24:40.181273	\N	\N	\N	\N	\N	\N
3	13af6b84-5807-4404-b712-b0937f5f5b6e	Niyati	Kaneriya	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	13af6b84-5807-4404-b712-b0937f5f5b6e	2024-02-09 10:03:38.058463	\N	\N	\N	\N	\N	\N
4	fb9709fd-12ec-4a09-8e31-6d633c4d977a	Niyati	Kaneriya	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	fb9709fd-12ec-4a09-8e31-6d633c4d977a	2024-02-09 12:46:49.066178	\N	\N	\N	\N	\N	\N
5	4181dfa4-297d-451e-9141-b1f54a38273a	xyz	p	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	4181dfa4-297d-451e-9141-b1f54a38273a	2024-02-09 12:49:46.914884	\N	\N	\N	\N	\N	\N
6	398907be-ce63-4918-a008-321d50189cb6	Niyati	Kaneriya	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	398907be-ce63-4918-a008-321d50189cb6	2024-02-09 12:53:25.150315	\N	\N	\N	\N	\N	\N
7	e60db1c4-61c6-4a91-8e9a-4557781e948e	Niyati	K	niyati.kaneriya@etatvasoft.com	79843 46545	\N	\N	\N	\N	\N	\N	\N	\N	\N	e60db1c4-61c6-4a91-8e9a-4557781e948e	2024-02-09 14:25:13.438689	\N	\N	\N	\N	\N	\N
8	60a7cd95-fb37-44c6-b13c-f6a336405818	g	g	niyati.kaneriya@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	60a7cd95-fb37-44c6-b13c-f6a336405818	2024-02-09 18:44:55.785376	\N	\N	\N	\N	\N	\N
9	8509ddf2-17ef-4147-9af7-2d383b39a19e	abcd	abcd	abcd@etatvasoft.com	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	8509ddf2-17ef-4147-9af7-2d383b39a19e	2024-02-12 15:40:58.703106	\N	\N	\N	\N	\N	\N
10	d725128c-cc01-45d1-8f63-eb42fe67b42b	rtdhg	kuyy	abvcf@hvjv.vyjj	+1 233-655-4789	\N	\N	\N	\N	\N	\N	\N	\N	\N	d725128c-cc01-45d1-8f63-eb42fe67b42b	2024-02-12 15:45:48.768114	\N	\N	\N	\N	\N	\N
11	ee0c98f9-ce6e-4fc9-b02c-221a14c12282	shreyans	shreyans	shreyans@g.com	123 456	\N	\N	\N	\N	\N	\N	\N	\N	\N	ee0c98f9-ce6e-4fc9-b02c-221a14c12282	2024-02-13 11:59:13.354409	\N	\N	\N	\N	\N	\N
0	f0f8b316-af95-49f8-a206-164091957bb6	Niyati	Kaneriya	niyatik@gmail.com0	7984349009	\N	bombay housing society	ahemdabad	gujarat	\N	3600050	12	2002	8	f0f8b316-af95-49f8-a206-164091957bb6	2024-02-08 14:58:15.067877	\N	2024-02-27 12:25:59.993011	\N	\N	\N	\N
12	5df80732-5198-4c87-b1ea-ebf86cbd7530	Niyati	Kaneriya	niyatik@gmail.com	7984349005	\N	bombay housing 	ahemdabad	gujarat	\N	3600050	12	2002	8	5df80732-5198-4c87-b1ea-ebf86cbd7530	2024-02-13 15:12:13.570202	\N	2024-02-27 12:53:08.109348	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000241567 14567624677 0015433 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "HalloDoc";
--
-- Name: HalloDoc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "HalloDoc" OWNER TO postgres;

\connect "HalloDoc"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Admin" (
    "AdminId" integer NOT NULL,
    "AspNetUserId" character varying(128) NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" boolean,
    "RoleId" integer
);


ALTER TABLE public."Admin" OWNER TO postgres;

--
-- Name: AdminRegion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AdminRegion" (
    "AdminRegionId" integer NOT NULL,
    "AdminId" integer NOT NULL,
    "RegionId" integer NOT NULL
);


ALTER TABLE public."AdminRegion" OWNER TO postgres;

--
-- Name: AdminRegion_AdminRegionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AdminRegion_AdminRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."AdminRegion_AdminRegionId_seq" OWNER TO postgres;

--
-- Name: AdminRegion_AdminRegionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AdminRegion_AdminRegionId_seq" OWNED BY public."AdminRegion"."AdminRegionId";


--
-- Name: Admin_AdminId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Admin_AdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Admin_AdminId_seq" OWNER TO postgres;

--
-- Name: Admin_AdminId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Admin_AdminId_seq" OWNED BY public."Admin"."AdminId";


--
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetRoles" (
    "Id" character varying(128) NOT NULL,
    "Name" character varying(256) NOT NULL
);


ALTER TABLE public."AspNetRoles" OWNER TO postgres;

--
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUsers" (
    "Id" character varying(128) NOT NULL,
    "UserName" character varying(256) NOT NULL,
    "PasswordHash" character varying,
    "Email" character varying(256),
    "PhoneNumber" character varying,
    "IP" character varying(20),
    "ModifiedDate" timestamp without time zone,
    "CreatedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."AspNetUsers" OWNER TO postgres;

--
-- Name: BlockRequests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockRequests" (
    "BlockRequestId" integer NOT NULL,
    "PhoneNumber" character varying(50),
    "Email" character varying(50),
    "IsActive" bit(1),
    "Reason" character varying,
    "RequestId" character varying(50) NOT NULL,
    "IP" character varying(20),
    "CreatedDate" timestamp without time zone,
    "ModifiedDate" timestamp without time zone
);


ALTER TABLE public."BlockRequests" OWNER TO postgres;

--
-- Name: BlockRequests_BlockRequestId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BlockRequests_BlockRequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BlockRequests_BlockRequestId_seq" OWNER TO postgres;

--
-- Name: BlockRequests_BlockRequestId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BlockRequests_BlockRequestId_seq" OWNED BY public."BlockRequests"."BlockRequestId";


--
-- Name: Business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Business" (
    "BusinessId" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(50),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "PhoneNumber" character varying(20),
    "FaxNumber" character varying(20),
    "IsRegistered" bit(1),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20)
);


ALTER TABLE public."Business" OWNER TO postgres;

--
-- Name: Business_BusinessId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Business_BusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Business_BusinessId_seq" OWNER TO postgres;

--
-- Name: Business_BusinessId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Business_BusinessId_seq" OWNED BY public."Business"."BusinessId";


--
-- Name: CaseTag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CaseTag" (
    "CaseTagId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."CaseTag" OWNER TO postgres;

--
-- Name: CaseTag_CaseTagId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CaseTag_CaseTagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CaseTag_CaseTagId_seq" OWNER TO postgres;

--
-- Name: CaseTag_CaseTagId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CaseTag_CaseTagId_seq" OWNED BY public."CaseTag"."CaseTagId";


--
-- Name: Concierge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Concierge" (
    "ConciergeId" integer NOT NULL,
    "ConciergeName" character varying(100) NOT NULL,
    "Address" character varying(150),
    "Street" character varying(50) NOT NULL,
    "City" character varying(50) NOT NULL,
    "State" character varying(50) NOT NULL,
    "ZipCode" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "IP" character varying(20)
);


ALTER TABLE public."Concierge" OWNER TO postgres;

--
-- Name: Concierge_ConciergeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Concierge_ConciergeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Concierge_ConciergeId_seq" OWNER TO postgres;

--
-- Name: Concierge_ConciergeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Concierge_ConciergeId_seq" OWNED BY public."Concierge"."ConciergeId";


--
-- Name: EmailLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EmailLog" (
    "EmailLogID" numeric(9,0) NOT NULL,
    "EmailTemplate" character varying,
    "SubjectName" character varying(200) NOT NULL,
    "EmailID" character varying(200) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "FilePath" character varying,
    "RoleId" integer,
    "RequestId" integer,
    "AdminId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsEmailSent" bit(1),
    "SentTries" integer,
    "Action" integer
);


ALTER TABLE public."EmailLog" OWNER TO postgres;

--
-- Name: HealthProfessionalType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HealthProfessionalType" (
    "HealthProfessionalId" integer NOT NULL,
    "ProfessionName" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsActive" bit(1),
    "IsDeleted" bit(1)
);


ALTER TABLE public."HealthProfessionalType" OWNER TO postgres;

--
-- Name: HealthProfessionalType_HealthProfessionalId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq" OWNER TO postgres;

--
-- Name: HealthProfessionalType_HealthProfessionalId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq" OWNED BY public."HealthProfessionalType"."HealthProfessionalId";


--
-- Name: HealthProfessionals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HealthProfessionals" (
    "VendorId" integer NOT NULL,
    "VendorName" character varying(100) NOT NULL,
    "Profession" integer,
    "FaxNumber" character varying(50) NOT NULL,
    "Address" character varying(150),
    "City" character varying(100),
    "State" character varying(50),
    "Zip" character varying(50),
    "RegionId" integer,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedDate" timestamp without time zone,
    "PhoneNumber" character varying(100),
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "Email" character varying(50),
    "BusinessContact" character varying(100)
);


ALTER TABLE public."HealthProfessionals" OWNER TO postgres;

--
-- Name: HealthProfessionals_VendorId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HealthProfessionals_VendorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."HealthProfessionals_VendorId_seq" OWNER TO postgres;

--
-- Name: HealthProfessionals_VendorId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HealthProfessionals_VendorId_seq" OWNED BY public."HealthProfessionals"."VendorId";


--
-- Name: Menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Menu" (
    "MenuId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "SortOrder" integer,
    CONSTRAINT "Menu_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);


ALTER TABLE public."Menu" OWNER TO postgres;

--
-- Name: Menu_MenuId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Menu_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Menu_MenuId_seq" OWNER TO postgres;

--
-- Name: Menu_MenuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Menu_MenuId_seq" OWNED BY public."Menu"."MenuId";


--
-- Name: OrderDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderDetails" (
    "Id" integer NOT NULL,
    "VendorId" integer,
    "RequestId" integer,
    "FaxNumber" character varying(50),
    "Email" character varying(50),
    "BusinessContact" character varying(100),
    "Prescription" text,
    "NoOfRefill" integer,
    "CreatedDate" timestamp without time zone,
    "CreatedBy" character varying(100)
);


ALTER TABLE public."OrderDetails" OWNER TO postgres;

--
-- Name: OrderDetails_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderDetails_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderDetails_Id_seq" OWNER TO postgres;

--
-- Name: OrderDetails_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderDetails_Id_seq" OWNED BY public."OrderDetails"."Id";


--
-- Name: Physician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Physician" (
    "PhysicianId" integer NOT NULL,
    "Id" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "MedicalLicense" character varying(500),
    "Photo" character varying(100),
    "AdminNotes" character varying(500),
    "IsAgreementDoc" bit(1),
    "IsBackgroundDoc" bit(1),
    "IsTrainingDoc" bit(1),
    "IsNonDisclosureDoc" bit(1),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "BusinessName" character varying(100) NOT NULL,
    "BusinessWebsite" character varying(200) NOT NULL,
    "IsDeleted" bit(1),
    "RoleId" integer,
    "NPINumber" character varying(500),
    "IsLicenseDoc" bit(1),
    "Signature" character varying(100),
    "IsCredentialDoc" bit(1),
    "IsTokenGenerate" bit(1),
    "SyncEmailAddress" character varying(50)
);


ALTER TABLE public."Physician" OWNER TO postgres;

--
-- Name: PhysicianLocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PhysicianLocation" (
    "LocationId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6),
    "CreatedDate" timestamp without time zone,
    "PhysicianName" character varying(50),
    "Address" character varying(500)
);


ALTER TABLE public."PhysicianLocation" OWNER TO postgres;

--
-- Name: PhysicianLocation_LocationId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PhysicianLocation_LocationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PhysicianLocation_LocationId_seq" OWNER TO postgres;

--
-- Name: PhysicianLocation_LocationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PhysicianLocation_LocationId_seq" OWNED BY public."PhysicianLocation"."LocationId";


--
-- Name: PhysicianNotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PhysicianNotification" (
    id integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "IsNotificationStopped" bit(1) NOT NULL
);


ALTER TABLE public."PhysicianNotification" OWNER TO postgres;

--
-- Name: PhysicianNotification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PhysicianNotification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PhysicianNotification_id_seq" OWNER TO postgres;

--
-- Name: PhysicianNotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PhysicianNotification_id_seq" OWNED BY public."PhysicianNotification".id;


--
-- Name: PhysicianRegion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PhysicianRegion" (
    "PhysicianRegionId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "RegionId" integer NOT NULL
);


ALTER TABLE public."PhysicianRegion" OWNER TO postgres;

--
-- Name: PhysicianRegion_PhysicianRegionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq" OWNER TO postgres;

--
-- Name: PhysicianRegion_PhysicianRegionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq" OWNED BY public."PhysicianRegion"."PhysicianRegionId";


--
-- Name: Physician_PhysicianId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Physician_PhysicianId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Physician_PhysicianId_seq" OWNER TO postgres;

--
-- Name: Physician_PhysicianId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Physician_PhysicianId_seq" OWNED BY public."Physician"."PhysicianId";


--
-- Name: Region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Region" (
    "RegionId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Abbreviation" character varying(50)
);


ALTER TABLE public."Region" OWNER TO postgres;

--
-- Name: Region_RegionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Region_RegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Region_RegionId_seq" OWNER TO postgres;

--
-- Name: Region_RegionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Region_RegionId_seq" OWNED BY public."Region"."RegionId";


--
-- Name: Request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Request" (
    "RequestId" integer NOT NULL,
    "RequestTypeId" integer NOT NULL,
    "UserId" integer,
    "FirstName" character varying(100),
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Email" character varying(50),
    "Status" smallint NOT NULL,
    "PhysicianId" integer,
    "ConfirmationNumber" character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsDeleted" bit(1),
    "ModifiedDate" timestamp without time zone,
    "DeclinedBy" character varying(250),
    "IsUrgentEmailSent" bit(1),
    "LastWellnessDate" timestamp without time zone,
    "IsMobile" bit(1),
    "CallType" smallint,
    "CompletedByPhysician" bit(1),
    "LastReservationDate" timestamp without time zone,
    "AcceptedDate" timestamp without time zone,
    "RelationName" character varying(100),
    "CaseNumber" character varying(50),
    "IP" character varying(20),
    "CaseTag" character varying(50),
    "CaseTagPhysician" character varying(50),
    "PatientAccountId" character varying(128),
    "CreatedUserId" integer,
    CONSTRAINT "Request_RequestTypeId_check" CHECK (("RequestTypeId" = ANY (ARRAY[1, 2, 3, 4]))),
    CONSTRAINT "Request_Status_check" CHECK (("Status" = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])))
);


ALTER TABLE public."Request" OWNER TO postgres;

--
-- Name: RequestBusiness; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestBusiness" (
    "RequestBusinessId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "BusinessId" integer NOT NULL,
    "IP" character varying(20)
);


ALTER TABLE public."RequestBusiness" OWNER TO postgres;

--
-- Name: RequestBusiness_RequestBusinessId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestBusiness_RequestBusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestBusiness_RequestBusinessId_seq" OWNER TO postgres;

--
-- Name: RequestBusiness_RequestBusinessId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestBusiness_RequestBusinessId_seq" OWNED BY public."RequestBusiness"."RequestBusinessId";


--
-- Name: RequestClient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestClient" (
    "RequestClientId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Location" character varying(100),
    "Address" character varying(500),
    "RegionId" integer,
    "NotiMobile" character varying(20),
    "NotiEmail" character varying(50),
    "Notes" character varying(500),
    "Email" character varying(50),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "ZipCode" character varying(10),
    "CommunicationType" smallint,
    "RemindReservationCount" smallint,
    "RemindHouseCallCount" smallint,
    "IsSetFollowupSent" smallint,
    "IP" character varying(20),
    "IsReservationReminderSent" smallint,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6)
);


ALTER TABLE public."RequestClient" OWNER TO postgres;

--
-- Name: RequestClient_RequestClientId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestClient_RequestClientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestClient_RequestClientId_seq" OWNER TO postgres;

--
-- Name: RequestClient_RequestClientId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestClient_RequestClientId_seq" OWNED BY public."RequestClient"."RequestClientId";


--
-- Name: RequestClosed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestClosed" (
    "RequestClosedId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "RequestStatusLogId" integer NOT NULL,
    "PhyNotes" character varying(500),
    "ClientNotes" character varying(500),
    "IP" character varying(20)
);


ALTER TABLE public."RequestClosed" OWNER TO postgres;

--
-- Name: RequestClosed_RequestClosedId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestClosed_RequestClosedId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestClosed_RequestClosedId_seq" OWNER TO postgres;

--
-- Name: RequestClosed_RequestClosedId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestClosed_RequestClosedId_seq" OWNED BY public."RequestClosed"."RequestClosedId";


--
-- Name: RequestConcierge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestConcierge" (
    "Id" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "ConciergeId" integer NOT NULL,
    "IP" character varying(20)
);


ALTER TABLE public."RequestConcierge" OWNER TO postgres;

--
-- Name: RequestConcierge_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestConcierge_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestConcierge_Id_seq" OWNER TO postgres;

--
-- Name: RequestConcierge_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestConcierge_Id_seq" OWNED BY public."RequestConcierge"."Id";


--
-- Name: RequestNotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestNotes" (
    "RequestNotesId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "PhysicianNotes" character varying(500),
    "AdminNotes" character varying(500),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IP" character varying(20),
    "AdministrativeNotes" character varying(500)
);


ALTER TABLE public."RequestNotes" OWNER TO postgres;

--
-- Name: RequestNotes_RequestNotesId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestNotes_RequestNotesId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestNotes_RequestNotesId_seq" OWNER TO postgres;

--
-- Name: RequestNotes_RequestNotesId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestNotes_RequestNotesId_seq" OWNED BY public."RequestNotes"."RequestNotesId";


--
-- Name: RequestStatusLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestStatusLog" (
    "RequestStatusLogId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "Status" smallint NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "TransToPhysicianId" integer,
    "Notes" character varying(500),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20),
    "TransToAdmin" bit(1)
);


ALTER TABLE public."RequestStatusLog" OWNER TO postgres;

--
-- Name: RequestStatusLog_RequestStatusLogId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq" OWNER TO postgres;

--
-- Name: RequestStatusLog_RequestStatusLogId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq" OWNED BY public."RequestStatusLog"."RequestStatusLogId";


--
-- Name: RequestType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestType" (
    "RequestTypeId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."RequestType" OWNER TO postgres;

--
-- Name: RequestType_RequestTypeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestType_RequestTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestType_RequestTypeId_seq" OWNER TO postgres;

--
-- Name: RequestType_RequestTypeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestType_RequestTypeId_seq" OWNED BY public."RequestType"."RequestTypeId";


--
-- Name: RequestWiseFile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestWiseFile" (
    "RequestWiseFileID" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FileName" character varying(500) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "DocType" smallint,
    "IsFrontSide" bit(1),
    "IsCompensation" bit(1),
    "IP" character varying(20),
    "IsFinalize" bit(1),
    "IsDeleted" bit(1),
    "IsPatientRecords" bit(1)
);


ALTER TABLE public."RequestWiseFile" OWNER TO postgres;

--
-- Name: RequestWiseFile_RequestWiseFileID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq" OWNER TO postgres;

--
-- Name: RequestWiseFile_RequestWiseFileID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq" OWNED BY public."RequestWiseFile"."RequestWiseFileID";


--
-- Name: Request_RequestId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Request_RequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Request_RequestId_seq" OWNER TO postgres;

--
-- Name: Request_RequestId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Request_RequestId_seq" OWNED BY public."Request"."RequestId";


--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "RoleId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IsDeleted" bit(1) NOT NULL,
    "IP" character varying(20),
    CONSTRAINT "Role_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: RoleMenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RoleMenu" (
    "RoleMenuId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "MenuId" integer NOT NULL
);


ALTER TABLE public."RoleMenu" OWNER TO postgres;

--
-- Name: RoleMenu_RoleMenuId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RoleMenu_RoleMenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RoleMenu_RoleMenuId_seq" OWNER TO postgres;

--
-- Name: RoleMenu_RoleMenuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RoleMenu_RoleMenuId_seq" OWNED BY public."RoleMenu"."RoleMenuId";


--
-- Name: Role_RoleId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_RoleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Role_RoleId_seq" OWNER TO postgres;

--
-- Name: Role_RoleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_RoleId_seq" OWNED BY public."Role"."RoleId";


--
-- Name: SMSLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SMSLog" (
    "SMSLogID" numeric(9,0) NOT NULL,
    "SMSTemplate" character varying NOT NULL,
    "MobileNumber" character varying(50) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "RoleId" integer,
    "AdminId" integer,
    "RequestId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsSMSSent" bit(1),
    "SentTries" integer NOT NULL,
    "Action" integer
);


ALTER TABLE public."SMSLog" OWNER TO postgres;

--
-- Name: Shift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shift" (
    "ShiftId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "StartDate" date NOT NULL,
    "IsRepeat" bit(1) NOT NULL,
    "WeekDays" character(7),
    "RepeatUpto" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20)
);


ALTER TABLE public."Shift" OWNER TO postgres;

--
-- Name: ShiftDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShiftDetail" (
    "ShiftDetailId" integer NOT NULL,
    "ShiftId" integer NOT NULL,
    "ShiftDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL,
    "Status" smallint NOT NULL,
    "IsDeleted" bit(1) NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "LastRunningDate" timestamp without time zone,
    "EventId" character varying(100),
    "IsSync" bit(1)
);


ALTER TABLE public."ShiftDetail" OWNER TO postgres;

--
-- Name: ShiftDetailRegion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShiftDetailRegion" (
    "ShiftDetailRegionId" integer NOT NULL,
    "ShiftDetailId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    "IsDeleted" bit(1)
);


ALTER TABLE public."ShiftDetailRegion" OWNER TO postgres;

--
-- Name: ShiftDetailRegion_ShiftDetailRegionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq" OWNER TO postgres;

--
-- Name: ShiftDetailRegion_ShiftDetailRegionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq" OWNED BY public."ShiftDetailRegion"."ShiftDetailRegionId";


--
-- Name: ShiftDetail_ShiftDetailId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ShiftDetail_ShiftDetailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ShiftDetail_ShiftDetailId_seq" OWNER TO postgres;

--
-- Name: ShiftDetail_ShiftDetailId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ShiftDetail_ShiftDetailId_seq" OWNED BY public."ShiftDetail"."ShiftDetailId";


--
-- Name: Shift_ShiftId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Shift_ShiftId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Shift_ShiftId_seq" OWNER TO postgres;

--
-- Name: Shift_ShiftId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Shift_ShiftId_seq" OWNED BY public."Shift"."ShiftId";


--
-- Name: user_sequence_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_sequence_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_sequence_id OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "UserId" integer DEFAULT nextval('public.user_sequence_id'::regclass) NOT NULL,
    "Id" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "IsRequestWithEmail" bit(1)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: Admin AdminId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin" ALTER COLUMN "AdminId" SET DEFAULT nextval('public."Admin_AdminId_seq"'::regclass);


--
-- Name: AdminRegion AdminRegionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdminRegion" ALTER COLUMN "AdminRegionId" SET DEFAULT nextval('public."AdminRegion_AdminRegionId_seq"'::regclass);


--
-- Name: BlockRequests BlockRequestId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockRequests" ALTER COLUMN "BlockRequestId" SET DEFAULT nextval('public."BlockRequests_BlockRequestId_seq"'::regclass);


--
-- Name: Business BusinessId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Business" ALTER COLUMN "BusinessId" SET DEFAULT nextval('public."Business_BusinessId_seq"'::regclass);


--
-- Name: CaseTag CaseTagId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseTag" ALTER COLUMN "CaseTagId" SET DEFAULT nextval('public."CaseTag_CaseTagId_seq"'::regclass);


--
-- Name: Concierge ConciergeId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Concierge" ALTER COLUMN "ConciergeId" SET DEFAULT nextval('public."Concierge_ConciergeId_seq"'::regclass);


--
-- Name: HealthProfessionalType HealthProfessionalId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" SET DEFAULT nextval('public."HealthProfessionalType_HealthProfessionalId_seq"'::regclass);


--
-- Name: HealthProfessionals VendorId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HealthProfessionals" ALTER COLUMN "VendorId" SET DEFAULT nextval('public."HealthProfessionals_VendorId_seq"'::regclass);


--
-- Name: Menu MenuId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menu" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Menu_MenuId_seq"'::regclass);


--
-- Name: OrderDetails Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDetails" ALTER COLUMN "Id" SET DEFAULT nextval('public."OrderDetails_Id_seq"'::regclass);


--
-- Name: Physician PhysicianId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Physician" ALTER COLUMN "PhysicianId" SET DEFAULT nextval('public."Physician_PhysicianId_seq"'::regclass);


--
-- Name: PhysicianLocation LocationId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianLocation" ALTER COLUMN "LocationId" SET DEFAULT nextval('public."PhysicianLocation_LocationId_seq"'::regclass);


--
-- Name: PhysicianNotification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianNotification" ALTER COLUMN id SET DEFAULT nextval('public."PhysicianNotification_id_seq"'::regclass);


--
-- Name: PhysicianRegion PhysicianRegionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" SET DEFAULT nextval('public."PhysicianRegion_PhysicianRegionId_seq"'::regclass);


--
-- Name: Region RegionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Region" ALTER COLUMN "RegionId" SET DEFAULT nextval('public."Region_RegionId_seq"'::regclass);


--
-- Name: Request RequestId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request" ALTER COLUMN "RequestId" SET DEFAULT nextval('public."Request_RequestId_seq"'::regclass);


--
-- Name: RequestBusiness RequestBusinessId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestBusiness" ALTER COLUMN "RequestBusinessId" SET DEFAULT nextval('public."RequestBusiness_RequestBusinessId_seq"'::regclass);


--
-- Name: RequestClient RequestClientId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClient" ALTER COLUMN "RequestClientId" SET DEFAULT nextval('public."RequestClient_RequestClientId_seq"'::regclass);


--
-- Name: RequestClosed RequestClosedId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClosed" ALTER COLUMN "RequestClosedId" SET DEFAULT nextval('public."RequestClosed_RequestClosedId_seq"'::regclass);


--
-- Name: RequestConcierge Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestConcierge" ALTER COLUMN "Id" SET DEFAULT nextval('public."RequestConcierge_Id_seq"'::regclass);


--
-- Name: RequestNotes RequestNotesId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestNotes" ALTER COLUMN "RequestNotesId" SET DEFAULT nextval('public."RequestNotes_RequestNotesId_seq"'::regclass);


--
-- Name: RequestStatusLog RequestStatusLogId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" SET DEFAULT nextval('public."RequestStatusLog_RequestStatusLogId_seq"'::regclass);


--
-- Name: RequestType RequestTypeId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestType" ALTER COLUMN "RequestTypeId" SET DEFAULT nextval('public."RequestType_RequestTypeId_seq"'::regclass);


--
-- Name: RequestWiseFile RequestWiseFileID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" SET DEFAULT nextval('public."RequestWiseFile_RequestWiseFileID_seq"'::regclass);


--
-- Name: Role RoleId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Role_RoleId_seq"'::regclass);


--
-- Name: RoleMenu RoleMenuId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleMenu" ALTER COLUMN "RoleMenuId" SET DEFAULT nextval('public."RoleMenu_RoleMenuId_seq"'::regclass);


--
-- Name: Shift ShiftId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift" ALTER COLUMN "ShiftId" SET DEFAULT nextval('public."Shift_ShiftId_seq"'::regclass);


--
-- Name: ShiftDetail ShiftDetailId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetail" ALTER COLUMN "ShiftDetailId" SET DEFAULT nextval('public."ShiftDetail_ShiftDetailId_seq"'::regclass);


--
-- Name: ShiftDetailRegion ShiftDetailRegionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" SET DEFAULT nextval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"'::regclass);


--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Admin" ("AdminId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "RoleId") FROM stdin;
\.
COPY public."Admin" ("AdminId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "RoleId") FROM '$$PATH$$/5145.dat';

--
-- Data for Name: AdminRegion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AdminRegion" ("AdminRegionId", "AdminId", "RegionId") FROM stdin;
\.
COPY public."AdminRegion" ("AdminRegionId", "AdminId", "RegionId") FROM '$$PATH$$/5153.dat';

--
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetRoles" ("Id", "Name") FROM stdin;
\.
COPY public."AspNetRoles" ("Id", "Name") FROM '$$PATH$$/5143.dat';

--
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUsers" ("Id", "UserName", "PasswordHash", "Email", "PhoneNumber", "IP", "ModifiedDate", "CreatedDate") FROM stdin;
\.
COPY public."AspNetUsers" ("Id", "UserName", "PasswordHash", "Email", "PhoneNumber", "IP", "ModifiedDate", "CreatedDate") FROM '$$PATH$$/5142.dat';

--
-- Data for Name: BlockRequests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockRequests" ("BlockRequestId", "PhoneNumber", "Email", "IsActive", "Reason", "RequestId", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
\.
COPY public."BlockRequests" ("BlockRequestId", "PhoneNumber", "Email", "IsActive", "Reason", "RequestId", "IP", "CreatedDate", "ModifiedDate") FROM '$$PATH$$/5147.dat';

--
-- Data for Name: Business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Business" ("BusinessId", "Name", "Address1", "Address2", "City", "RegionId", "ZipCode", "PhoneNumber", "FaxNumber", "IsRegistered", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP") FROM stdin;
\.
COPY public."Business" ("BusinessId", "Name", "Address1", "Address2", "City", "RegionId", "ZipCode", "PhoneNumber", "FaxNumber", "IsRegistered", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP") FROM '$$PATH$$/5155.dat';

--
-- Data for Name: CaseTag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CaseTag" ("CaseTagId", "Name") FROM stdin;
\.
COPY public."CaseTag" ("CaseTagId", "Name") FROM '$$PATH$$/5149.dat';

--
-- Data for Name: Concierge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Concierge" ("ConciergeId", "ConciergeName", "Address", "Street", "City", "State", "ZipCode", "CreatedDate", "RegionId", "IP") FROM stdin;
\.
COPY public."Concierge" ("ConciergeId", "ConciergeName", "Address", "Street", "City", "State", "ZipCode", "CreatedDate", "RegionId", "IP") FROM '$$PATH$$/5157.dat';

--
-- Data for Name: EmailLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EmailLog" ("EmailLogID", "EmailTemplate", "SubjectName", "EmailID", "ConfirmationNumber", "FilePath", "RoleId", "RequestId", "AdminId", "PhysicianId", "CreateDate", "SentDate", "IsEmailSent", "SentTries", "Action") FROM stdin;
\.
COPY public."EmailLog" ("EmailLogID", "EmailTemplate", "SubjectName", "EmailID", "ConfirmationNumber", "FilePath", "RoleId", "RequestId", "AdminId", "PhysicianId", "CreateDate", "SentDate", "IsEmailSent", "SentTries", "Action") FROM '$$PATH$$/5159.dat';

--
-- Data for Name: HealthProfessionalType; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HealthProfessionalType" ("HealthProfessionalId", "ProfessionName", "CreatedDate", "IsActive", "IsDeleted") FROM stdin;
\.
COPY public."HealthProfessionalType" ("HealthProfessionalId", "ProfessionName", "CreatedDate", "IsActive", "IsDeleted") FROM '$$PATH$$/5161.dat';

--
-- Data for Name: HealthProfessionals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HealthProfessionals" ("VendorId", "VendorName", "Profession", "FaxNumber", "Address", "City", "State", "Zip", "RegionId", "CreatedDate", "ModifiedDate", "PhoneNumber", "IsDeleted", "IP", "Email", "BusinessContact") FROM stdin;
\.
COPY public."HealthProfessionals" ("VendorId", "VendorName", "Profession", "FaxNumber", "Address", "City", "State", "Zip", "RegionId", "CreatedDate", "ModifiedDate", "PhoneNumber", "IsDeleted", "IP", "Email", "BusinessContact") FROM '$$PATH$$/5163.dat';

--
-- Data for Name: Menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Menu" ("MenuId", "Name", "AccountType", "SortOrder") FROM stdin;
\.
COPY public."Menu" ("MenuId", "Name", "AccountType", "SortOrder") FROM '$$PATH$$/5193.dat';

--
-- Data for Name: OrderDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDetails" ("Id", "VendorId", "RequestId", "FaxNumber", "Email", "BusinessContact", "Prescription", "NoOfRefill", "CreatedDate", "CreatedBy") FROM stdin;
\.
COPY public."OrderDetails" ("Id", "VendorId", "RequestId", "FaxNumber", "Email", "BusinessContact", "Prescription", "NoOfRefill", "CreatedDate", "CreatedBy") FROM '$$PATH$$/5165.dat';

--
-- Data for Name: Physician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Physician" ("PhysicianId", "Id", "FirstName", "LastName", "Email", "Mobile", "MedicalLicense", "Photo", "AdminNotes", "IsAgreementDoc", "IsBackgroundDoc", "IsTrainingDoc", "IsNonDisclosureDoc", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "BusinessName", "BusinessWebsite", "IsDeleted", "RoleId", "NPINumber", "IsLicenseDoc", "Signature", "IsCredentialDoc", "IsTokenGenerate", "SyncEmailAddress") FROM stdin;
\.
COPY public."Physician" ("PhysicianId", "Id", "FirstName", "LastName", "Email", "Mobile", "MedicalLicense", "Photo", "AdminNotes", "IsAgreementDoc", "IsBackgroundDoc", "IsTrainingDoc", "IsNonDisclosureDoc", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "BusinessName", "BusinessWebsite", "IsDeleted", "RoleId", "NPINumber", "IsLicenseDoc", "Signature", "IsCredentialDoc", "IsTokenGenerate", "SyncEmailAddress") FROM '$$PATH$$/5167.dat';

--
-- Data for Name: PhysicianLocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PhysicianLocation" ("LocationId", "PhysicianId", "Latitude", "Longitude", "CreatedDate", "PhysicianName", "Address") FROM stdin;
\.
COPY public."PhysicianLocation" ("LocationId", "PhysicianId", "Latitude", "Longitude", "CreatedDate", "PhysicianName", "Address") FROM '$$PATH$$/5204.dat';

--
-- Data for Name: PhysicianNotification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PhysicianNotification" (id, "PhysicianId", "IsNotificationStopped") FROM stdin;
\.
COPY public."PhysicianNotification" (id, "PhysicianId", "IsNotificationStopped") FROM '$$PATH$$/5169.dat';

--
-- Data for Name: PhysicianRegion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PhysicianRegion" ("PhysicianRegionId", "PhysicianId", "RegionId") FROM stdin;
\.
COPY public."PhysicianRegion" ("PhysicianRegionId", "PhysicianId", "RegionId") FROM '$$PATH$$/5171.dat';

--
-- Data for Name: Region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Region" ("RegionId", "Name", "Abbreviation") FROM stdin;
\.
COPY public."Region" ("RegionId", "Name", "Abbreviation") FROM '$$PATH$$/5151.dat';

--
-- Data for Name: Request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Request" ("RequestId", "RequestTypeId", "UserId", "FirstName", "LastName", "PhoneNumber", "Email", "Status", "PhysicianId", "ConfirmationNumber", "CreatedDate", "IsDeleted", "ModifiedDate", "DeclinedBy", "IsUrgentEmailSent", "LastWellnessDate", "IsMobile", "CallType", "CompletedByPhysician", "LastReservationDate", "AcceptedDate", "RelationName", "CaseNumber", "IP", "CaseTag", "CaseTagPhysician", "PatientAccountId", "CreatedUserId") FROM stdin;
\.
COPY public."Request" ("RequestId", "RequestTypeId", "UserId", "FirstName", "LastName", "PhoneNumber", "Email", "Status", "PhysicianId", "ConfirmationNumber", "CreatedDate", "IsDeleted", "ModifiedDate", "DeclinedBy", "IsUrgentEmailSent", "LastWellnessDate", "IsMobile", "CallType", "CompletedByPhysician", "LastReservationDate", "AcceptedDate", "RelationName", "CaseNumber", "IP", "CaseTag", "CaseTagPhysician", "PatientAccountId", "CreatedUserId") FROM '$$PATH$$/5173.dat';

--
-- Data for Name: RequestBusiness; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestBusiness" ("RequestBusinessId", "RequestId", "BusinessId", "IP") FROM stdin;
\.
COPY public."RequestBusiness" ("RequestBusinessId", "RequestId", "BusinessId", "IP") FROM '$$PATH$$/5175.dat';

--
-- Data for Name: RequestClient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestClient" ("RequestClientId", "RequestId", "FirstName", "LastName", "PhoneNumber", "Location", "Address", "RegionId", "NotiMobile", "NotiEmail", "Notes", "Email", "strMonth", "intYear", "intDate", "IsMobile", "Street", "City", "State", "ZipCode", "CommunicationType", "RemindReservationCount", "RemindHouseCallCount", "IsSetFollowupSent", "IP", "IsReservationReminderSent", "Latitude", "Longitude") FROM stdin;
\.
COPY public."RequestClient" ("RequestClientId", "RequestId", "FirstName", "LastName", "PhoneNumber", "Location", "Address", "RegionId", "NotiMobile", "NotiEmail", "Notes", "Email", "strMonth", "intYear", "intDate", "IsMobile", "Street", "City", "State", "ZipCode", "CommunicationType", "RemindReservationCount", "RemindHouseCallCount", "IsSetFollowupSent", "IP", "IsReservationReminderSent", "Latitude", "Longitude") FROM '$$PATH$$/5177.dat';

--
-- Data for Name: RequestClosed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestClosed" ("RequestClosedId", "RequestId", "RequestStatusLogId", "PhyNotes", "ClientNotes", "IP") FROM stdin;
\.
COPY public."RequestClosed" ("RequestClosedId", "RequestId", "RequestStatusLogId", "PhyNotes", "ClientNotes", "IP") FROM '$$PATH$$/5181.dat';

--
-- Data for Name: RequestConcierge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestConcierge" ("Id", "RequestId", "ConciergeId", "IP") FROM stdin;
\.
COPY public."RequestConcierge" ("Id", "RequestId", "ConciergeId", "IP") FROM '$$PATH$$/5183.dat';

--
-- Data for Name: RequestNotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestNotes" ("RequestNotesId", "RequestId", "strMonth", "intYear", "intDate", "PhysicianNotes", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IP", "AdministrativeNotes") FROM stdin;
\.
COPY public."RequestNotes" ("RequestNotesId", "RequestId", "strMonth", "intYear", "intDate", "PhysicianNotes", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IP", "AdministrativeNotes") FROM '$$PATH$$/5185.dat';

--
-- Data for Name: RequestStatusLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestStatusLog" ("RequestStatusLogId", "RequestId", "Status", "PhysicianId", "AdminId", "TransToPhysicianId", "Notes", "CreatedDate", "IP", "TransToAdmin") FROM stdin;
\.
COPY public."RequestStatusLog" ("RequestStatusLogId", "RequestId", "Status", "PhysicianId", "AdminId", "TransToPhysicianId", "Notes", "CreatedDate", "IP", "TransToAdmin") FROM '$$PATH$$/5179.dat';

--
-- Data for Name: RequestType; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestType" ("RequestTypeId", "Name") FROM stdin;
\.
COPY public."RequestType" ("RequestTypeId", "Name") FROM '$$PATH$$/5187.dat';

--
-- Data for Name: RequestWiseFile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestWiseFile" ("RequestWiseFileID", "RequestId", "FileName", "CreatedDate", "PhysicianId", "AdminId", "DocType", "IsFrontSide", "IsCompensation", "IP", "IsFinalize", "IsDeleted", "IsPatientRecords") FROM stdin;
\.
COPY public."RequestWiseFile" ("RequestWiseFileID", "RequestId", "FileName", "CreatedDate", "PhysicianId", "AdminId", "DocType", "IsFrontSide", "IsCompensation", "IP", "IsFinalize", "IsDeleted", "IsPatientRecords") FROM '$$PATH$$/5189.dat';

--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Role" ("RoleId", "Name", "AccountType", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IsDeleted", "IP") FROM stdin;
\.
COPY public."Role" ("RoleId", "Name", "AccountType", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IsDeleted", "IP") FROM '$$PATH$$/5191.dat';

--
-- Data for Name: RoleMenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RoleMenu" ("RoleMenuId", "RoleId", "MenuId") FROM stdin;
\.
COPY public."RoleMenu" ("RoleMenuId", "RoleId", "MenuId") FROM '$$PATH$$/5195.dat';

--
-- Data for Name: SMSLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SMSLog" ("SMSLogID", "SMSTemplate", "MobileNumber", "ConfirmationNumber", "RoleId", "AdminId", "RequestId", "PhysicianId", "CreateDate", "SentDate", "IsSMSSent", "SentTries", "Action") FROM stdin;
\.
COPY public."SMSLog" ("SMSLogID", "SMSTemplate", "MobileNumber", "ConfirmationNumber", "RoleId", "AdminId", "RequestId", "PhysicianId", "CreateDate", "SentDate", "IsSMSSent", "SentTries", "Action") FROM '$$PATH$$/5202.dat';

--
-- Data for Name: Shift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Shift" ("ShiftId", "PhysicianId", "StartDate", "IsRepeat", "WeekDays", "RepeatUpto", "CreatedBy", "CreatedDate", "IP") FROM stdin;
\.
COPY public."Shift" ("ShiftId", "PhysicianId", "StartDate", "IsRepeat", "WeekDays", "RepeatUpto", "CreatedBy", "CreatedDate", "IP") FROM '$$PATH$$/5197.dat';

--
-- Data for Name: ShiftDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShiftDetail" ("ShiftDetailId", "ShiftId", "ShiftDate", "RegionId", "StartTime", "EndTime", "Status", "IsDeleted", "ModifiedBy", "ModifiedDate", "LastRunningDate", "EventId", "IsSync") FROM stdin;
\.
COPY public."ShiftDetail" ("ShiftDetailId", "ShiftId", "ShiftDate", "RegionId", "StartTime", "EndTime", "Status", "IsDeleted", "ModifiedBy", "ModifiedDate", "LastRunningDate", "EventId", "IsSync") FROM '$$PATH$$/5199.dat';

--
-- Data for Name: ShiftDetailRegion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShiftDetailRegion" ("ShiftDetailRegionId", "ShiftDetailId", "RegionId", "IsDeleted") FROM stdin;
\.
COPY public."ShiftDetailRegion" ("ShiftDetailRegionId", "ShiftDetailId", "RegionId", "IsDeleted") FROM '$$PATH$$/5201.dat';

--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("UserId", "Id", "FirstName", "LastName", "Email", "Mobile", "IsMobile", "Street", "City", "State", "RegionId", "ZipCode", "strMonth", "intYear", "intDate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP", "IsRequestWithEmail") FROM stdin;
\.
COPY public."User" ("UserId", "Id", "FirstName", "LastName", "Email", "Mobile", "IsMobile", "Street", "City", "State", "RegionId", "ZipCode", "strMonth", "intYear", "intDate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP", "IsRequestWithEmail") FROM '$$PATH$$/5158.dat';

--
-- Name: AdminRegion_AdminRegionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AdminRegion_AdminRegionId_seq"', 1, false);


--
-- Name: Admin_AdminId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Admin_AdminId_seq"', 1, false);


--
-- Name: BlockRequests_BlockRequestId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BlockRequests_BlockRequestId_seq"', 1, false);


--
-- Name: Business_BusinessId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Business_BusinessId_seq"', 2, true);


--
-- Name: CaseTag_CaseTagId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CaseTag_CaseTagId_seq"', 4, true);


--
-- Name: Concierge_ConciergeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Concierge_ConciergeId_seq"', 5, true);


--
-- Name: HealthProfessionalType_HealthProfessionalId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HealthProfessionalType_HealthProfessionalId_seq"', 1, false);


--
-- Name: HealthProfessionals_VendorId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HealthProfessionals_VendorId_seq"', 1, false);


--
-- Name: Menu_MenuId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Menu_MenuId_seq"', 1, false);


--
-- Name: OrderDetails_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderDetails_Id_seq"', 1, false);


--
-- Name: PhysicianLocation_LocationId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PhysicianLocation_LocationId_seq"', 1, false);


--
-- Name: PhysicianNotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PhysicianNotification_id_seq"', 1, false);


--
-- Name: PhysicianRegion_PhysicianRegionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PhysicianRegion_PhysicianRegionId_seq"', 1, false);


--
-- Name: Physician_PhysicianId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Physician_PhysicianId_seq"', 1, false);


--
-- Name: Region_RegionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Region_RegionId_seq"', 1, false);


--
-- Name: RequestBusiness_RequestBusinessId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestBusiness_RequestBusinessId_seq"', 1, true);


--
-- Name: RequestClient_RequestClientId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestClient_RequestClientId_seq"', 35, true);


--
-- Name: RequestClosed_RequestClosedId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestClosed_RequestClosedId_seq"', 1, false);


--
-- Name: RequestConcierge_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestConcierge_Id_seq"', 3, true);


--
-- Name: RequestNotes_RequestNotesId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestNotes_RequestNotesId_seq"', 1, false);


--
-- Name: RequestStatusLog_RequestStatusLogId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestStatusLog_RequestStatusLogId_seq"', 18, true);


--
-- Name: RequestType_RequestTypeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestType_RequestTypeId_seq"', 1, false);


--
-- Name: RequestWiseFile_RequestWiseFileID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestWiseFile_RequestWiseFileID_seq"', 16, true);


--
-- Name: Request_RequestId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Request_RequestId_seq"', 35, true);


--
-- Name: RoleMenu_RoleMenuId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RoleMenu_RoleMenuId_seq"', 1, false);


--
-- Name: Role_RoleId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_RoleId_seq"', 1, false);


--
-- Name: ShiftDetailRegion_ShiftDetailRegionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"', 1, false);


--
-- Name: ShiftDetail_ShiftDetailId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ShiftDetail_ShiftDetailId_seq"', 1, false);


--
-- Name: Shift_ShiftId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Shift_ShiftId_seq"', 1, false);


--
-- Name: user_sequence_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_sequence_id', 12, true);


--
-- Name: AdminRegion AdminRegion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "AdminRegion_pkey" PRIMARY KEY ("AdminRegionId");


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("AdminId");


--
-- Name: AspNetRoles AspNetRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "AspNetRoles_pkey" PRIMARY KEY ("Id");


--
-- Name: AspNetUsers AspNetUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "AspNetUsers_pkey" PRIMARY KEY ("Id");


--
-- Name: BlockRequests BlockRequests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockRequests"
    ADD CONSTRAINT "BlockRequests_pkey" PRIMARY KEY ("BlockRequestId");


--
-- Name: Business Business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessId");


--
-- Name: CaseTag CaseTag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaseTag"
    ADD CONSTRAINT "CaseTag_pkey" PRIMARY KEY ("CaseTagId");


--
-- Name: Concierge Concierge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_pkey" PRIMARY KEY ("ConciergeId");


--
-- Name: EmailLog EmailLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailLog"
    ADD CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("EmailLogID");


--
-- Name: HealthProfessionalType HealthProfessionalType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HealthProfessionalType"
    ADD CONSTRAINT "HealthProfessionalType_pkey" PRIMARY KEY ("HealthProfessionalId");


--
-- Name: HealthProfessionals HealthProfessionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_pkey" PRIMARY KEY ("VendorId");


--
-- Name: Menu Menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId");


--
-- Name: OrderDetails OrderDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("Id");


--
-- Name: PhysicianLocation PhysicianLocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_pkey" PRIMARY KEY ("LocationId");


--
-- Name: PhysicianNotification PhysicianNotification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_pkey" PRIMARY KEY (id);


--
-- Name: PhysicianRegion PhysicianRegion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_pkey" PRIMARY KEY ("PhysicianRegionId");


--
-- Name: Physician Physician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_pkey" PRIMARY KEY ("PhysicianId");


--
-- Name: Region Region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("RegionId");


--
-- Name: RequestBusiness RequestBusiness_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_pkey" PRIMARY KEY ("RequestBusinessId");


--
-- Name: RequestClient RequestClient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_pkey" PRIMARY KEY ("RequestClientId");


--
-- Name: RequestClosed RequestClosed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_pkey" PRIMARY KEY ("RequestClosedId");


--
-- Name: RequestConcierge RequestConcierge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_pkey" PRIMARY KEY ("Id");


--
-- Name: RequestNotes RequestNotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_pkey" PRIMARY KEY ("RequestNotesId");


--
-- Name: RequestStatusLog RequestStatusLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_pkey" PRIMARY KEY ("RequestStatusLogId");


--
-- Name: RequestType RequestType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestType"
    ADD CONSTRAINT "RequestType_pkey" PRIMARY KEY ("RequestTypeId");


--
-- Name: RequestWiseFile RequestWiseFile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_pkey" PRIMARY KEY ("RequestWiseFileID");


--
-- Name: Request Request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY ("RequestId");


--
-- Name: RoleMenu RoleMenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_pkey" PRIMARY KEY ("RoleMenuId");


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("RoleId");


--
-- Name: SMSLog SMSLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SMSLog"
    ADD CONSTRAINT "SMSLog_pkey" PRIMARY KEY ("SMSLogID");


--
-- Name: ShiftDetailRegion ShiftDetailRegion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_pkey" PRIMARY KEY ("ShiftDetailRegionId");


--
-- Name: ShiftDetail ShiftDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_pkey" PRIMARY KEY ("ShiftDetailId");


--
-- Name: Shift Shift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY ("ShiftId");


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");


--
-- Name: Admin Admin_AspNetUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Admin Admin_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Admin Admin_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Business Business_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Business Business_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Business Business_RegionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: Concierge Concierge_RegionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: AdminRegion FK_AdminRegion_AdminId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");


--
-- Name: AdminRegion FK_AdminRegion_RegionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: HealthProfessionals HealthProfessionals_Profession_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_Profession_fkey" FOREIGN KEY ("Profession") REFERENCES public."HealthProfessionalType"("HealthProfessionalId");


--
-- Name: PhysicianNotification PhysicianNotification_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: PhysicianRegion PhysicianRegion_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: PhysicianRegion PhysicianRegion_RegionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: Physician Physician_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Physician Physician_Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_Id_fkey" FOREIGN KEY ("Id") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Physician Physician_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: RequestBusiness RequestBusiness_BusinessId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_BusinessId_fkey" FOREIGN KEY ("BusinessId") REFERENCES public."Business"("BusinessId");


--
-- Name: RequestBusiness RequestBusiness_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestClient RequestClient_RegionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: RequestClient RequestClient_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestClosed RequestClosed_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestClosed RequestClosed_RequestStatusLogId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestStatusLogId_fkey" FOREIGN KEY ("RequestStatusLogId") REFERENCES public."RequestStatusLog"("RequestStatusLogId");


--
-- Name: RequestConcierge RequestConcierge_ConciergeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_ConciergeId_fkey" FOREIGN KEY ("ConciergeId") REFERENCES public."Concierge"("ConciergeId");


--
-- Name: RequestConcierge RequestConcierge_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestNotes RequestNotes_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: RequestNotes RequestNotes_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: RequestNotes RequestNotes_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestStatusLog RequestStatusLog_AdminId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");


--
-- Name: RequestStatusLog RequestStatusLog_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: RequestStatusLog RequestStatusLog_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: RequestStatusLog RequestStatusLog_TransToPhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey" FOREIGN KEY ("TransToPhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: RequestWiseFile RequestWiseFile_AdminId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");


--
-- Name: RequestWiseFile RequestWiseFile_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: RequestWiseFile RequestWiseFile_RequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");


--
-- Name: Request Request_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: Request Request_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"("UserId");


--
-- Name: RoleMenu RoleMenu_MenuId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_MenuId_fkey" FOREIGN KEY ("MenuId") REFERENCES public."Menu"("MenuId");


--
-- Name: RoleMenu RoleMenu_RoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId");


--
-- Name: ShiftDetailRegion ShiftDetailRegion_RegionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");


--
-- Name: ShiftDetailRegion ShiftDetailRegion_ShiftDetailId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey" FOREIGN KEY ("ShiftDetailId") REFERENCES public."ShiftDetail"("ShiftDetailId");


--
-- Name: ShiftDetail ShiftDetail_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: ShiftDetail ShiftDetail_ShiftId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ShiftId_fkey" FOREIGN KEY ("ShiftId") REFERENCES public."Shift"("ShiftId");


--
-- Name: Shift Shift_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: Shift Shift_PhysicianId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");


--
-- Name: User User_CreatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("Id");


--
-- Name: User User_Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_Id_fkey" FOREIGN KEY ("Id") REFERENCES public."AspNetUsers"("Id");


--
-- Name: User User_ModifiedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("Id");


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         