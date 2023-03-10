create database [Туристическое агентство «Вокруг света за 80 дней»]
 USE [Туристическое агентство «Вокруг света за 80 дней»]
GO
/****** Object:  Schema [customers]    Script Date: 09.01.2023 8:03:50 ******/
CREATE SCHEMA [customers]
GO
/****** Object:  Schema [employees]    Script Date: 09.01.2023 8:03:50 ******/
CREATE SCHEMA [employees]
GO
/****** Object:  Schema [tours]    Script Date: 09.01.2023 8:03:50 ******/
CREATE SCHEMA [tours]
GO
/****** Object:  Table [customers].[Клиенты агенства]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[Клиенты агенства](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[FutureTours] [nvarchar](max) NOT NULL,
	[PastTours] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [employees].[Работники турагентства]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [employees].[Работники турагентства](
	[EmployerId] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfEmployment] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [employees].[Сотрудники привязаныне к странам, турам]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [employees].[Сотрудники привязаныне к странам, турам](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[CountryId] [int] NULL,
	[TourId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Архивные туры]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Архивные туры](
	[TourId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [money] NOT NULL,
	[DateOfStart] [date] NOT NULL,
	[DateOfEnd] [date] NOT NULL,
	[TransportMethods] [nvarchar](max) NOT NULL,
	[PaidCustomers] [nvarchar](max) NOT NULL,
	[MaxCustomersNumber] [int] NOT NULL,
	[PotentialCustomers] [nvarchar](max) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[FIOEmployer] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tours].[Города]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Города](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Гостиницы]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Гостиницы](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[HotelInfo] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tours].[Гостиницы для тура]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Гостиницы для тура](
	[HotelBookId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Достопримечательности]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Достопримечательности](
	[InterestId] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[InterestInfo] [nvarchar](max) NOT NULL,
	[IncludeInTour] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [tours].[Посещеннные города]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Посещеннные города](
	[VistedCityId] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[DateOfVisit] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VistedCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Посещеннные страны]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Посещеннные страны](
	[VistedCountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[DateOfVisit] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VistedCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Страны]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Страны](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tours].[Туры]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tours].[Туры](
	[TourId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [money] NOT NULL,
	[DateOfStart] [date] NOT NULL,
	[DateOfEnd] [date] NOT NULL,
	[TransportMethods] [nvarchar](max) NOT NULL,
	[PaidCustomers] [nvarchar](max) NOT NULL,
	[MaxCustomersNumber] [int] NOT NULL,
	[PotentialCustomers] [nvarchar](max) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[FIOEmployer] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [customers].[Клиенты агенства] ON 

INSERT [customers].[Клиенты агенства] ([CustomerId], [FIO], [Phone], [Email], [DateOfBirth], [FutureTours], [PastTours]) VALUES (1, N'Романов Григорий Евгеньевич
', N'72685017622', N'ranasta@msn.com
', CAST(N'1990-05-07' AS Date), N'1', N'2,3')
INSERT [customers].[Клиенты агенства] ([CustomerId], [FIO], [Phone], [Email], [DateOfBirth], [FutureTours], [PastTours]) VALUES (2, N'Москвин Кирилл Елисеевич
', N'71259981971', N'lamprecht@att.net
', CAST(N'2000-12-13' AS Date), N'2', N'1')
INSERT [customers].[Клиенты агенства] ([CustomerId], [FIO], [Phone], [Email], [DateOfBirth], [FutureTours], [PastTours]) VALUES (3, N'Смирнова Полина Дмитриевна
', N'75336105499', N'scotfl@me.com
', CAST(N'1975-05-14' AS Date), N'1', N'1,2,3')
INSERT [customers].[Клиенты агенства] ([CustomerId], [FIO], [Phone], [Email], [DateOfBirth], [FutureTours], [PastTours]) VALUES (5, N'Миронова Виктория Павловна
', N'79588866645', N'meinkej@yahoo.com
', CAST(N'1990-08-09' AS Date), N'1,2,3', N'3')
SET IDENTITY_INSERT [customers].[Клиенты агенства] OFF
GO
SET IDENTITY_INSERT [employees].[Работники турагентства] ON 

INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (1, N'Попова Виктория Николаевна
', N'Агент по отелям', N'7847385607', N'rsmartin@yahoo.ca
', CAST(N'2000-01-05' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (2, N'Павлов Илья Николаевич
', N'Консультант', N'76024271267', N'dialworld@me.com
', CAST(N'2018-02-07' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (4, N'Кондрашова Екатерина Богдановна
', N'Экскурсовод', N'72614081882', N'isotopian@sbcglobal.net
', CAST(N'2015-07-28' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (6, N'Воронин Иван Михайлович
', N'Начальник отдела', N'75588825549', N'rhialto@optonline.net
', CAST(N'2010-12-25' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (8, N'Демьянова Анна Артёмовна
', N'Агент по безопасности туристов', N'76624472829', N'petersko@optonline.net
', CAST(N'2005-10-18' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (9, N'Бирюков Кирилл Михайлович
', N'Главный бухгалтер', N'76591504231', N'aglassis@mac.com
', CAST(N'2007-09-05' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (10, N'Федоров Роман Иванович
', N'Юрист', N'79725734677', N'credmond@yahoo.com
', CAST(N'2012-05-05' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (11, N'Москвина Ольга Николаевна
', N'Специалист по рекламе', N'76719159998', N'evans@msn.com
', CAST(N'2022-07-08' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (12, N'Самойлов Михаил Алексеевич
', N'Директор', N'71192627413', N'yzheng@sbcglobal.net
', CAST(N'1999-01-01' AS Date))
INSERT [employees].[Работники турагентства] ([EmployerId], [FIO], [Position], [Phone], [Email], [DateOfEmployment]) VALUES (13, N'Головина Сафия Савельевна', N'Старший менеджер', N'75205648756', N'plover@sbcglobal.net
', CAST(N'2007-11-04' AS Date))
SET IDENTITY_INSERT [employees].[Работники турагентства] OFF
GO
SET IDENTITY_INSERT [employees].[Сотрудники привязаныне к странам, турам] ON 

INSERT [employees].[Сотрудники привязаныне к странам, турам] ([Id], [EmployerId], [CountryId], [TourId]) VALUES (1, 1, 3, 2)
INSERT [employees].[Сотрудники привязаныне к странам, турам] ([Id], [EmployerId], [CountryId], [TourId]) VALUES (2, 2, 4, 3)
INSERT [employees].[Сотрудники привязаныне к странам, турам] ([Id], [EmployerId], [CountryId], [TourId]) VALUES (3, 6, 1, 1)
SET IDENTITY_INSERT [employees].[Сотрудники привязаныне к странам, турам] OFF
GO
SET IDENTITY_INSERT [tours].[Архивные туры] ON 

INSERT [tours].[Архивные туры] ([TourId], [Name], [Price], [DateOfStart], [DateOfEnd], [TransportMethods], [PaidCustomers], [MaxCustomersNumber], [PotentialCustomers], [EmployerId], [FIOEmployer]) VALUES (1, N'Туризм в Нью Дели Старый', 50000.0000, CAST(N'2022-02-01' AS Date), CAST(N'2022-03-01' AS Date), N'Самолет, Баги', N'5', 20, N'3', 2, N'Павлов Илья Николаевич
')
SET IDENTITY_INSERT [tours].[Архивные туры] OFF
GO
SET IDENTITY_INSERT [tours].[Города] ON 

INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (1, 1, N'Каир')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (2, 2, N'Пекин')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (3, 3, N'Лондон')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (4, 4, N'Нью Дели')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (5, 5, N'Лас Вегас')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (6, 6, N'Токио')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (7, 2, N'Шанхай')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (8, 7, N'Аделаида')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (9, 8, N'Стамбул')
INSERT [tours].[Города] ([CityId], [CountryId], [Name]) VALUES (10, 9, N'Парнас')
SET IDENTITY_INSERT [tours].[Города] OFF
GO
SET IDENTITY_INSERT [tours].[Гостиницы] ON 

INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (1, N'Каирская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (2, N'Пекинская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (3, N'Лондонская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (4, N'Гостиница нью дели')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (5, N'Гостиница лас вегас')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (6, N'Токийская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (7, N'Пекинская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (8, N'Аделаидаская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (9, N'Стамбульская гостиница')
INSERT [tours].[Гостиницы] ([HotelId], [HotelInfo]) VALUES (10, N'Панаская гостиница')
SET IDENTITY_INSERT [tours].[Гостиницы] OFF
GO
SET IDENTITY_INSERT [tours].[Гостиницы для тура] ON 

INSERT [tours].[Гостиницы для тура] ([HotelBookId], [HotelId], [TourId]) VALUES (1, 1, 1)
INSERT [tours].[Гостиницы для тура] ([HotelBookId], [HotelId], [TourId]) VALUES (2, 3, 2)
INSERT [tours].[Гостиницы для тура] ([HotelBookId], [HotelId], [TourId]) VALUES (3, 4, 3)
SET IDENTITY_INSERT [tours].[Гостиницы для тура] OFF
GO
SET IDENTITY_INSERT [tours].[Достопримечательности] ON 

INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (1, 1, 1, N'Каирский египетский музей', 1)
INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (2, 1, 1, N'Мечеть Ибн Тулуна', 0)
INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (3, 2, 3, N'Туэрский мост', 0)
INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (4, 2, 3, N'Букингемский дворец', 1)
INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (5, 3, 4, N'Храм Лотоса', 1)
INSERT [tours].[Достопримечательности] ([InterestId], [TourId], [CityId], [InterestInfo], [IncludeInTour]) VALUES (6, 3, 4, N'Ворота Индии', 1)
SET IDENTITY_INSERT [tours].[Достопримечательности] OFF
GO
SET IDENTITY_INSERT [tours].[Посещеннные города] ON 

INSERT [tours].[Посещеннные города] ([VistedCityId], [CityId], [TourId], [DateOfVisit]) VALUES (1, 1, 1, CAST(N'2023-01-10' AS Date))
INSERT [tours].[Посещеннные города] ([VistedCityId], [CityId], [TourId], [DateOfVisit]) VALUES (2, 3, 2, CAST(N'2023-02-01' AS Date))
INSERT [tours].[Посещеннные города] ([VistedCityId], [CityId], [TourId], [DateOfVisit]) VALUES (3, 4, 3, CAST(N'2023-02-01' AS Date))
SET IDENTITY_INSERT [tours].[Посещеннные города] OFF
GO
SET IDENTITY_INSERT [tours].[Посещеннные страны] ON 

INSERT [tours].[Посещеннные страны] ([VistedCountryId], [CountryId], [TourId], [DateOfVisit]) VALUES (1, 1, 1, CAST(N'2023-01-10' AS Date))
INSERT [tours].[Посещеннные страны] ([VistedCountryId], [CountryId], [TourId], [DateOfVisit]) VALUES (2, 3, 2, CAST(N'2023-02-01' AS Date))
INSERT [tours].[Посещеннные страны] ([VistedCountryId], [CountryId], [TourId], [DateOfVisit]) VALUES (3, 4, 3, CAST(N'2023-02-01' AS Date))
SET IDENTITY_INSERT [tours].[Посещеннные страны] OFF
GO
SET IDENTITY_INSERT [tours].[Страны] ON 

INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (7, N'Австралия')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (3, N'ВБР')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (9, N'Греция')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (1, N'Египет')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (4, N'Индия')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (2, N'Китай')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (5, N'США')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (8, N'Турция')
INSERT [tours].[Страны] ([CountryId], [Name]) VALUES (6, N'Япония')
SET IDENTITY_INSERT [tours].[Страны] OFF
GO
SET IDENTITY_INSERT [tours].[Туры] ON 

INSERT [tours].[Туры] ([TourId], [Name], [Price], [DateOfStart], [DateOfEnd], [TransportMethods], [PaidCustomers], [MaxCustomersNumber], [PotentialCustomers], [EmployerId], [FIOEmployer]) VALUES (1, N'Отдых в Каире ', 150000.0000, CAST(N'2023-01-10' AS Date), CAST(N'2023-01-15' AS Date), N'Самолет,Автобус', N'1,3', 5, N'5', 6, N'Воронин Иван Михайлович
')
INSERT [tours].[Туры] ([TourId], [Name], [Price], [DateOfStart], [DateOfEnd], [TransportMethods], [PaidCustomers], [MaxCustomersNumber], [PotentialCustomers], [EmployerId], [FIOEmployer]) VALUES (2, N'Учеба в Лондоне', 1000000.0000, CAST(N'2023-02-01' AS Date), CAST(N'2023-05-01' AS Date), N'Самолет', N'2', 2, N'5', 1, N'Попова Виктория Николаевна
')
INSERT [tours].[Туры] ([TourId], [Name], [Price], [DateOfStart], [DateOfEnd], [TransportMethods], [PaidCustomers], [MaxCustomersNumber], [PotentialCustomers], [EmployerId], [FIOEmployer]) VALUES (3, N'Туризм в Нью Дели', 50000.0000, CAST(N'2023-02-01' AS Date), CAST(N'2023-03-01' AS Date), N'Самолет,Баги', N'5', 20, N'3', 2, N'Павлов Илья Николаевич
')
SET IDENTITY_INSERT [tours].[Туры] OFF
GO
ALTER TABLE [employees].[Сотрудники привязаныне к странам, турам]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [tours].[Страны] ([CountryId])
GO
ALTER TABLE [employees].[Сотрудники привязаныне к странам, турам]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [employees].[Работники турагентства] ([EmployerId])
GO
ALTER TABLE [employees].[Сотрудники привязаныне к странам, турам]  WITH CHECK ADD FOREIGN KEY([TourId])
REFERENCES [tours].[Туры] ([TourId])
GO
ALTER TABLE [tours].[Архивные туры]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [employees].[Работники турагентства] ([EmployerId])
GO
ALTER TABLE [tours].[Гостиницы для тура]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [tours].[Гостиницы] ([HotelId])
GO
ALTER TABLE [tours].[Гостиницы для тура]  WITH CHECK ADD FOREIGN KEY([TourId])
REFERENCES [tours].[Туры] ([TourId])
GO
ALTER TABLE [tours].[Достопримечательности]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [tours].[Города] ([CityId])
GO
ALTER TABLE [tours].[Достопримечательности]  WITH CHECK ADD FOREIGN KEY([TourId])
REFERENCES [tours].[Туры] ([TourId])
GO
ALTER TABLE [tours].[Посещеннные города]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [tours].[Города] ([CityId])
GO
ALTER TABLE [tours].[Посещеннные города]  WITH CHECK ADD FOREIGN KEY([TourId])
REFERENCES [tours].[Туры] ([TourId])
GO
ALTER TABLE [tours].[Посещеннные страны]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [tours].[Страны] ([CountryId])
GO
ALTER TABLE [tours].[Посещеннные страны]  WITH CHECK ADD FOREIGN KEY([TourId])
REFERENCES [tours].[Туры] ([TourId])
GO
ALTER TABLE [tours].[Туры]  WITH CHECK ADD FOREIGN KEY([EmployerId])
REFERENCES [employees].[Работники турагентства] ([EmployerId])
GO
/****** Object:  StoredProcedure [dbo].[actual_tours]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actual_tours]
as
SELECT *
FROM [tours].[Туры]
where DateOfStart>GETDATE()
GO
/****** Object:  StoredProcedure [dbo].[diap_start_date]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[diap_start_date]
@date1 date,
@date2 date
as
select *
from tours.[Туры]
where DateOfStart>@date1 and DateOfStart<@date2
GO
/****** Object:  StoredProcedure [dbo].[in_tour]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[in_tour]
@FIO nvarchar(100)
as
BEGIN
IF EXISTS(select *
from customers.[Клиенты агенства] c, tours.[Туры] t
where FIO=@FIO and c.CustomerId in (select value from string_split(t.PaidCustomers,',')) and GETDATE()>=t.DateOfStart)  
BEGIN  
SELECT CAST(1 AS BIT) AS 'В туре'  
END  
ELSE  
BEGIN  
SELECT CAST(0 AS BIT) AS 'В туре'  
END  
END  
GO
/****** Object:  StoredProcedure [dbo].[popular_arc_tour]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[popular_arc_tour]
as
select top 1 *
from tours.[Архивные туры] 
order by (select count(value) from string_split(PaidCustomers,',')) desc
GO
/****** Object:  StoredProcedure [dbo].[popular_country]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[popular_country]
as
select top 1 c.[Name]
from tours.[Посещеннные страны] vc, tours.[Страны] c, tours.[Туры] t
where c.CountryId=vc.CountryId and vc.TourId=t.TourID
group by c.[Name]
order by count(*) desc
GO
/****** Object:  StoredProcedure [dbo].[popular_tour]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[popular_tour]
as
select top 1 *
from tours.[Туры] 
order by (select count(value) from string_split(PaidCustomers,',')) desc
GO
/****** Object:  StoredProcedure [dbo].[popular_tourist]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[popular_tourist]
as
select top 1 c.*
from customers.[Клиенты агенства] c, tours.[Туры] t
where c.CustomerId in (select value from string_split(t.PaidCustomers,','))
order by (select count(value) from string_split(t.PaidCustomers,',')) desc
GO
/****** Object:  StoredProcedure [dbo].[show_list]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[show_list]
@FIO nvarchar(100)
as
select FutureTours+','+PastTours as N'Список туров'
from customers.[Клиенты агенства]
where FIO=@FIO
GO
/****** Object:  StoredProcedure [dbo].[transport_method]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--exec where_is_tourist @FIO=N'Романов Григорий Евгеньевич
--'
create procedure [dbo].[transport_method]
@transpM nvarchar(50)
as
select *
from tours.[Туры] 
where @transpM in (select value from string_split(TransportMethods,','))
GO
/****** Object:  StoredProcedure [dbo].[unpopular_tour]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[unpopular_tour]
as
select top 1 *
from tours.[Туры] 
order by (select count(value) from string_split(PaidCustomers,',')) 
GO
/****** Object:  StoredProcedure [dbo].[visit_country]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[visit_country]
@country nvarchar(50)
as
select *
from tours.[Туры] t, tours.[Посещеннные страны] vc, tours.[Страны] c
where c.[Name]=@country and vc.CountryId=c.CountryId and vc.TourId=t.TourId
GO
/****** Object:  StoredProcedure [dbo].[where_is_tourist]    Script Date: 09.01.2023 8:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[where_is_tourist]
@FIO nvarchar(100)
as
BEGIN
IF EXISTS(select *
from customers.[Клиенты агенства] c, tours.[Туры] t
where FIO=@FIO and c.CustomerId in (select value from string_split(t.PaidCustomers,',')) and t.DateOfStart<GETDATE())  
BEGIN  
select g.[Name] AS 'Где турист'  
from customers.[Клиенты агенства] c, tours.[Туры] t, tours.[Посещеннные города] vc, tours.[Города] g
where FIO=@FIO and c.CustomerId in (select value from string_split(t.PaidCustomers,',')) and t.TourId=vc.TourId and vc.CityID=g.CityId
END  
ELSE  
BEGIN  
raiserror(N'Ошибка: Турист не в туре!',0,1)
END  
END  
GO
