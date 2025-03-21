USE [master]
GO
/****** Object:  Database [KodlamaDünyasıDB]    Script Date: 16.03.2025 18:47:43 ******/
CREATE DATABASE [KodlamaDünyasıDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KodlamaDünyasıDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\KodlamaDünyasıDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KodlamaDünyasıDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\KodlamaDünyasıDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KodlamaDünyasıDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KodlamaDünyasıDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET  MULTI_USER 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KodlamaDünyasıDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KodlamaDünyasıDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KodlamaDünyasıDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [KodlamaDünyasıDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KodlamaDünyasıDB]
GO
/****** Object:  Table [dbo].[İçerikler]    Script Date: 16.03.2025 18:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İçerikler](
	[IcerikID] [int] NOT NULL,
	[Baslik] [varchar](100) NOT NULL,
	[Açıklama] [text] NULL,
	[Fiyat] [decimal](10, 2) NOT NULL,
	[KategoriID] [int] NOT NULL,
	[EkleyenKullaniciID] [int] NOT NULL,
	[YayınlanmaTarihi] [date] NULL,
 CONSTRAINT [PK_İçerikler] PRIMARY KEY CLUSTERED 
(
	[IcerikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 16.03.2025 18:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] NOT NULL,
	[KategoriAdi] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcılar]    Script Date: 16.03.2025 18:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcılar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefon] [varchar](15) NULL,
	[Rol] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Kullanıcılar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparişDetayları]    Script Date: 16.03.2025 18:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparişDetayları](
	[SiparisDetayID] [int] NOT NULL,
	[SiparisID] [int] NOT NULL,
	[IcerikID] [int] NOT NULL,
	[Miktar] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparişler]    Script Date: 16.03.2025 18:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparişler](
	[SiparisID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[SiparisTarihi] [date] NOT NULL,
	[ToplamTutar] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Siparişler] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[İçerikler] ([IcerikID], [Baslik], [Açıklama], [Fiyat], [KategoriID], [EkleyenKullaniciID], [YayınlanmaTarihi]) VALUES (1, N'Python''a Giriş', N'Python Temelleri', CAST(4999.00 AS Decimal(10, 2)), 1, 3, CAST(N'2025-03-16' AS Date))
INSERT [dbo].[İçerikler] ([IcerikID], [Baslik], [Açıklama], [Fiyat], [KategoriID], [EkleyenKullaniciID], [YayınlanmaTarihi]) VALUES (2, N'React ile Web', N'Modern web uygulamaları geliştirme', CAST(7999.00 AS Decimal(10, 2)), 2, 3, CAST(N'2025-03-10' AS Date))
INSERT [dbo].[İçerikler] ([IcerikID], [Baslik], [Açıklama], [Fiyat], [KategoriID], [EkleyenKullaniciID], [YayınlanmaTarihi]) VALUES (3, N'Makine Öğrenmesi', N'ML algoritmalarına giriş', CAST(9999.00 AS Decimal(10, 2)), 5, 5, CAST(N'2025-03-14' AS Date))
INSERT [dbo].[İçerikler] ([IcerikID], [Baslik], [Açıklama], [Fiyat], [KategoriID], [EkleyenKullaniciID], [YayınlanmaTarihi]) VALUES (4, N'Veri Analizi', N'Pandas ve NumPY ile veri analizi', CAST(5999.00 AS Decimal(10, 2)), 3, 5, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[İçerikler] ([IcerikID], [Baslik], [Açıklama], [Fiyat], [KategoriID], [EkleyenKullaniciID], [YayınlanmaTarihi]) VALUES (5, N'Flutter ile Mobil Uyg.', N'Mobil uygulamalar geliştirme rehberi', CAST(8999.00 AS Decimal(10, 2)), 4, 5, CAST(N'2025-03-18' AS Date))
GO
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (1, N'Python')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (2, N'Web Geliştirme')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (3, N'Veri Bilimi')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (4, N'Mobil Geliştirme')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (5, N'Yapay Zeka')
GO
SET IDENTITY_INSERT [dbo].[Kullanıcılar] ON 

INSERT [dbo].[Kullanıcılar] ([KullaniciID], [Ad], [Soyad], [Email], [Telefon], [Rol]) VALUES (1, N'Ahmet', N'Yılmaz', N'ahmet.yılmaz@example.com', N'5551234567', N'Müşteri')
INSERT [dbo].[Kullanıcılar] ([KullaniciID], [Ad], [Soyad], [Email], [Telefon], [Rol]) VALUES (2, N'Mehmet', N'Kaya', N'mehmet.kaya@example.com', N'5551238976', N'Admin')
INSERT [dbo].[Kullanıcılar] ([KullaniciID], [Ad], [Soyad], [Email], [Telefon], [Rol]) VALUES (3, N'Ayşe', N'Demir', N'ayse.demir@example.com', N'5553490942', N'Satıcı')
INSERT [dbo].[Kullanıcılar] ([KullaniciID], [Ad], [Soyad], [Email], [Telefon], [Rol]) VALUES (4, N'Fatma', N'Öztürk', N'fatma.ozturk@example.com', N'5557802314', N'Müşteri')
INSERT [dbo].[Kullanıcılar] ([KullaniciID], [Ad], [Soyad], [Email], [Telefon], [Rol]) VALUES (5, N'Ali', N'Çelik', N'ali.celik@example.com', N'5557156109', N'Müşteri')
SET IDENTITY_INSERT [dbo].[Kullanıcılar] OFF
GO
INSERT [dbo].[SiparişDetayları] ([SiparisDetayID], [SiparisID], [IcerikID], [Miktar]) VALUES (1, 1, 2, 1)
INSERT [dbo].[SiparişDetayları] ([SiparisDetayID], [SiparisID], [IcerikID], [Miktar]) VALUES (2, 2, 5, 5)
INSERT [dbo].[SiparişDetayları] ([SiparisDetayID], [SiparisID], [IcerikID], [Miktar]) VALUES (3, 4, 2, 10)
INSERT [dbo].[SiparişDetayları] ([SiparisDetayID], [SiparisID], [IcerikID], [Miktar]) VALUES (4, 3, 3, 8)
INSERT [dbo].[SiparişDetayları] ([SiparisDetayID], [SiparisID], [IcerikID], [Miktar]) VALUES (5, 5, 1, 4)
GO
INSERT [dbo].[Siparişler] ([SiparisID], [KullaniciID], [SiparisTarihi], [ToplamTutar]) VALUES (1, 1, CAST(N'2025-03-16' AS Date), CAST(4999.00 AS Decimal(10, 2)))
INSERT [dbo].[Siparişler] ([SiparisID], [KullaniciID], [SiparisTarihi], [ToplamTutar]) VALUES (2, 4, CAST(N'2025-03-15' AS Date), CAST(7999.00 AS Decimal(10, 2)))
INSERT [dbo].[Siparişler] ([SiparisID], [KullaniciID], [SiparisTarihi], [ToplamTutar]) VALUES (3, 1, CAST(N'2025-03-14' AS Date), CAST(9999.00 AS Decimal(10, 2)))
INSERT [dbo].[Siparişler] ([SiparisID], [KullaniciID], [SiparisTarihi], [ToplamTutar]) VALUES (4, 2, CAST(N'2025-03-12' AS Date), CAST(5999.00 AS Decimal(10, 2)))
INSERT [dbo].[Siparişler] ([SiparisID], [KullaniciID], [SiparisTarihi], [ToplamTutar]) VALUES (5, 4, CAST(N'2025-03-11' AS Date), CAST(8999.00 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[İçerikler]  WITH CHECK ADD  CONSTRAINT [FK_İçerikler_Kategoriler1] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[İçerikler] CHECK CONSTRAINT [FK_İçerikler_Kategoriler1]
GO
ALTER TABLE [dbo].[İçerikler]  WITH CHECK ADD  CONSTRAINT [FK_İçerikler_Kullanıcılar] FOREIGN KEY([EkleyenKullaniciID])
REFERENCES [dbo].[Kullanıcılar] ([KullaniciID])
GO
ALTER TABLE [dbo].[İçerikler] CHECK CONSTRAINT [FK_İçerikler_Kullanıcılar]
GO
ALTER TABLE [dbo].[SiparişDetayları]  WITH CHECK ADD  CONSTRAINT [FK_SiparişDetayları_İçerikler] FOREIGN KEY([IcerikID])
REFERENCES [dbo].[İçerikler] ([IcerikID])
GO
ALTER TABLE [dbo].[SiparişDetayları] CHECK CONSTRAINT [FK_SiparişDetayları_İçerikler]
GO
ALTER TABLE [dbo].[SiparişDetayları]  WITH CHECK ADD  CONSTRAINT [FK_SiparişDetayları_Siparişler1] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparişler] ([SiparisID])
GO
ALTER TABLE [dbo].[SiparişDetayları] CHECK CONSTRAINT [FK_SiparişDetayları_Siparişler1]
GO
ALTER TABLE [dbo].[Siparişler]  WITH CHECK ADD  CONSTRAINT [FK_Siparişler_Kullanıcılar1] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanıcılar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Siparişler] CHECK CONSTRAINT [FK_Siparişler_Kullanıcılar1]
GO
USE [master]
GO
ALTER DATABASE [KodlamaDünyasıDB] SET  READ_WRITE 
GO
