USE [master]
GO
/****** Object:  Database [WebBanDienThoai]    Script Date: 19/11/2022 9:45:40 CH ******/
CREATE DATABASE [WebBanDienThoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanDienThoai', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\WebBanDienThoai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebBanDienThoai_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\WebBanDienThoai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebBanDienThoai] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebBanDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebBanDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanDienThoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebBanDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebBanDienThoai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebBanDienThoai', N'ON'
GO
ALTER DATABASE [WebBanDienThoai] SET QUERY_STORE = OFF
GO
USE [WebBanDienThoai]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[HoTenAdmin] [nvarchar](50) NULL,
	[DiaChiAdmin] [nvarchar](50) NULL,
	[DienThoaiAdmin] [varchar](10) NULL,
	[TenDNAdmin] [varchar](15) NULL,
	[MatKhauAdmin] [varchar](15) NULL,
	[NgaySinhAdmin] [smalldatetime] NULL,
	[GioiTinhAdmin] [bit] NULL,
	[EmailAdmin] [varchar](50) NULL,
	[QuyenAdmin] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOHANH]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOHANH](
	[MaBH] [int] IDENTITY(1,1) NOT NULL,
	[DiaChiBH] [nvarchar](100) NULL,
	[LinkDiaChi] [ntext] NULL,
	[DienThoaiBH] [nchar](8) NULL,
	[ThoiGianBH] [nvarchar](50) NULL,
 CONSTRAINT [PK_BAOHANH] PRIMARY KEY CLUSTERED 
(
	[MaBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDATHANG]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDATHANG](
	[SoDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[ThanhTien]  AS ([SoLuong]*[DonGia]),
 CONSTRAINT [PK_CTDATHANG_1] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [smalldatetime] NULL,
	[TriGia] [money] NULL,
	[DaGiao] [bit] NULL,
	[NgayGiaoHang] [smalldatetime] NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[DiaChiNhan] [nvarchar](50) NULL,
	[DienThoaiNhan] [varchar](15) NULL,
	[HTThanhToan] [bit] NULL,
	[HTGiaoHang] [bit] NULL,
 CONSTRAINT [PK_DONDATHANG_1] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](50) NULL,
	[DienThoaiKH] [varchar](10) NULL,
	[TenDN] [varchar](15) NULL,
	[MatKhau] [varchar](15) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[Email] [varchar](50) NULL,
	[DaDuyet] [bit] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANLOAISP]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANLOAISP](
	[MaLSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_PHANLOAISP] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[DonGia] [money] NULL,
	[ManHinh] [nvarchar](100) NULL,
	[HeDieuHanh] [nvarchar](50) NULL,
	[CameraSau] [nvarchar](50) NULL,
	[CameraTruoc] [nvarchar](50) NULL,
	[CPU] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[BoNhoTrong] [nvarchar](50) NULL,
	[DungLuongPin] [nvarchar](50) NULL,
	[Sac] [nvarchar](50) NULL,
	[HinhMinhHoa] [varchar](50) NULL,
	[ThongTinSanPham] [ntext] NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[SoLuongBan] [int] NULL,
	[MaTH] [int] NULL,
	[MaLSP] [int] NULL,
	[MaTT] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUONGHIEU]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUONGHIEU](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](50) NOT NULL,
	[HinhMinhHoa] [nvarchar](50) NULL,
 CONSTRAINT [PK_THUONGHIEU] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TINHTRANG]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINHTRANG](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[TenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TINHTRANG] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 19/11/2022 9:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MaTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[HinhMinhHoa] [nvarchar](50) NULL,
	[MoTaTinTuc] [ntext] NULL,
	[TenNhaBao] [nvarchar](50) NULL,
	[ThoiGianBao] [nvarchar](50) NULL,
	[LinkTinTuc] [nvarchar](500) NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin], [QuyenAdmin]) VALUES (1, N'Võ Quốc Lương', N'Phú Hòa', N'0988936592', N'luongvq', N'12345', CAST(N'1962-07-08T00:00:00' AS SmallDateTime), 1, N'luongvq@tdmu.edu.vn', 1)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin], [QuyenAdmin]) VALUES (2, N'Võ Nguyễn Nhật Minh', N'Phú Hòa', N'012344444', N'minhvnn', N'12345', CAST(N'1962-07-08T00:00:00' AS SmallDateTime), 1, N'minhvnn@tdmu.edu.vn', 2)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin], [QuyenAdmin]) VALUES (3, N'Võ Nguyễn Thái Hoàng', N'Phú Hòa', N'0912685449', N'hoangvnt', N'12345', CAST(N'1962-07-08T00:00:00' AS SmallDateTime), 1, N'hoangvnt@tdmu.edu.vn', 2)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin], [QuyenAdmin]) VALUES (4, N'Nguyễn Thị Tuyết Trinh', N'Trong tim Tuấn', N'0912685449', N'tuyettrinh', N'12345', CAST(N'2002-04-03T00:00:00' AS SmallDateTime), 0, N'tuyettrinh@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[BAOHANH] ON 

INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (1, N'322 Đại lộ Bình Dương, Khu Phố 1, Thủ Dầu Một, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/Th%E1%BA%BF+Gi%E1%BB%9Bi+Di+%C4%90%E1%BB%99ng/@10.9800981,106.6659767,16.33z/data=!4m9!1m2!2m1!1zdGjhur8gZ2nhu5tpIMSR4buZbmcgYsOsbmggZMawxqFuZw!3m5!1s0x3174d1248866dcc9:0x31adaf837f3a24bc!8m2!3d10.9809175!4d106.6673462!15sCiJ0aOG6vyBnaeG7m2kgxJHhu5luZyBiw6xuaCBkxrDGoW5nIgOIAQFaJCIidGjhur8gZ2nhu5tpIMSR4buZbmcgYsOsbmggZMawxqFuZ5IBEGNlbGxfcGhvbmVfc3RvcmXgAQA?hl=vi', N'18006600', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (2, N'Phú Thọ, Thủ Dầu Một, Bình Dương 75000, Việt Nam', N'https://www.google.com/maps/place/Si%C3%AAu+th%E1%BB%8B+Th%E1%BA%BF+Gi%E1%BB%9Bi+Di+%C4%90%E1%BB%99ng/@10.9662157,106.6701063,15.61z/data=!4m9!1m2!2m1!1zdGjhur8gZ2nhu5tpIMSR4buZbmcgYsOsbmggZMawxqFuZw!3m5!1s0x3174d1eee85511bf:0x354e2cb8b5aca79a!8m2!3d10.9661391!4d106.6831261!15sCiJ0aOG6vyBnaeG7m2kgxJHhu5luZyBiw6xuaCBkxrDGoW5nIgOIAQFaJCIidGjhur8gZ2nhu5tpIMSR4buZbmcgYsOsbmggZMawxqFuZ5IBEGNlbGxfcGhvbmVfc3RvcmXgAQA?hl=vi', N'18001060', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (3, N'20 Đại lộ Bình Dương, Phú Thọ, Thủ Dầu Một, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.9726403,106.6690129,17z/data=!3m1!4b1!4m5!3m4!1s0x3174d19c98bcbbaf:0xa1a1311b8ec875bf!8m2!3d10.9726403!4d106.6712016?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (4, N'467 Đ. Cách Mạng Tháng 8, Phú Cường, Thủ Dầu Một, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.9797604,106.6527309,17z/data=!3m1!4b1!4m5!3m4!1s0x3174d1dad9898b4b:0x4306cdda5c265bea!8m2!3d10.9797533!4d106.6549109?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (5, N'171 Đ. Thủ Khoa Huân, Thuận Giao, Thuận An, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.959761,106.6812498,14.56z/data=!4m9!1m2!2m1!1sFPT+Shop!3m5!1s0x317527bde1531c9d:0x280790f9d3082943!8m2!3d10.9559577!4d106.7021221!15sCghGUFQgU2hvcCIDiAEBWgoiCGZwdCBzaG9wkgEQY2VsbF9waG9uZV9zdG9yZZoBJENoZERTVWhOTUc5blMwVkpRMEZuU1VObExVcE1aM1JSUlJBQuABAA?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (6, N'63D Nguyễn Văn Tiết, Lái Thiêu, Thuận An, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.9322064,106.6988774,14.83z/data=!4m9!1m2!2m1!1sFPT+Shop!3m5!1s0x3174d77814ac2395:0xc63fcf0db2fcc6da!8m2!3d10.9203712!4d106.7131313!15sCghGUFQgU2hvcCIDiAEBWgoiCGZwdCBzaG9wkgEQY2VsbF9waG9uZV9zdG9yZZoBJENoZERTVWhOTUc5blMwVkpRMEZuU1VSeE4wcHFOM04zUlJBQuABAA?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (7, N'Số 1/47B đường 22/12 KP Hòa Lân 2 Phường Thuận Giao TP, Thuận An, Bình Dương, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.936872,106.692578,13.75z/data=!4m9!1m2!2m1!1sFPT+Shop!3m5!1s0x3174d92da14b3ff9:0x6fd8cf731efdce9c!8m2!3d10.9483863!4d106.7218888!15sCghGUFQgU2hvcCIDiAEBWgoiCGZwdCBzaG9wkgEQY2VsbF9waG9uZV9zdG9yZeABAA?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (8, N'439A Đ. Phú Lợi, Phú Lợi, Thủ Dầu Một, Bình Dương 820010, Việt Nam', N'https://www.google.com/maps/place/FPT+Shop/@10.9866621,106.6481702,14.11z/data=!4m9!1m2!2m1!1sFPT+Shop!3m5!1s0x3174d0dd847bc2f3:0xdd4ec887473987b9!8m2!3d10.9862178!4d106.6844009!15sCghGUFQgU2hvcCIDiAEBWgoiCGZwdCBzaG9wkgEQY2VsbF9waG9uZV9zdG9yZZoBI0NoWkRTVWhOTUc5blMwVkpRMEZuU1VNdExYRjZPRlZCRUFF4AEA?hl=vi', N'18006601', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (9, N'183 - 185 Đ. Phú Lợi, Phú Lợi, Thủ Dầu Một, Bình Dương 820000, Việt Nam', N'https://www.google.com/maps/place/C%E1%BB%ADa+h%C3%A0ng+%C4%91i%E1%BB%87n+tho%E1%BA%A1i+CellphoneS+%7C+183+-+185+Ph%C3%BA+L%E1%BB%A3i/@10.9825069,106.6688976,17z/data=!4m9!1m2!2m1!1sCellphoneS!3m5!1s0x3174d139bee179f9:0x291c180797b3c0f0!8m2!3d10.9825069!4d106.673275!15sCgpDZWxscGhvbmVTIgOIAQFaDCIKY2VsbHBob25lc5IBEGNlbGxfcGhvbmVfc3RvcmXgAQA?hl=vi', N'18006602', N'8h00 - 17h00')
INSERT [dbo].[BAOHANH] ([MaBH], [DiaChiBH], [LinkDiaChi], [DienThoaiBH], [ThoiGianBH]) VALUES (10, N'427 Đại lộ Bình Dương, Phú Cường, Bình Dương, 820000, Việt Nam', N'https://www.google.com/maps/place/cellphone+S/@10.9831458,106.6597203,15.92z/data=!4m9!1m2!2m1!1sCellphoneS!3m5!1s0x3174d1c6cdb2e847:0xb9f2e9987fb4c6c!8m2!3d10.9796441!4d106.6672872!15sCgpDZWxscGhvbmVTIgOIAQFaDCIKY2VsbHBob25lc5IBDmNvbXB1dGVyX3N0b3Jl4AEA?hl=vi', N'18006602', N'8h00 - 17h00')
SET IDENTITY_INSERT [dbo].[BAOHANH] OFF
GO
INSERT [dbo].[CTDATHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 10, 1, 30990000.0000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 79, 1, 39000000.0000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2, 10, 1, 30990000.0000)
INSERT [dbo].[CTDATHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2, 11, 1, 33990000.0000)
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [TriGia], [DaGiao], [NgayGiaoHang], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [HTThanhToan], [HTGiaoHang]) VALUES (1, 3, CAST(N'2022-11-18T19:06:00' AS SmallDateTime), 69990000.0000, 0, CAST(N'2022-11-19T00:00:00' AS SmallDateTime), N'Nguy?n Th? Tuy?t Trinh', N'Trong tim Tuấn', N'0912685449', 0, 0)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [TriGia], [DaGiao], [NgayGiaoHang], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [HTThanhToan], [HTGiaoHang]) VALUES (2, 3, CAST(N'2022-11-19T13:45:00' AS SmallDateTime), 64980000.0000, 0, CAST(N'2022-11-29T00:00:00' AS SmallDateTime), N'Nguyễn Thị Tuyết Trinh', N'Trong tim Tuấn', N'0912685449', 0, 0)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [DaDuyet]) VALUES (1, N'Võ Quốc Lương', N'Phú Hòa', N'0912685449', N'luongvq', N'12345', CAST(N'1962-07-08T00:00:00' AS SmallDateTime), 1, N'luongvq@tdmu.edu.vn', 0)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [DaDuyet]) VALUES (3, N'Nguyễn Thị Tuyết Trinh', N'Trong tim Tuấn', N'0912685449', N'tuyettrinh', N'12345', CAST(N'2002-04-03T00:00:00' AS SmallDateTime), 0, N'tuyettrinh@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[PHANLOAISP] ON 

INSERT [dbo].[PHANLOAISP] ([MaLSP], [TenLSP]) VALUES (1, N'Sản phẩm mới')
INSERT [dbo].[PHANLOAISP] ([MaLSP], [TenLSP]) VALUES (2, N'Sản phẩm nổi bật')
INSERT [dbo].[PHANLOAISP] ([MaLSP], [TenLSP]) VALUES (3, N'Sản phẩm giá rẻ')
SET IDENTITY_INSERT [dbo].[PHANLOAISP] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (1, N'iPhone 11', N'Chiếc', 11790000.0000, N'IPS LCD6.1"Liquid Retina', N'iOS 15', N'2 camera 12 MP', N'12 MP', N'Chip Apple A13 Bionic', N'4 GB
', N'64 GB

', N'3110 mAh', N'18 W', N'iphone-11.jpg', N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 1, 1, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (2, N'iPhone 12', N'Chiếc', 16490000.0000, N'OLED5.4"Super Retina XDR', N'iOS 15', N'2 camera 12 MP', N'12 MP', N'Chip Apple A14 Bionic', N'4 GB
', N'64 GB
', N'2815 mAh', N'20 W', N'iphone-12-tim.jpg', N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 25, 1, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (3, N'iPhone 12 Mini', N'Chiếc', 15990000.0000, N'OLED5.4"Super Retina XDR', N'iOS 15', N'2 camera 12 MP', N'12 MP', N'Chip Apple A14 Bionic', N'4 GB
', N'256 GB', N'2227 mAh', N'20 W', N'iphone-12_mini.jpeg', N'Apple giới thiệu đến người dùng 4 phiên bản iPhone mới trong sự kiện Hi, Speed! ngày 14/10, trong đó có điện thoại iPhone 12 mini 256 GB, đây là sản phẩm hỗ trợ 5G có thiết kế nhỏ nhất, nhẹ nhất, mỏng nhất trên thế giới cho đến thời điểm hiện tại (10/2020).', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 23, 1, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (4, N'iPhone 13 Mini', N'Chiếc', 17290000.0000, N'OLED5.4"Super Retina XDR', N'iOS 15', N'2 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'128 GB', N'2438 mAh', N'20 W', N'iphone-13-mini.jpg', N'iPhone 13 mini được Apple ra mắt với hàng loạt nâng cấp về cấu hình và các tính năng hữu ích, lại có thiết kế vừa vặn. Chiếc điện thoại này hứa hẹn là một thiết bị hoàn hảo hướng tới những khách hàng thích sự nhỏ gọn nhưng vẫn giữ được sự mạnh mẽ bên trong.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 15, 1, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (5, N'iPhone 13', N'Chiếc', 19690000.0000, N'OLED6.1"Super Retina XDR', N'iOS 15', N'2 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'128 GB', N'3240 mAh', N'20 W', N'iphone-13-pink.jpg', N'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 16, 1, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (6, N'iPhone 13 Pro', N'Chiếc', 25290000.0000, N'
OLED6.1"Super Retina XDR', N'iOS 15', N'3 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'128 GB', N'3095 mAh', N'20 W', N'iphone-13-pro.jpg', N'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 1, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (7, N'iPhone 13 Pro Max', N'Chiếc', 27490000.0000, N'OLED6.7"Super Retina XDR', N'iOS 15', N'3 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'6 GB
', N'128 GB', N'4352 mAh', N'20 W', N'iphone-13-pro-max-sierra-blue-..jpg', N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 1, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (8, N'iPhone 14', N'Chiếc', 27490000.0000, N'OLED6.1"Super Retina XDR', N'iOS 16', N'2 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'256 GB', N'3095 mAh', N'20 W', N'iPhone-14_tim.jpg', N'Sau bao khoảng thời gian dài chờ đợi thì vào ngày 08/09 chiếc điện thoại iPhone 14 cũng đã chính thức được lộ diện, với hàng loạt thông số kỹ thuật ấn tượng từ camera cho đến hiệu năng cực khủng. Từ ngày 14/10/2022 tại và Hệ Thống Cửa Hàng Điện Thoại TKT cũng đã chính thức mở bán tất cả các phiên bản iPhone 14 series để người dùng có thể sớm ngày được trải nghiệm.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 16, 1, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (10, N'iPhone 14 Pro', N'Chiếc', 30990000.0000, N'OLED6.1"Super Retina XDR', N'iOS 16', N'Chính 48 MP & Phụ 12 MP, 12 MP', N'12 MP', N'Chip Apple A16 Bionic 6 ', N'6 GB
', N'128 GB', N'4352 mAh', N'20 W', N'iphone-14-pro-tim.jpg', N'Tại sự kiện ra mắt sản phẩm thường niên diễn ra vào tháng 9/2022, Apple đã trình làng iPhone 14 Pro với những cải tiến về thiết kế màn hình, hiệu năng, sẵn sàng cùng bạn chinh phục mọi thử thách. Giờ đây người dùng đã có thể mua sắm những sản phẩm iPhone 14 từ ngày 14/10/2022 tại Hệ Thống Cửa Hàng Điện Thoại TKT với đầy đủ các phiên bản.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 18, 1, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (11, N'iPhone 14 Pro Max', N'Chiếc', 33990000.0000, N'OLED6.7"Super Retina XDR', N'iOS 16', N'Chính 48 MP & Phụ 12 MP, 12 MP', N'12 MP', N'Chip Apple A16 Bionic 6 ', N'6 GB
', N'256 GB', N'4352 mAh', N'20 W', N'iphone-14-pro-max-den.jpg', N'Mới đây thì chiếc điện thoại iPhone 14 Pro Max 256GB cũng đã được chính thức lộ diện trên toàn cầu và đập tan bao lời đồn đoán bấy lâu nay, bên trong máy sẽ được trang bị con chip hiệu năng khủng cùng sự nâng cấp về camera đến từ nhà Apple.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 1, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (12, N'iPhone 14 Plus', N'Chiếc', 27490000.0000, N'OLED6.7"Super Retina XDR', N'iOS 16', N'2 camera 12 MP', N'12 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'128 GB', N'3095 mAh', N'20 W', N'iPhone-14-plus-den.jpg', N'iPhone 14 Plus thu hút mọi ánh nhìn trong sự kiện Far Out diễn ra ngày 8/9 nhờ có vẻ ngoài cao cấp, trang bị bộ xử lý mạnh mẽ, cụm camera kép đặc trưng cho khả năng chụp ảnh cực nét cùng màn hình chất lượng cao cho bạn tận hưởng cảm giác sử dụng smartphone tuyệt vời hơn. Từ ngày 14/10/2022 người dùng đã có thể mua sắm các sản phẩm iPhone 14 series đầy đủ phiên bản tại Cửa Hàng Điện Thoại Di Động TKT.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 32, 1, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (13, N'iPhone SE', N'Chiếc', 11490000.0000, N'IPS LCD4.7"Retina HD', N'iOS 15', N'12 MP', N'7 MP', N'Chip Apple A15 Bionic', N'4 GB
', N'128 GB', N'2018 mAh', N'20 W', N'iphone-se-black.jpeg', N'Được Apple cho ra mắt vào 8/3, iPhone SE 128GB (2022) có nhiều điểm được nâng cấp và ở phiên bản 128 GB này thì khả năng lưu trữ của máy cũng sẽ được nâng cao hơn nhiều so với phiên bản iPhone SE 64G (2022). Ngoài điểm này cùng mình xem thử chiếc iPhone này có điểm gì đáng tiền nữa nhé.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 19, 1, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (14, N'Samsung Galaxy Z Flip4 5G', N'Chiếc', 20990000.0000, N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 1.9"Full HD+', N'Android 12', N'2 camera 12 MP', N'10 MP', N'Chip Snapdragon 8+ Gen ', N'8 GB', N'128 GB', N'3700 mAh', N'25 W', N'samsung-galaxy-z-flip4-5g.jpg', N'Samsung Galaxy Z Flip4 128GB đã chính thức ra mắt thị trường công nghệ, đánh dấu sự trở lại của Samsung trên con đường định hướng người dùng về sự tiện lợi trên những chiếc điện thoại gập. Với độ bền được gia tăng cùng kiểu thiết kế đẹp mắt giúp Flip4 trở thành một trong những tâm điểm sáng giá cho nửa cuối năm 2022.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 21, 2, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (15, N'Samsung Galaxy S22 Ultra 5G', N'Chiếc', 25990000.0000, N'Dynamic AMOLED 2X6.8"Quad HD+ (2K+)', N'Android 12', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', N'40 MP', N'Chip Snapdragon 8 Gen 1', N'8 GB', N'128 GB', N'5000 mAh', N'45 W', N'Galaxy-S22-Ultra-Burgundy.jpg', N'Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 2, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (16, N'Samsung Galaxy A23', N'Chiếc', 5190000.0000, N'PLS TFT LCD6.6"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 5 MP, 2 MP, 2 MP', N'8 MP', N'Chip Snapdragon 680', N'4 GB
', N'128 GB', N'5000 mAh', N'25 W', N'samsung-galaxy-a23-cam.jpg', N'Samsung Galaxy A23 4GB sở hữu bộ thông số kỹ thuật khá ấn tượng trong phân khúc, máy có một hiệu năng ổn định, cụm 4 camera thông minh cùng một diện mạo trẻ trung phù hợp cho mọi đối tượng người dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 2, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (17, N'Samsung Galaxy Z Fold3 5G', N'Chiếc', 31990000.0000, N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Full HD+', N'Android 12', N'3 camera 12 MP', N'10 MP & 4 MP', N'Chip Snapdragon 888', N'12 GB', N'256 GB', N'4400 mAh', N'25 W', N'samsung-galaxy-z-fold-3.jpg', N'Samsung Galaxy Z Fold3 5G, chiếc điện thoại được nâng cấp toàn diện về nhiều mặt, đặc biệt đây là điện thoại màn hình gập đầu tiên trên thế giới có camera ẩn (08/2021). Sản phẩm sẽ là một “cú hit” của Samsung góp phần mang đến những trải nghiệm mới cho người dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 13, 2, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (18, N'Samsung Galaxy Z Fold4 5G', N'Chiếc', 37990000.0000, N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)', N'Android 12', N'Chính 50 MP & Phụ 12 MP, 10 MP', N'10 MP & 4 MP', N'Chip Snapdragon 8+ Gen 1', N'12 GB', N'256 GB', N'4400 mAh', N'25 W', N'samsung-galaxy-z-fold4-kem-256gb.jpg', N'Tại sự kiện Samsung Unpacked thường niên, Samsung Galaxy Z Fold4 256GB chính thức được trình làng thị trường công nghệ, mang trên mình nhiều cải tiến đáng giá giúp Galaxy Z Fold trở thành dòng điện thoại gập đã tốt nay càng tốt hơn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 14, 2, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (19, N'Samsung Galaxy Z Flip4 5G Đặc Biệt', N'Chiếc', 22990000.0000, N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)', N'Android 12', N'2 camera 12 MP', N'10 MP', N'Chip Snapdragon 8+ Gen 1', N'8 GB', N'256 GB', N'3700 mAh', N'25 W', N'Samsung-zip4.jpg', N'Tiếp nối sự thành công đến từ các thế thệ điện thoại gập đi trước, Samsung Galaxy Z Flip4 256GB đã được ra mắt với một ngôn ngữ thiết kế thân quen cùng sự nâng cấp đáng kể về độ bền cũng như nâng cấp kiểu dáng và chất liệu. Không đơn thuần là một chiếc smartphone mà đây còn được coi là món phụ kiện thời trang cao cấp đến từ nhà Samsung.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 16, 2, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (20, N'Samsung Galaxy S22+ 5G', N'Chiếc', 19990000.0000, N'Dynamic AMOLED 2X6.6"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 12 MP, 10 MP', N'10 MP', N'Chip Snapdragon 8 Gen 1', N'8 GB', N'128 GB', N'4500 mAh', N'45 W', N'Galaxy-S22-Plus-White.jpg', N'Samsung Galaxy S22+ 5G 128GB được Samsung cho ra mắt với ngoại hình không có quá nhiều thay đổi nhưng được nâng cấp đáng kể về thông số cấu hình bên trong và thời gian sử dụng, chắc hẳn sẽ mang lại những trải nghiệm thú vị dành cho bạn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 2, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (21, N'Samsung Galaxy Z Flip3 5G', N'Chiếc', 16990000.0000, N'Dynamic AMOLED 2XChính 6.7" & Phụ 1.9"Full HD+', N'Android 12', N'2 camera 12 MP', N'10 MP', N'Chip Snapdragon 888', N'8 GB', N'256 GB', N'3300 mAh', N'20 W', N'samsung-galaxy-z-flip-3-black.jpg', N'Nối tiếp thành công của Samsung Galaxy Z Flip 5G, trong sự kiện Galaxy Unpacked vừa qua nhà sản xuất tiếp tục giới thiệu đến thế giới về Samsung Galaxy Z Flip3 5G 256GB. Sản phẩm có nhiều cải tiến từ độ bền cho đến hiệu năng và thậm chí nó còn vượt xa hơn mong đợi của mọi người.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 2, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (22, N'Samsung Galaxy S22 5G', N'Chiếc', 15990000.0000, N'Dynamic AMOLED 2X6.1"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 12 MP, 10 MP', N'10 MP', N'Chip Snapdragon 8 Gen 1', N'8 GB', N'128 GB', N'3700 mAh', N'25 W', N'Galaxy-S22-Black.jpg', N'Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 17, 2, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (23, N'Samsung Galaxy S21 FE 5G', N'Chiếc', 12990000.0000, N'Dynamic AMOLED 2X6.4"Full HD+', N'Android 12', N'Chính 12 MP & Phụ 12 MP, 8 MP', N'32 MP', N'Chip Exynos 2100', N'8 GB', N'128 GB', N'4500 mAh', N'25 W', N'Samsung-Galaxy-S21.jpg', N'Điện thoại Samsung Galaxy S21 FE 5G xuất hiện với 1 ngoại hình tinh tế, cụm camera thông minh hoạt động đầy ấn tượng và cấu hình mạnh mẽ từ chip Exynos 2100 nhà Samsung, chắc chắn sẽ thu phục cảm tình của bạn trên từng trải nghiệm.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 15, 2, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (24, N'Samsung Galaxy M53', N'Chiếc', 11190000.0000, N'Super AMOLED Plus6.7"Full HD+', N'Android 12', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', N'32 MP', N'Chip MediaTek Dimensity 900 5G', N'8 GB', N'256 GB', N'5000 mAh', N'25 W', N'samsung-galaxy-m53-nau.jpg', N'Có lẽ 2022 là một năm bùng nổ của nhà Samsung, khi hãng liên tục trình làng nhiều sản phẩm có cấu hình mạnh mẽ cùng một mức giá bán hợp lý trên thị trường smartphone tầm trung và giá rẻ, tiêu biểu trong số đó có Samsung Galaxy M53 được xem là cái tên được cộng đồng người dùng tích cực quan tâm và săn đón kể cả khi chưa ra mắt.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 2, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (25, N'Samsung Galaxy A73 5G Awesome Edition', N'Chiếc', 11090000.0000, N'Super AMOLED Plus6.7"Full HD+', N'Android 12', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', N'32 MP', N'Chip Snapdragon 778G 5G', N'8 GB', N'128 GB', N'5000 mAh', N'25 W', N'Samsung-Galaxy-A73-PUBG.jpg', N'Samsung Galaxy A73 5G 128GB được xem là sản phẩm nổi bật nhất dòng Galaxy A 2022 mới ra mắt, máy trang bị bộ thông số kỹ thuật ấn tượng về phần hiệu năng, chất lượng màn hình và nổi bật nhất trong số đó là camera khi nó đem lại bức ảnh có độ phân giải lên đến 108 MP.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 15, 2, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (26, N'Samsung Galaxy A53 5G', N'Chiếc', 8390000.0000, N'Super AMOLED6.5"Full HD+', N'Android 12', N'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', N'32 MP', N'Chip Exynos 1280', N'8 GB', N'128 GB', N'5000 mAh', N'25 W', N'Samsung-Galaxy-A53-xan.jpg', N'Samsung Galaxy A53 5G 128GB trình làng với một thiết kế hiện đại, hiệu năng ổn định cùng một màn hình hiển thị sắc nét, hỗ trợ tần số quét cao giúp bạn có được những phút giây giải trí cực kỳ đã mắt, hay thỏa mãn đam mê nhiếp ảnh trong bạn nhờ trang bị camera có độ phân giải cao.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 20, 2, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (27, N'Samsung Galaxy A33 5G', N'Chiếc', 6890000.0000, N'Super AMOLED6.4"Full HD+', N'Android 12', N'Chính 48 MP & Phụ 8 MP, 5 MP, 2 MP', N'13 MP', N'Chip Exynos 1280', N'6 GB', N'128 GB', N'5000 mAh', N'25 W', N'samsung-galaxy-a33-5g-xanh.jpg', N'Samsung Galaxy A33 5G 6GB ra mắt vào ngày 17/03, được xem là bản cập nhật khá lớn so với thế hệ tiền nhiệm Galaxy A32 về thiết kế đến thông số kỹ thuật bên trong, nhằm mang đến vẻ ngoài đẹp mắt cũng như cạnh tranh trực tiếp ở phần hiệu năng đối với các đối thủ cùng phân khúc giá.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 30, 2, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (28, N'Samsung Galaxy A32', N'Chiếc', 5490000.0000, N'Super AMOLED6.4"Full HD+', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 5 MP, 5 MP', N'20 MP', N'Chip MediaTek Helio G80', N'6 GB', N'128 GB', N'5000 mAh', N'20 W', N'samsung-galaxy-a32-4g-thumb-xanh-.jpg', N'Samsung Galaxy A32 là chiếc điện thoại thuộc phân khúc tầm trung nhưng sở hữu nhiều ưu điểm vượt trội về màn hình lớn sắc nét, bộ bốn camera 64 MP cùng vi xử lý hiệu năng cao và được bán ra với mức giá vô cùng tốt.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 2, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (29, N'Samsung Galaxy A13', N'Chiếc', 4390000.0000, N'PLS TFT LCD6.6"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 5 MP, 2 MP, 2 MP', N'8 MP', N'Chip Exynos 850', N'4 GB
', N'128 GB', N'5000 mAh', N'20 W', N'Samsung-Galaxy-A13-cam.jpg', N'Nhằm mang trải nghiệm tốt hơn trên dòng sản phẩm giá rẻ, Samsung cho ra mắt Galaxy A13 4G với một hiệu năng ổn định, camera chụp ảnh sắc nét và viên pin khủng đáp ứng nhu cầu sử dụng cả ngày cho bạn cùng một mức giá trang bị cực kỳ phải chăng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 21, 2, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (30, N'OPPO Reno8 series', N'Chiếc', 18990000.0000, N'AMOLED6.7"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'32 MP', N'Chip MediaTek Dimensity 8100 Max 8', N'12 GB
', N'256 GB', N'4500 mAh', N'80 W', N'oppo-reno8-pro-thumb-xanh.jpg', N'OPPO Reno8 Pro 5G ra mắt với sự đột phá về phần camera khi đây là thiết bị đầu tiên thuộc dòng Reno được tích hợp NPU MariSilicon X, được xem là NPU cao cấp nhất đến từ OPPO (2022) có khả năng xử lý hình ảnh đỉnh cao. Kèm với đó là một con chip mạnh mẽ đến từ nhà MediaTek giúp bạn có thể cân được mọi tựa game đang hiện hành.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 32, 3, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (31, N'OPPO A55', N'Chiếc', 4190000.0000, N'IPS LCD6.5"HD+', N'Android 11', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'16 MP', N'Chip MediaTek Helio G35', N'4 GB
', N'64 GB', N'5000 mAh', N'18 W', N'oppo-a55-4g.jpg', N'OPPO cho ra mắt OPPO A55 4G chiếc smartphone giá rẻ tầm trung có thiết kế đẹp mắt, cấu hình khá ổn, cụm camera chất lượng và dung lượng pin ấn tượng, mang đến một lựa chọn trải nghiệm thú vị vừa túi tiền cho người tiêu dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 33, 3, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (32, N'OPPO Find X5 Pro 5G', N'Chiếc', 28990000.0000, N'AMOLED6.7"Quad HD+ (2K+)', N'Android 12', N'Chính 50 MP & Phụ 50 MP, 13 MP', N'32 MP', N'Chip Snapdragon 8 Gen 1', N'12 GB
', N'256 GB', N'5000 mAh', N'80 W', N'oppo-find-x5-pro-den.jpg', N'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 32, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (33, N'OPPO Reno6 series', N'Chiếc', 10390000.0000, N'AMOLED6.43"Full HD+', N'Android 12', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'32 MP', N'Chip MediaTek Dimensity 900 5G', N'8 GB', N'128 GB', N'4300 mAh', N'65 W', N'oppo-reno6-5g-black.jpg', N'Sau khi ra mắt OPPO Reno5 chưa lâu thì OPPO lại cho ra mẫu smartphone mới mang tên OPPO Reno6 với hàng loạt cải tiến mới về ngoại hình bên ngoài lẫn hiệu năng bên trong, mang đến trải nghiệm vượt bật cho người dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (34, N'OPPO Reno7 series', N'Chiếc', 8990000.0000, N'AMOLED6.43"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 2 MP', N'16 MP', N'Chip Snapdragon 695 5G', N'8 GB', N'128 GB', N'4500 mAh', N'33 W', N'oppo-reno7-z-5g.jpg', N'OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 21, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (35, N'OPPO A96', N'Chiếc', 6690000.0000, N'IPS LCD6.59"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP', N'16 MP', N'Chip Snapdragon 680', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'oppo-a96-den.jpg', N'OPPO A96 là cái tên được nhắc đến khá nhiều trên các diễn đàn công nghệ hiện nay, nhờ sở hữu một ngoại hình hết sức bắt mắt cùng hàng loạt các thông số ấn tượng trong phân khúc giá như hiệu năng cao, camera chụp ảnh sắc nét.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (36, N'OPPO A77s', N'Chiếc', 6290000.0000, N'IPS LCD6.56"HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP', N'8 MP', N'Chip Snapdragon 680 4G', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'oppo-a77s-xanh.jpg', N'OPPO vừa cho ra mắt mẫu điện thoại tầm trung mới với tên gọi OPPO A77s, máy sở hữu màn hình lớn, thiết kế đẹp mắt, hiệu năng ổn định cùng khả năng mở rộng RAM lên đến 8 GB vô cùng nổi bật trong phân khúc.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 21, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (37, N'OPPO A95', N'Chiếc', 6190000.0000, N'AMOLED6.43"Full HD+', N'Android 11', N'Chính 48 MP & Phụ 2 MP, 2 MP', N'16 MP', N'Chip Snapdragon 662', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'oppo-a95-4g-bac.jpg', N'Bên cạnh phiên bản 5G, OPPO còn bổ sung phiên bản OPPO A95 4G với giá thành phải chăng tập trung vào thiết kế năng động, sạc nhanh và hiệu năng đa nhiệm ấn tượng sẽ giúp cho cuộc sống của bạn thêm phần hấp dẫn, ngập tràn niềm vui.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (38, N'OPPO A76', N'Chiếc', 5690000.0000, N'IPS LCD6.56"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip Snapdragon 680', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'OPPO-A76-den.jpg', N'OPPO A76 4G ra mắt với thiết kế trẻ trung, hiệu năng ổn định, màn hình 90 Hz mượt mà cùng viên pin trâu cho thời gian sử dụng lâu dài phù hợp cho mọi đối tượng người dùng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 14, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (39, N'OPPO A57', N'Chiếc', 4190000.0000, N'IPS LCD6.56"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip MediaTek Helio G35', N'4 GB
', N'64 GB', N'5000 mAh', N'33 W', N'oppo-a57-xanh.jpg', N'Điện thoại OPPO A57 64GB vừa mới ra mắt đã tạo ấn tượng tích cực với cộng đồng yêu công nghệ. Sở hữu cho mình một thiết kế trẻ trung, hiệu năng mượt mà đáp ứng tốt nhu cầu cơ bản hằng ngày.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 17, 3, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (40, N'OPPO A15s', N'Chiếc', 3990000.0000, N'IPS LCD6.52"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip MediaTek Helio P35', N'4 GB
', N'64 GB', N'4230 mAh', N'10 W', N'oppo-a15s-xanh.jpg', N'Chiếc điện thoại OPPO A15s là một phiên bản nâng cấp của OPPO A15, có cấu hình ấn tượng trong tầm giá đủ để người dùng thỏa sức làm việc và giải trí khi cần thiết.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 3, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (41, N'OPPO A54', N'Chiếc', 3789000.0000, N'IPS LCD6.5"HD+', N'Android 11', N'13 MP & Phụ 2 MP, 2 MP', N'16 MP', N'Chip MediaTek Helio P35', N'4 GB
', N'128 GB', N'5000 mAh', N'18 W', N'oppo-a54-4g-black.jpg', N'OPPO tung ra mẫu điện thoại OPPO A54, được kế thừa thành công của OPPO A53, sở hữu bộ 3 camera AI thông minh, chấm camera selfie tinh tế nằm gọn trong màn hình tràn viền siêu rộng, vận hành mượt mà với hiệu năng ổn định và trở nên khác biệt so với các đối thủ trong tầm giá.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 3, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (42, N'Xiaomi Redmi Note 11', N'Chiếc', 4690000.0000, N'AMOLED6.43"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'Chip Snapdragon 680', N'4 GB
', N'64 GB', N'5000 mAh', N'33 W', N'Xiaomi-redmi-note-11-black.jpeg', N'Điện thoại Redmi được mệnh danh là dòng sản phẩm quốc dân ngon - bổ  - rẻ của Xiaomi và Redmi Note 11 (4GB/64GB) cũng không phải ngoại lệ, máy sở hữu một hiệu năng ổn định, màn hình 90 Hz mượt mà, cụm camera AI đến 50 MP cùng một mức giá vô cùng tốt.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 18, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (43, N'Xiaomi Redmi Note 11S series', N'Chiếc', 6190000.0000, N'IPS LCD6.6"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'16 MP', N'Chip MediaTek Dimensity 810 5G', N'6 GB
', N'128 GB', N'5000 mAh', N'33 W', N'xiaomi-redmi-note-11s-5g.jpg', N'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (44, N'Xiaomi 12T Pro', N'Chiếc', 16990000.0000, N'AMOLED6.67"1.5K', N'Android 11', N'Chính 200 MP & Phụ 8 MP, 2 MP', N'20 MP', N'Chip Snapdragon 8+ Gen 1', N'12 GB', N'256 GB', N'5000 mAh', N'120 W', N'xiaomi-12t-pro.jpg', N'Xiaomi Redmi Note 11T Pro có thiết kế đơn giản mà độc đáo, thông số kỹ thuật cũng rất ấn tượng khi sở hữu màn hình 144 Hz, vi xử lý MediaTek Dimensity 8-series, camera 108 MP và sạc nhanh 67 W.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 4, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (45, N'Xiaomi 12 series', N'Chiếc', 15990000.0000, N'AMOLED6.28"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 13 MP, 5 MP', N'32 MP', N'Chip Snapdragon 8 Gen 1', N'8 GB', N'256 GB', N'4500 mAh', N'65 W', N'Xiaomi-12-xam.jpg', N'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (46, N'Xiaomi 11T Pro 5G', N'Chiếc', 13990000.0000, N'AMOLED6.67"Full HD+', N'Android 11', N'Chính 108 MP & Phụ 8 MP, 5 MP', N'16 MP', N'Chip Snapdragon 888', N'8 GB', N'256 GB', N'5000 mAh', N'120 W', N'xiaomi-11t-pro-5g-8gb.jpeg', N'Xiaomi Redmi Note 11T Pro có thiết kế đơn giản mà độc đáo, thông số kỹ thuật cũng rất ấn tượng khi sở hữu màn hình 144 Hz, vi xử lý MediaTek Dimensity 8-series, camera 108 MP và sạc nhanh 67 W.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 4, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (47, N'Xiaomi 11T', N'Chiếc', 9990000.0000, N'
AMOLED6.67"Full HD+', N'Android 11', N'Chính 108 MP & Phụ 8 MP, 5 MP', N'16 MP', N'Chip MediaTek Dimensity 1200', N'8 GB', N'128 GB', N'5000 mAh', N'65 W', N'Xiaomi-11T-White.jpg', N'Xiaomi 11T 5G 128GB đầy nổi bật với thiết kế vô cùng trẻ trung, màn hình AMOLED, bộ 3 camera sắc nét và viên pin lớn đây sẽ là mẫu smartphone của Xiaomi thỏa mãn mọi nhu cầu giải trí, làm việc và là niềm đam mê sáng tạo của bạn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 13, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (48, N'Xiaomi 11 Lite 5G NE', N'Chiếc', 8990000.0000, N'AMOLED6.55"Full HD+', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 5 MP', N'20 MP', N'Chip Snapdragon 778G 5G', N'8 GB', N'256 GB', N'4500 mAh', N'33 W', N'xiaomi-11-lite-5g-ne.jpg', N'Xiaomi 11 Lite 5G NE một phiên bản có ngoại hình rất giống với Xiaomi Mi 11 Lite được ra mắt trước đây. Chiếc smartphone này của Xiaomi mang trong mình một hiệu năng ổn định, thiết kế sang trọng và màn hình lớn đáp ứng tốt các tác vụ hằng ngày của bạn một cách dễ dàng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 14, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (49, N'Xiaomi Redmi Note 10 Pro', N'Chiếc', 7490000.0000, N'AMOLED6.67"Full HD+', N'Android 11', N'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP', N'16 MP', N'Chip Snapdragon 732G', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'xiaomi-redmi-note-10-pro.jpg', N'Redmi Note 10 5G được Xiaomi cho ra mắt, đã nhanh chóng thu hút đông đảo fan yêu công nghệ bởi sự đầu tư chỉnh chu về thiết kế và cấu hình mà không phải nhà sản xuất smartphone nào cũng làm được.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 4, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (50, N'Xiaomi Redmi Note 11 Series', N'Chiếc', 6990000.0000, N'AMOLED6.67"Full HD+', N'Android 11', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'	Chip MediaTek Helio G96', N'8 GB', N'128 GB', N'5000 mAh', N'65 W', N'xiaomi-redmi-note-11-pro-trang.jpg', N'Xiaomi Redmi Note 11 Pro 4G mang trong mình khá nhiều những nâng cấp cực kì sáng giá. Là chiếc điện thoại có màn hình lớn, tần số quét 120 Hz, hiệu năng ổn định cùng một viên pin siêu trâu.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 4, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (51, N'Xiaomi Redmi Note 10S', N'Chiếc', 5990000.0000, N'AMOLED6.43"Full HD+', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'Chip MediaTek Helio G95', N'6 GB
', N'128 GB', N'5000 mAh', N'33 W', N'xiaomi-redmi-note-10s-6gb.jpeg', N'Xiaomi Redmi Note 10S 6GB được xem là điện thoại thuộc phân khúc smartphone giá tầm trung nhưng chinh phục người tiêu dùng với thiết kế sang đẹp, cấu hình ấn tượng và cụm camera cực chất, sẽ là thiết bị liên lạc, chiến game giải trí và làm việc ổn định,… cho các nhu cầu sử dụng của bạn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 4, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (52, N'Xiaomi Redmi 10 series', N'Chiếc', 4690000.0000, N'IPS LCD6.5"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP', N'8 MP', N'Chip MediaTek Helio G88', N'6 GB
', N'128 GB', N'5000 mAh', N'18 W', N'redmi-10-blue.jpg', N'Xiaomi Redmi 10 (2022) được ra mắt vào tháng 05/2022 với những nâng cấp về thuật toán xử lý khi chụp ảnh trên camera nhằm giúp khách hàng có được những bức hình chất lượng hơn trên một thiết bị thuộc phân khúc giá rẻ.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 15, 4, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (53, N'Xiaomi Redmi 10C', N'Chiếc', 3490000.0000, N'IPS LCD6.71"HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP', N'8 MP', N'Chip Snapdragon 680', N'4 GB
', N'64 GB', N'5000 mAh', N'18 W', N'xiaomi-redmi-10c-xanh-luc.jpg', N'Xiaomi Redmi 10C 64GB ra mắt với một cấu hình mạnh mẽ nhờ trang bị con chip 6 nm đến từ Qualcomm, màn hình hiển thị đẹp mắt, pin đáp ứng nhu cầu sử dụng cả ngày, hứa hẹn mang đến trải nghiệm tuyệt vời so với mức giá mà nó trang bị.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 4, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (54, N'Vivo Y15 series', N'Chiếc', 3190000.0000, N'IPS LCD6.51"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip MediaTek Helio P35', N'3 GB', N'32 GB', N'5000 mAh', N'10 W', N'Vivo-y15s-2021.jpg', N'Vivo vừa mang một chiến binh mới đến phân khúc tầm trung giá rẻ có tên Vivo Y15s, một sản phẩm sở hữu khá nhiều ưu điểm như thiết kế đẹp, màn hình lớn, camera kép, pin cực trâu và còn rất nhiều điều thú vị khác đang chờ đón bạn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 5, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (55, N'Vivo X80', N'Chiếc', 18990000.0000, N'AMOLED6.78"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 12 MP, 12 MP', N'32 MP', N'Chip MediaTek Dimensity 9000', N'12 GB', N'256 GB', N'5000 mAh', N'80 W', N'vivo-x80-xanh.jpg', N'Vivo X80 được xem là thiết bị hướng đến đối tượng người dùng chuyên nhiếp ảnh trên điện thoại, bằng việc hợp tác cùng nhà sản xuất ống kính nổi tiếng mang thương hiệu ZEISS. Với những tính năng mới mẻ hay chế độ quay - chụp độc đáo, X80 hứa hẹn mang đến cho bạn những trải nghiệm đầy mới lạ và chất lượng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 5, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (56, N'V25 series', N'Chiếc', 10490000.0000, N'AMOLED6.44"Full HD+', N'Android 12', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'50 MP', N'Chip MediaTek Dimensity 900 5G', N'8 GB', N'128 GB', N'4500 mAh', N'33 W', N'vivo-v25-5g-vang.jpg', N'Dường như 2022 là một năm bùng nổ cho điện thoại V series khi nhiều sản phẩm được cho ra mắt với thông số và thiết kế rất ấn tượng, trong đó có Vivo V25 vừa được giới thiệu vào tháng 10/2022 hứa hẹn sẽ gây sốt trên thị trường công nghệ trong giai đoạn cuối năm nay nhờ tạo hình đẹp cùng hiệu năng mạnh mẽ.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 5, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (57, N'Vivo T1 series', N'Chiếc', 8490000.0000, N'AMOLED6.44"Full HD+', N'Android 12', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'16 MP', N'Chip Snapdragon 778G 5G', N'8 GB', N'128 GB', N'4500 mAh', N'65 W', N'vivo-t1-5g.jpg', N'Ngay từ khi công bố thông số kỹ thuật đầy đủ cùng mức giá bán, Vivo T1 5G bỗng dưng trở thành cái tên được cộng đồng game thủ nhắc đến rất nhiều nhờ có hiệu năng cực cao nhưng giá thành trang bị lại cực kỳ hợp lý. Đi kèm với đó là nhiều công nghệ tối ưu game tân tiến giúp quá trình chơi game của bạn được diễn ra mượt mà.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 22, 5, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (58, N'Vivo V23 series', N'Chiếc', 7490000.0000, N'AMOLED6.44"Full HD+', N'Android 11', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'50 MP', N'	Chip MediaTek Helio G96', N'8 GB', N'128 GB', N'4500 mAh', N'65 W', N'Vivo-V23.jpg', N'Vivo V23 5G ra mắt thu hút không ít sự quan tâm của các khách hàng chuộng Vivo, thích selfie và đam mê với điện thoại thiết kế đẹp. Cần 1 smartphone chụp hình chuẩn chỉnh với 1 cấu hình tốt, bạn tham khảo phiên bản này của Vivo nào.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 16, 5, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (59, N'Vivo Y55', N'Chiếc', 6990000.0000, N'AMOLED6.44"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP, 2 MP', N'16 MP', N'Chip Snapdragon 680', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'vivo-y55-den.jpg', N'Vivo Y55 là một cái tên sáng giá dành cho những ai đang muốn chọn mua một chiếc điện thoại phục vụ việc chơi game nhờ cấu hình ổn định trên mức giá phải chăng, kèm với đó là khả năng chụp ảnh sắc nét hỗ trợ bạn trong các công việc nhiếp ảnh cực kỳ dễ dàng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 5, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (60, N'Vivo Y53s', N'Chiếc', 6990000.0000, N'IPS LCD6.58"Full HD+', N'Android 12', N'Chính 64 MP & Phụ 2 MP, 2 MP', N'16 MP', N'Chip MediaTek Helio G80', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'vivo-y53s-xanh.jpg', N'Vivo mang đến niềm vui cho mọi người tin dùng khi hãng chính thức tung ra chiếc điện thoại Vivo Y53s với những tính năng tiên tiến đi cùng hiệu năng mạnh mẽ. Đặc biệt, smartphone lại còn sở hữu mức giá hấp dẫn trong phân khúc tầm trung đầy hứa hẹn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 14, 5, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (61, N'Vivo Y22s', N'Chiếc', 5290000.0000, N'IPS LCD6.55"HD+', N'Android 12', N'Chính 50 MP & Phụ 2 MP', N'8 MP', N'Chip Snapdragon 680', N'4 GB
', N'128 GB', N'5000 mAh', N'18 W', N'vivo-y22s-vang.jpeg', N'Vivo dường như ngày càng chú trọng vào vẻ đẹp của từng sản phẩm khi có khá nhiều mẫu smartphone mới được trình làng với bề ngoài hết sức đẹp mắt, nổi bật trong khoảng thời gian gần đây (09/2022) có lẽ là Vivo Y22s (4GB/128GB) khi sở hữu cho mình một diện mạo vuông vức, thời thượng cùng mức giá bán cũng không kém phần ấn tượng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 17, 5, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (62, N'Vivo Y16', N'Chiếc', 3990000.0000, N'IPS LCD6.51"HD+', N'Android 12', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip MediaTek Helio P35', N'4 GB
', N'64 GB', N'5000 mAh', N'15 W', N'vivo-y16-vang.jpg', N'Vivo Y16 tiếp tục là một cái tên vừa được bổ sung cho dòng điện thoại Vivo Y trong năm 2022. Máy sở hữu một màn hình đẹp cùng viên pin lớn giúp bạn có thể giải trí hay học tập trong khoảng thời gian lâu dài chỉ với một lần sạc.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 5, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (63, N'Vivo Y21 series', N'Chiếc', 3890000.0000, N'IPS LCD6.51"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP', N'8 MP', N'Chip MediaTek Helio P35', N'4 GB
', N'64 GB', N'5000 mAh', N'15 W', N'vivo-y21-white.jpg', N'Vivo Y21 chiếc smartphone mang trong mình nhiều ưu điểm nổi bật như màn hình viền mỏng đẹp mắt, hiệu năng ổn định cùng dung lượng pin tận 5000 mAh chắc chắn sẽ đáp ứng nhu cầu sử dụng của bạn cả ngày dài.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 5, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (64, N'Realme 9 series', N'Chiếc', 8990000.0000, N'
Super AMOLED6.4"Full HD+', N'Android 12', N'Chính 50 MP & Phụ 8 MP, 2 MP', N'16 MP', N'Chip MediaTek Dimensity 920 5G', N'8 GB', N'128 GB', N'4500 mAh', N'65 W', N'realme-9-pro-plus-5g-blue.jpg', N'Realme 9 Pro+ 5G - chiếc smartphone tầm trung của Realme đã được ra mắt, máy có một thiết kế đầy màu sắc, cụm 3 camera với cảm biến IMX766 giúp bạn có được những bức ảnh sinh động.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 13, 6, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (65, N'Realme 8 series', N'Chiếc', 8690000.0000, N'Super AMOLED6.4"Full HD+', N'Android 11', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', N'16 MP', N'Chip Snapdragon 720G', N'8 GB', N'128 GB', N'4500 mAh', N'65 W', N'realme-8-pro-vang.jpg', N'Bên cạnh Realme 8, Realme 8 Pro cũng được giới thiệu đến người dùng với điểm nhấn chính là sự xuất hiện của camera 108 MP siêu nét cùng công nghệ sạc SuperDart 50 W và đi kèm mức giá bán tầm trung rất lý tưởng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 16, 6, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (66, N'Realme 9', N'Chiếc', 6190000.0000, N'
Super AMOLED6.4"Full HD+', N'Android 12', N'Chính 108 MP & Phụ 8 MP, 2 MP', N'16 MP', N'Chip Snapdragon 680 4G', N'8 GB', N'128 GB', N'5000 mAh', N'33 W', N'realme-9-4g-vang.jpg', N'Realme 9 4G hiện đang là một cái tên được cộng đồng người dùng smartphone hết sức quan tâm và đón nhận, nhờ sở hữu trong mình công nghệ màn hình xịn sò, khả năng chụp ảnh siêu độ phân giải với camera chính 108 MP.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 6, 2, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (67, N'Realme 9i', N'Chiếc', 4490000.0000, N'IPS LCD6.6"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP, 2 MP', N'16 MP', N'Chip Snapdragon 680', N'4 GB
', N'64 GB', N'5000 mAh', N'33 W', N'realme-9i-den.jpg', N'Realme 9i ra mắt với sự đón nhận và quan tâm của giới công nghệ khi sở hữu nhiều ưu điểm nổi bật như thiết kế đẹp mắt, cấu hình tốt và viên pin dung lượng cao cho thời gian sử dụng cả ngày.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 14, 6, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (68, N'Realme C35', N'Chiếc', 3990000.0000, N'
IPS LCD6.6"Full HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP, 0.3 MP', N'8 MP', N'Chip Unisoc T616', N'4 GB
', N'64 GB', N'5000 mAh', N'18 W', N'realme-c35.jpg', N'Điện thoại Realme C35 thuộc phân khúc giá rẻ được nhà Realme cho ra mắt với thiết kế trẻ trung, dung lượng pin lớn cùng camera hỗ trợ nhiều tính năng. Đây sẽ là thiết bị liên lạc, giải trí và làm việc ổn định,… cho các nhu cầu sử dụng của bạn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 15, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (69, N'Realme C25Y', N'Chiếc', 3690000.0000, N'IPS LCD6.5"HD+', N'Android 11', N'Chính 50 MP & Phụ 2 MP, 2 MP', N'8 MP', N'Chip Unisoc T618', N'4 GB
', N'64 GB', N'5000 mAh', N'18 W', N'realme-c25y-64gb-xanh.jpeg', N'Realme C25Y 64GB - là chiếc smartphone được Realme cho ra mắt với một mức giá khá tốt, sở hữu thiết kế hiện đại với 3 camera AI lên đến 50 MP, hiệu suất ổn định cùng thời gian sử dụng lâu dài nhờ viên pin khủng 5000 mAh, được xem là một trong những sản phẩm lý tưởng mà bạn nên sở hữu.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 11, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (70, N'Realme C21-Y', N'Chiếc', 3890000.0000, N'
IPS LCD6.5"HD+', N'Android 11', N'Chính 13 MP & Phụ 2 MP, 2 MP', N'8 MP', N'	Chip Spreadtrum T610', N'3 GB
', N'32 GB', N'5000 mAh', N'10 W', N'realme-c21-y-black.jpg', N'Realme C21-Y 3 GB là chiếc điện thoại nằm ở phân khúc giá rẻ với điểm nhấn thiết kế hình học sang trọng, bộ 3 camera chất lượng, hiệu năng đáp ứng khá tốt các nhu cầu và thời lượng pin tương đối dài hứa hẹn mang đến cho người dùng những trải nghiệm ấn tượng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 13, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (71, N'Realme C33', N'Chiếc', 2990000.0000, N'
IPS LCD6.5"HD+', N'Android 11', N'Chính 50 MP & Phụ 0.3 MP', N'8 MP', N'Chip Unisoc Tiger T612', N'3 GB
', N'32 GB', N'5000 mAh', N'10 W', N'realme-c33-thumb-xanh.jpg', N'Trong tháng 10/2022, Realme C33 (3GB/32GB) là cái tên thu hút được nhiều sự chú ý trên các diễn đàn công nghệ, sở hữu trên máy là một thiết kế hợp xu hướng đi kèm với màn hình to rõ giúp bạn có thể sử dụng các tác vụ giải trí được tốt hơn.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 12, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (72, N'Realme C30s', N'Chiếc', 2490000.0000, N'IPS LCD6.5"HD+', N'Android 12', N'8 MP', N'8 MP', N'Chip Unisoc SC9863A1', N'3 GB
', N'32 GB', N'5000 mAh', N'10 W', N'Realme-c30s-xanh.jpg', N'Mới đây thì chiếc điện thoại Realme C30s (2GB/32GB) cũng đã chính thức lộ diện đúng như dự kiến của người dùng với bộ thông số kỹ thuật khá ấn tượng cùng mức giá hợp lý. Điều này giúp nâng cao trải nghiệm một cách tốt hơn đối với những dòng sản phẩm thuộc phân khúc giá rẻ.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 10, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (73, N'Realme C11 series', N'Chiếc', 1990000.0000, N'IPS LCD6.5"HD+', N'Android 11', N'8 MP', N'8 MP', N'Chip Spreadtrum SC9863A', N'2 GB
', N'32 GB', N'5000 mAh', N'10 W', N'realme-c11-2021-blue.jpg', N'Realme C11 (2021) 2GB/32GB của Realme nằm trong phân khúc smartphone giá rẻ nhưng có ngoại hình khá ổn và cụm camera chất lượng tốt cùng dung lượng pin ấn tượng, sẽ là 1 lựa chọn tốt cho nhu cầu sử dụng smartphone với các tính năng cơ bản thông dụng.', CAST(N'2022-10-10T00:00:00' AS SmallDateTime), 19, 6, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [ManHinh], [HeDieuHanh], [CameraSau], [CameraTruoc], [CPU], [RAM], [BoNhoTrong], [DungLuongPin], [Sac], [HinhMinhHoa], [ThongTinSanPham], [NgayCapNhat], [SoLuongBan], [MaTH], [MaLSP], [MaTT]) VALUES (79, N'Iphone 15', N'Chiếc', 39000000.0000, N'LCD', N'Iphone', N'2 camera 12MP', N'16 MP', N'Chip Apple', N'12 GB', N'256 GB', N'2815 mAh', N'60 W', N'iphone-12-tim.jpg', N'Iphone 12 là một sản phẩm mới trên thị trường

Có sức ảnh hưởng lớn đến thị trường', CAST(N'2022-11-16T00:00:00' AS SmallDateTime), 10, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[THUONGHIEU] ON 

INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (1, N'iPhone', N'Apple.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (2, N'Samsung', N'Samsung.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (3, N'Oppo', N'Oppo.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (4, N'Xiaomi', N'Xiaomi.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (5, N'Vivo', N'Vivo.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (6, N'Realmi', N'Realme.png')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH], [HinhMinhHoa]) VALUES (7, N'HTC', N'HTC.jpg')
SET IDENTITY_INSERT [dbo].[THUONGHIEU] OFF
GO
SET IDENTITY_INSERT [dbo].[TINHTRANG] ON 

INSERT [dbo].[TINHTRANG] ([MaTT], [TinhTrang], [TenTinhTrang]) VALUES (1, N'moiramat', N'Mới ra mắt')
INSERT [dbo].[TINHTRANG] ([MaTT], [TinhTrang], [TenTinhTrang]) VALUES (2, N'giamgia', N'Giảm giá sốc')
INSERT [dbo].[TINHTRANG] ([MaTT], [TinhTrang], [TenTinhTrang]) VALUES (3, N'giareonline', N'Giá rẻ Online')
SET IDENTITY_INSERT [dbo].[TINHTRANG] OFF
GO
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([MaTinTuc], [HinhMinhHoa], [MoTaTinTuc], [TenNhaBao], [ThoiGianBao], [LinkTinTuc]) VALUES (1, N'638043618739440786_samsung-galaxy-1.jpg', N'Tìm hiểu chi tiết hệ sinh thái Galaxy của Samsung, quá nhiều điều bất ngờ', N'Samsung', N'4 giờ', N'https://fptshop.com.vn/tin-tuc/danh-gia/tim-hieu-chi-tiet-he-sinh-thai-galaxy-cua-samsung-151750')
INSERT [dbo].[TINTUC] ([MaTinTuc], [HinhMinhHoa], [MoTaTinTuc], [TenNhaBao], [ThoiGianBao], [LinkTinTuc]) VALUES (2, N'OPPO-Find-N-Flip-1.jpeg', N'Mọi thông tin chúng ta biết cho đến nay về OPPO Find N Flip', N'Oppo', N'5 giờ', N'https://fptshop.com.vn/tin-tuc/danh-gia/moi-thong-tin-chung-ta-biet-cho-den-nay-ve-oppo-find-n-flip-151757')
INSERT [dbo].[TINTUC] ([MaTinTuc], [HinhMinhHoa], [MoTaTinTuc], [TenNhaBao], [ThoiGianBao], [LinkTinTuc]) VALUES (3, N'iPhone-USB-C-cover.jpeg', N'Sau châu Âu, đến lượt Ấn Độ có thể buộc Apple sử dụng USB-C trên iPhone', N'iPhone', N'6 giờ', N'https://fptshop.com.vn/tin-tuc/tin-moi/an-do-co-the-buoc-apple-su-dung-usb-c-tren-iphone-151761')
INSERT [dbo].[TINTUC] ([MaTinTuc], [HinhMinhHoa], [MoTaTinTuc], [TenNhaBao], [ThoiGianBao], [LinkTinTuc]) VALUES (4, N'samsung-galaxy-s22-den-12.jpg', N'Samsung Galaxy A14 5G với chip Exynos 1330 được phát hiện trên Geekbench', N'Samsung', N'3 giờ', N'https://fptshop.com.vn/tin-tuc/tin-moi/samsung-galaxy-a14-5g-duoc-phat-hien-tren-geekbench-151753')
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
GO
ALTER TABLE [dbo].[ADMIN] ADD  DEFAULT ((1)) FOR [GioiTinhAdmin]
GO
ALTER TABLE [dbo].[ADMIN] ADD  DEFAULT ((1)) FOR [QuyenAdmin]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF__DONDATHAN__DaGia__45F365D3]  DEFAULT ((0)) FOR [DaGiao]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF__DONDATHAN__HTTha__46E78A0C]  DEFAULT ((0)) FOR [HTThanhToan]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF__DONDATHAN__HTGia__47DBAE45]  DEFAULT ((0)) FOR [HTGiaoHang]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [DF__KHACHHANG__GioiT__3F466844]  DEFAULT ((1)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [DF__KHACHHANG__DaDuy__403A8C7D]  DEFAULT ((0)) FOR [DaDuyet]
GO
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF__SANPHAM__DonViTi__412EB0B6]  DEFAULT ('cu?n') FOR [DonViTinh]
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDATHANG_DONDATHANG] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DONDATHANG] ([SoDH])
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [FK_CTDATHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDATHANG_SANPHAM1] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [FK_CTDATHANG_SANPHAM1]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_PHANLOAISP] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[PHANLOAISP] ([MaLSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_PHANLOAISP]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_THUONGHIEU] FOREIGN KEY([MaTH])
REFERENCES [dbo].[THUONGHIEU] ([MaTH])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_THUONGHIEU]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_TINHTRANG] FOREIGN KEY([MaTT])
REFERENCES [dbo].[TINHTRANG] ([MaTT])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_TINHTRANG]
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [CK__CTDATHANG__DonGi__4BAC3F29] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [CK__CTDATHANG__DonGi__4BAC3F29]
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [CK__CTDATHANG__SoLuo__4CA06362] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [CK__CTDATHANG__SoLuo__4CA06362]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [CK__DONDATHAN__TriGi__5165187F] CHECK  (([TriGia]>(0)))
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [CK__DONDATHAN__TriGi__5165187F]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CK__SANPHAM__DonGia__4E88ABD4] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CK__SANPHAM__DonGia__4E88ABD4]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CK__SANPHAM__SoLuong__4F7CD00D] CHECK  (([SoLuongBan]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CK__SANPHAM__SoLuong__4F7CD00D]
GO
USE [master]
GO
ALTER DATABASE [WebBanDienThoai] SET  READ_WRITE 
GO
