USE [master]
GO
/****** Object:  Database [manghoctap_new]    Script Date: 12/30/2013 9:32:01 PM ******/
CREATE DATABASE [manghoctap_new]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'manghoctap_new', FILENAME = N'C:\MangHocTapSVN\Database\MangHocTapDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'manghoctap_new_log', FILENAME = N'C:\MangHocTapSVN\Database\MangHocTapDB.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [manghoctap_new] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [manghoctap_new].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [manghoctap_new] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [manghoctap_new] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [manghoctap_new] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [manghoctap_new] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [manghoctap_new] SET ARITHABORT OFF 
GO
ALTER DATABASE [manghoctap_new] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [manghoctap_new] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [manghoctap_new] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [manghoctap_new] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [manghoctap_new] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [manghoctap_new] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [manghoctap_new] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [manghoctap_new] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [manghoctap_new] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [manghoctap_new] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [manghoctap_new] SET  DISABLE_BROKER 
GO
ALTER DATABASE [manghoctap_new] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [manghoctap_new] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [manghoctap_new] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [manghoctap_new] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [manghoctap_new] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [manghoctap_new] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [manghoctap_new] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [manghoctap_new] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [manghoctap_new] SET  MULTI_USER 
GO
ALTER DATABASE [manghoctap_new] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [manghoctap_new] SET DB_CHAINING OFF 
GO
ALTER DATABASE [manghoctap_new] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [manghoctap_new] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [manghoctap_new]
GO
/****** Object:  Table [dbo].[BaiVietGhiChu]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaiVietGhiChu](
	[mabaiviet] [int] IDENTITY(1,1) NOT NULL,
	[tenbaiviet] [nvarchar](50) NULL,
	[noidung] [nvarchar](200) NULL,
	[nguoiviet] [int] NULL,
	[ngayviet] [datetime] NULL,
	[monhoc] [varchar](10) NULL,
 CONSTRAINT [PK_baivietthongbao] PRIMARY KEY CLUSTERED 
(
	[mabaiviet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BaiVietMonHoc]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaiVietMonHoc](
	[mabaiviet] [int] IDENTITY(1,1) NOT NULL,
	[tenbaiviet] [nvarchar](50) NULL,
	[noidung] [nvarchar](3000) NULL,
	[danhgia] [int] NULL,
	[nguoiviet] [int] NULL,
	[tennguoiviet] [nvarchar](50) NULL,
	[ngayviet] [datetime] NULL,
	[monhoc] [varchar](10) NULL,
	[loaibai] [int] NULL,
 CONSTRAINT [PK_baiviethoctap] PRIMARY KEY CLUSTERED 
(
	[mabaiviet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BaiVietNhom]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiVietNhom](
	[mabaiviet] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[manhom] [nvarchar](20) NOT NULL,
	[ngaydang] [datetime] NOT NULL,
	[noidung] [nvarchar](max) NULL,
	[lathongbao] [bit] NULL,
 CONSTRAINT [PK_BaiVietNhom] PRIMARY KEY CLUSTERED 
(
	[mabaiviet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[id1] [int] NOT NULL,
	[id2] [int] NOT NULL,
	[quanhe] [int] NULL,
 CONSTRAINT [PK_BanBe_1] PRIMARY KEY CLUSTERED 
(
	[id1] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanBaiVietNhom]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanBaiVietNhom](
	[mabinhluan] [int] IDENTITY(1,1) NOT NULL,
	[mabaiviet] [int] NOT NULL,
	[noidung] [nvarchar](max) NULL,
	[ngaydang] [datetime] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_BinhLuanBaiVietNhom] PRIMARY KEY CLUSTERED 
(
	[mabinhluan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanBVMH]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanBVMH](
	[mabaiviet] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](1000) NULL,
	[danhgia] [int] NULL,
	[haynhat] [bit] NULL,
	[nguoiviet] [int] NULL,
	[ngayviet] [datetime] NULL,
	[baivietmonhoc] [int] NULL,
 CONSTRAINT [PK_binhluanbvht] PRIMARY KEY CLUSTERED 
(
	[mabaiviet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CapdoCH]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CapdoCH](
	[diemch] [int] NULL,
	[tencapdo] [nvarchar](30) NULL,
	[anhcapdo] [nvarchar](50) NULL,
	[maucapdo] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[makhoa] [varchar](10) NOT NULL,
	[tenkhoa] [nvarchar](50) NULL,
	[matruong] [varchar](10) NULL,
	[gioithieu] [nvarchar](300) NULL,
	[sodt] [nchar](20) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[makhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KinhNghiemHocKy]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KinhNghiemHocKy](
	[mabaiviet] [int] NULL,
	[noidung] [nvarchar](1000) NULL,
	[diem] [int] NULL,
	[idviet] [nchar](10) NULL,
	[time] [datetime] NULL,
	[hocky] [int] NULL,
	[nganh] [varchar](10) NULL,
	[tennguoiviet] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[malop] [varchar](10) NOT NULL,
	[tenlop] [nvarchar](50) NULL,
	[manganh] [varchar](10) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MoiKetBan]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoiKetBan](
	[idketban] [int] IDENTITY(1,1) NOT NULL,
	[id1] [int] NULL,
	[id2] [int] NULL,
 CONSTRAINT [PK_MoiKetBan] PRIMARY KEY CLUSTERED 
(
	[idketban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonHoc](
	[mamonhoc] [varchar](10) NOT NULL,
	[manganh] [varchar](10) NOT NULL,
	[tenmonhoc] [nvarchar](100) NULL,
	[stc] [int] NULL,
	[heso] [int] NULL,
	[khoa] [varchar](10) NULL,
 CONSTRAINT [PK_monhoc_1] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC,
	[manganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonSinh]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonSinh](
	[mamonhoc] [varchar](10) NOT NULL,
	[id] [int] NOT NULL,
	[stc] [int] NULL,
	[heso] [int] NULL,
	[batdau] [date] NOT NULL,
	[ketthuc] [date] NOT NULL,
	[thoikhoabieu] [nvarchar](100) NULL,
	[diemquatrinh] [float] NULL,
	[diemthi] [float] NULL,
	[trangthai] [int] NULL,
	[hocky] [int] NULL,
 CONSTRAINT [PK_monsinh] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nganh](
	[manganh] [varchar](10) NOT NULL,
	[tennganh] [nvarchar](50) NULL,
	[gioithieu] [nvarchar](300) NULL,
	[makhoa] [varchar](10) NULL,
	[sonamdaotao] [int] NULL,
	[khoabd] [int] NULL,
 CONSTRAINT [PK_Nganh] PRIMARY KEY CLUSTERED 
(
	[manganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanThongBao]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanThongBao](
	[mathongbao] [int] NULL,
	[nguoinhan] [varchar](8000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[id] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[sodt] [nchar](20) NULL,
	[gioitinh] [bit] NULL,
	[trangthai] [int] NULL,
	[avatar] [nvarchar](100) NULL,
	[diemconghien] [int] NULL,
	[nienkhoa] [varchar](10) NULL,
	[matruong] [varchar](10) NULL,
	[makhoa] [varchar](10) NULL,
	[manganh] [varchar](10) NULL,
	[malop] [varchar](10) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sukiencanhan]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sukiencanhan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tensukien] [nvarchar](50) NULL,
	[noidung] [nvarchar](200) NULL,
	[batdau] [datetime] NOT NULL,
	[ketthuc] [datetime] NOT NULL,
	[nguoithamgia] [nvarchar](max) NULL,
	[diadiem] [nvarchar](50) NULL,
	[SV_ID] [int] NOT NULL,
 CONSTRAINT [PK_sukiencanhan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongBaoBinhLuan]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBaoBinhLuan](
	[ID] [int] NOT NULL,
	[mabaiviet] [int] NOT NULL,
	[loai] [int] NOT NULL,
	[NoiDung] [nvarchar](200) NULL,
	[Link] [nvarchar](100) NULL,
 CONSTRAINT [PK_ThongBaoBinhLuan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[mabaiviet] ASC,
	[loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinNhan]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhan](
	[matinnhan] [int] IDENTITY(1,1) NOT NULL,
	[nguoinhan] [int] NOT NULL,
	[nguoigui] [int] NOT NULL,
	[noidung] [nvarchar](500) NULL,
	[ngaynhan] [datetime] NULL,
	[trangthai] [int] NULL,
 CONSTRAINT [PK_TinNhan] PRIMARY KEY CLUSTERED 
(
	[matinnhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Truong]    Script Date: 12/30/2013 9:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Truong](
	[matruong] [varchar](10) NOT NULL,
	[tentruong] [nvarchar](50) NULL,
	[gioithieu] [nvarchar](300) NULL,
	[sodt] [nchar](20) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Truong] PRIMARY KEY CLUSTERED 
(
	[matruong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BaiVietGhiChu] ON 

INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (3, N'Bài 04. Saturday, December 20, 2013', N'<p>Ngadasdsadg Nin</p>', 1, NULL, N'CTR1012')
INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (4, N'Bài 02. Saturday, December 12, 2013', N'<p>Ngadasdsdsadasdas Nin Michinin</p>
', 1, NULL, N'CTR1012')
INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (5, N'Bài 01. Saturday, December 10, 2013', N'<p>Ngadasdsasadasdascsacvsafsafsadg Nin</p>', 1, NULL, N'CTR1012')
INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (6, N'Bài 03. Saturday, December 19, 2013', N'<p>Ngadasdsadasdasdasdasdasdasdasdg Nin</p>', 1, NULL, N'CTR1012')
INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (8, N'Bài 05. Saturday, December 21, 2013', N'<hr />
<p>sdfsdfsdfsdf</p>
', 1, NULL, N'CTR1012')
INSERT [dbo].[BaiVietGhiChu] ([mabaiviet], [tenbaiviet], [noidung], [nguoiviet], [ngayviet], [monhoc]) VALUES (9, N'Bài 06. Sunday, December 22, 2013', N'<p>ẫXA</p>
', 1, NULL, N'CTR1012')
SET IDENTITY_INSERT [dbo].[BaiVietGhiChu] OFF
SET IDENTITY_INSERT [dbo].[BaiVietMonHoc] ON 

INSERT [dbo].[BaiVietMonHoc] ([mabaiviet], [tenbaiviet], [noidung], [danhgia], [nguoiviet], [tennguoiviet], [ngayviet], [monhoc], [loaibai]) VALUES (1, N'Tiêu đề gì đây ^^', N'<p><em>ĐCSVN) &ndash; </em>C&aacute;c phương tiện truyền th&ocirc;ng địa phương đưa tin cho biết, vụ nổ xảy ra l&uacute;c 12h45 giờ địa phương (08h45 GMT) ng&agrave;y 29/12 tại một nh&agrave; ga th&agrave;nh phố Volgograd, miền nam nước Nga<em>...s</em>ố nạn nh&acirc;n trong vụ tấn c&ocirc;ng hiện đ&atilde; l&ecirc;n tới 18 người thiệt mạng v&agrave; h&agrave;ng chục người kh&aacute;c bị thương, tiếp tục tăng so với th&ocirc;ng b&aacute;o được Bộ Nội vụ đưa ra trước đ&oacute;.</p>', 0, 1, N'Nguyễn Đông Nin', CAST(0x0000A2A4001330DE AS DateTime), N'CTR1012', 1)
INSERT [dbo].[BaiVietMonHoc] ([mabaiviet], [tenbaiviet], [noidung], [danhgia], [nguoiviet], [tennguoiviet], [ngayviet], [monhoc], [loaibai]) VALUES (2, N'tiêu đề phải > 10 ký tự ^^', N'<p>Đến 23h ng&agrave;y 29/12, ngo&agrave;i biển rất tối, gi&oacute; to v&agrave; s&oacute;ng lớn n&ecirc;n c&aacute;c t&agrave;u thuyền rất kh&oacute; cứu hộ. Tuy nhi&ecirc;n, h&agrave;ng trăm người vẫn đi dọc bờ biển Cần Giờ để t&igrave;m thi thể c&aacute;c học sinh<strong><em>.</em></strong></p>', 1, 1, N'Nguyễn Đông Nin', CAST(0x0000A2A4001625B7 AS DateTime), N'CTR1012', 1)
INSERT [dbo].[BaiVietMonHoc] ([mabaiviet], [tenbaiviet], [noidung], [danhgia], [nguoiviet], [tennguoiviet], [ngayviet], [monhoc], [loaibai]) VALUES (3, N'Ôn thi học gì đây ?', N'<p>Thời điểm cuối năm, nhiều cửa h&agrave;ng, si&ecirc;u thị rầm rộ d&aacute;n bảng: &ldquo;xả h&agrave;ng tồn kho cuối năm&rdquo;, &ldquo;giảm gi&aacute; cực sốc&rdquo;, &ldquo;gi&aacute;m gi&aacute; 50%&rdquo;, thậm ch&iacute; c&oacute; nơi l&ecirc;n đến 70 - 80%.</p>', 0, 1, N'Nguyễn Đông Nin', CAST(0x0000A2A400210B0E AS DateTime), N'ANH1013', 2)
INSERT [dbo].[BaiVietMonHoc] ([mabaiviet], [tenbaiviet], [noidung], [danhgia], [nguoiviet], [tennguoiviet], [ngayviet], [monhoc], [loaibai]) VALUES (4, N'Hướng dẫn on tập 1', N'<p>Chuẩn bị thật nhiều t&agrave;i liệu, v&agrave; sẵn s&agrave;ng t&igrave;nh thần chiến đ&acirc;u :v<br />&nbsp;</p>', 0, 1, N'Nguyễn Đông Nin', CAST(0x0000A2A40026B8B0 AS DateTime), N'ANH1013', 1)
SET IDENTITY_INSERT [dbo].[BaiVietMonHoc] OFF
SET IDENTITY_INSERT [dbo].[BaiVietNhom] ON 

INSERT [dbo].[BaiVietNhom] ([mabaiviet], [ID], [manhom], [ngaydang], [noidung], [lathongbao]) VALUES (1, 3, N'DHKH', CAST(0x0000A2A000000000 AS DateTime), N'Mày hả Bưởi', NULL)
INSERT [dbo].[BaiVietNhom] ([mabaiviet], [ID], [manhom], [ngaydang], [noidung], [lathongbao]) VALUES (3, 2, N'DHKH', CAST(0x0000A29D00000000 AS DateTime), N'Mày hả bưởi 2', NULL)
INSERT [dbo].[BaiVietNhom] ([mabaiviet], [ID], [manhom], [ngaydang], [noidung], [lathongbao]) VALUES (4, 1, N'DHKH', CAST(0x0000A29200000000 AS DateTime), N'Mày hả bưởi 1', NULL)
INSERT [dbo].[BaiVietNhom] ([mabaiviet], [ID], [manhom], [ngaydang], [noidung], [lathongbao]) VALUES (5, 1, N'DHT01     ', CAST(0x0000A2A400C1ED8B AS DateTime), N'<p>abc</p>', NULL)
SET IDENTITY_INSERT [dbo].[BaiVietNhom] OFF
INSERT [dbo].[BanBe] ([id1], [id2], [quanhe]) VALUES (1, 2, 1)
INSERT [dbo].[BanBe] ([id1], [id2], [quanhe]) VALUES (1, 3, 1)
INSERT [dbo].[BanBe] ([id1], [id2], [quanhe]) VALUES (2, 1, 1)
INSERT [dbo].[BanBe] ([id1], [id2], [quanhe]) VALUES (3, 1, 1)
SET IDENTITY_INSERT [dbo].[BinhLuanBaiVietNhom] ON 

INSERT [dbo].[BinhLuanBaiVietNhom] ([mabinhluan], [mabaiviet], [noidung], [ngaydang], [id]) VALUES (1, 1, N'chi rứa 3', CAST(0x0000A29200000000 AS DateTime), 3)
INSERT [dbo].[BinhLuanBaiVietNhom] ([mabinhluan], [mabaiviet], [noidung], [ngaydang], [id]) VALUES (2, 3, N'chi rứa 2', CAST(0x0000A29200000000 AS DateTime), 2)
INSERT [dbo].[BinhLuanBaiVietNhom] ([mabinhluan], [mabaiviet], [noidung], [ngaydang], [id]) VALUES (3, 4, N'chi rứa 1', CAST(0x0000A29200000000 AS DateTime), 1)
INSERT [dbo].[BinhLuanBaiVietNhom] ([mabinhluan], [mabaiviet], [noidung], [ngaydang], [id]) VALUES (4, 5, N'nnb', CAST(0x0000A2A400C20170 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BinhLuanBaiVietNhom] OFF
INSERT [dbo].[CapdoCH] ([diemch], [tencapdo], [anhcapdo], [maucapdo]) VALUES (20, N'Nhập môn', N'ImagesAcc/ImgLevel/nhapmon.jpg', NULL)
INSERT [dbo].[CapdoCH] ([diemch], [tencapdo], [anhcapdo], [maucapdo]) VALUES (40, N'Tân binh', N'ImagesAcc/ImgLevel/tanbinh.jpg', NULL)
INSERT [dbo].[CapdoCH] ([diemch], [tencapdo], [anhcapdo], [maucapdo]) VALUES (60, N'Binh nhì', N'ImagesAcc/ImgLevel/file14.jpg', NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHA01     ', N'Luật', N'DHA       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHF01     ', N'Tiếng Anh Chuyên Ngành', N'DHF       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT01     ', N'Công Nghệ Thông Tin', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT02     ', N'Lý Luận Chính Trị', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT03     ', N'Toán', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT04     ', N'Vật Lý', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT05     ', N'Xã Hội Học', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([makhoa], [tenkhoa], [matruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT06     ', N'Lịch Sử', N'DHT       ', NULL, NULL, NULL)
INSERT [dbo].[Lop] ([malop], [tenlop], [manganh]) VALUES (N'DHT01134A ', N'TinK34A', N'DHT011    ')
INSERT [dbo].[Lop] ([malop], [tenlop], [manganh]) VALUES (N'DHT01134B ', N'TinK34B', N'DHT011    ')
INSERT [dbo].[Lop] ([malop], [tenlop], [manganh]) VALUES (N'DHT01135A ', N'TinK35A', N'DHT011    ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'ANH1013   ', N'DHT011    ', N'Anh văn căn bản 1', 3, 70, N'DHF01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'ANH1022   ', N'DHT011    ', N'Anh văn căn bản 2', 2, 60, N'DHF01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'ANH1032   ', N'DHT011    ', N'Anh văn căn bản 3', 2, 60, N'DHF01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'CTR1012   ', N'DHT011    ', N'Những nguyên lí cơ bản của chủ nghĩa Mác-Lênin 1', 2, 60, N'DHT02     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'CTR1013   ', N'DHT011    ', N'Những nguyên lí cơ bản của chủ nghĩa Mác-Lênin 2', 3, 60, N'DHT02     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'CTR1022   ', N'DHT011    ', N'Tư tưởng Hồ Chí Minh', 2, 60, N'DHT02     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'CTR1033   ', N'DHT011    ', N'Đường lối cách mạng của Đản Cộng sản Việt Nam', 3, 60, N'DHT02     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'LIS1022   ', N'DHT011    ', N'Văn hóa Việt Nam đại cương', 2, 60, N'DHT06     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'LUA1012   ', N'DHT011    ', N'Pháp luật Việt Nam đại cương', 2, 60, N'DHA01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN1013   ', N'DHT011    ', N'Tin học đại cương', 3, 70, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN1042   ', N'DHT011    ', N'Kỹ thuật lập trình 1', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN1053   ', N'DHT011    ', N'Kỹ thuật lập trình 2', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN2013   ', N'DHT011    ', N'Kiến trúc máy tính', 3, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN2033   ', N'DHT011    ', N'Anh văn chuyên ngành', 3, 60, N'DHF01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3013   ', N'DHT011    ', N'Ngôn ngữ lập trình bậc cao', 3, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3023   ', N'DHT011    ', N'Toán rời rạc', 3, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3032', N'DHT011', N'Nhập môn cơ sở dữ liệu', 2, 70, N'DHT01')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3042   ', N'DHT011    ', N'Nguyên lý hệ điều hành', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3053', N'DHT011', N'Các hệ quản trị cơ sở dữ liệu', 3, 60, N'DHT01')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3062   ', N'DHT011    ', N'Xử lý tín hiệu số', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3073', N'DHT011', N'Lập trình hướng đối tượng', 3, 50, N'DHT01')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3084', N'DHT011', N'Cấu trúc dữ liệu và thuật toán', 4, 50, N'DHT01')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3093   ', N'DHT011    ', N'Phân tích và thiết kế các hệ thống thông tin', 3, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3102   ', N'DHT011    ', N'Kỹ nghệ phần mềm', 2, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3113   ', N'DHT011    ', N'Nhập môn trí tuệ nhân tạo', 3, 70, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3123', N'DHT011', N'Mạng máy tính', 3, 70, N'DHT01')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3133   ', N'DHT011    ', N'Đồ họa máy tính', 3, 70, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN3142   ', N'DHT011    ', N'Thực tập viết niên luận', 2, 100, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4012   ', N'DHT011    ', N'Thiết kế cơ sở dữ liệu', 2, 70, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4022   ', N'DHT011    ', N'Lập trình web', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4042   ', N'DHT011    ', N'Lý thuyết mật mã', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4062   ', N'DHT011    ', N'Phần mềm mã nguồn mở', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4072   ', N'DHT011    ', N'Phân tích và thiết kế thuật toán', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4092   ', N'DHT011    ', N'Độ phức tạp thuật toán', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4102   ', N'DHT011    ', N'Khai phá dữ liệu', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4112   ', N'DHT011    ', N'Hệ cơ sở dữ liệu phân tán', 2, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4122   ', N'DHT011    ', N'Ngôn ngữ mô hình hóa UML', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4132   ', N'DHT011    ', N'Quản trị dự án phần mềm', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4142   ', N'DHT011    ', N'Phân tích thiết kế hướng đối tượng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4152   ', N'DHT011    ', N'Lập trình hệ thống nhúng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4162   ', N'DHT011    ', N'Đặc tả hình thức', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4172   ', N'DHT011    ', N'Java và xử lý phân tán', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4182   ', N'DHT011    ', N'Kiểm định phần mềm', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4192   ', N'DHT011    ', N'Lập trình đa phương tiện', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4202   ', N'DHT011    ', N'Quy trình phát triển phần mềm RUP', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4212   ', N'DHT011    ', N'Xử lý ảnh số', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4232   ', N'DHT011    ', N'Hệ chuyên gia', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4242   ', N'DHT011    ', N'Lý thuyết nhận dạng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4262   ', N'DHT011    ', N'Lập trình logic', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4272   ', N'DHT011    ', N'Kỹ thuật vi xử lý', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4282   ', N'DHT011    ', N'Kỹ thuật truyền dữ liệu', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4292   ', N'DHT011    ', N'An toàn mạng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4302   ', N'DHT011    ', N'Quản trị mạng ', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4312   ', N'DHT011    ', N'Mạng không dây và di động', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4322   ', N'DHT011    ', N'Lập trình mạng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4352   ', N'DHT011    ', N'Đánh giá hiệu năng mạng', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4362   ', N'DHT011    ', N'Hệ điều hành LINUX', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4372   ', N'DHT011    ', N'Mạng truyền dẫn quang', 2, 60, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4382   ', N'DHT011    ', N'Thực tập chuyên ngành cuối khóa', 2, 100, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4398   ', N'DHT011    ', N'Khóa luận tốt nghiệp', 8, 100, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4483   ', N'DHT011    ', N'Xây dựng ứng dụng với .NET FrameWork', 3, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4583   ', N'DHT011    ', N'XML và ứng dụng', 3, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4683   ', N'DHT011    ', N'Các nền ứng dụng cho thiết bị di động', 3, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TIN4782   ', N'DHT011    ', N'Mô phỏng mạng với NS2', 2, 50, N'DHT01     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TLH1012   ', N'DHT011    ', N'Tâm lý học đại cương', 2, 60, N'DHT06     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA1012   ', N'DHT011    ', N'Cơ sở toán', 2, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA1023   ', N'DHT011    ', N'Đại số tuyến tính', 3, 60, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA1034   ', N'DHT011    ', N'Phép tính vi tích phân hàm một biến', 4, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA1043   ', N'DHT011    ', N'Phép tính vi phân hàm nhiều biến', 3, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA1052  ', N'DHT011    ', N'Phép tính tích phân hàm nhiều biến', 2, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA2023   ', N'DHT011    ', N'Xác suất thông kê', 3, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA2033   ', N'DHT011    ', N'Phương pháp tính', 3, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'TOA2072   ', N'DHT011    ', N'Phương trình vi phân', 2, 70, N'DHT03     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'VLY1012   ', N'DHT011    ', N'Vật lý đại cương 1', 2, 70, N'DHT04     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'VLY1022   ', N'DHT011    ', N'Vật lý đại cương 2', 2, 70, N'DHT04     ')
INSERT [dbo].[MonHoc] ([mamonhoc], [manganh], [tenmonhoc], [stc], [heso], [khoa]) VALUES (N'XHH1012   ', N'DHT011    ', N'Xã hội học đại cương', 2, 60, N'DHT05     ')
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1013', 1, 3, 70, CAST(0xDE370B00 AS Date), CAST(0x04380B00 AS Date), N'thứ 3[1-2],;thứ 5[1-2],;', 6.5, 6.5, 0, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1013', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.2, 6.2, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1013', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5.7, 5.7, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1022', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.4, 6.4, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1022', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5.5, 5.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1022', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5.4, 5.4, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1032', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5.3, 5.3, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1032', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4.9, 4.9, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'ANH1032', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4.8, 4.8, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1012', 1, 2, 60, CAST(0xDD370B00 AS Date), CAST(0x03380B00 AS Date), N'thứ 2[1-3],h307;', 7.5, 7, 0, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1012   ', 2, 2, 60, CAST(0xF3370B00 AS Date), CAST(0x8C380B00 AS Date), N'thứ 3[1-2],;', 0, 0, 0, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1012   ', 3, 2, 60, CAST(0xFF370B00 AS Date), CAST(0x96380B00 AS Date), N'thứ 2[1-1],;', 0, 0, 0, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1012', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 5.5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1012', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.5, 7.5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1013', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 8, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1013', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.3, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1013', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.5, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1022', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.8, 5.5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1022', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1022', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 3.5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1033', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4.5, 3.5, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1033', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 2.5, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'CTR1033', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.3, 8, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'LIS1022', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'LIS1022', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'LUA1012', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.3, 6, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN1013', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 9.8, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN1013', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 9.3, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN1013', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.5, 5.8, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN1042   ', 2, 2, 60, CAST(0xBE360B00 AS Date), CAST(0x8C380B00 AS Date), N'thứ 5[1-2],hgfhg;', 0, 7, 0, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2013', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 3, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2013', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2013', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2033', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.5, 6, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2033', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 6, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN2033', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 7, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3013', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 9, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3013', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 8.5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3013', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 5.5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3023', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 5.8, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3023', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5, 3.5, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3023', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 4.5, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3032', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 8.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3032', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.5, 5.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3032', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 9.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3042', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 6, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3042', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 2, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3042', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 4, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3053', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 8.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3053', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 6, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3053', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.8, 6, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3073', 1, 3, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3073', 4, 3, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.3, 9.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3073', 5, 3, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.3, 1, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3084', 1, 4, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 6.5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3084', 4, 4, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 5, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3084', 5, 4, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 3, 6, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3093', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.8, 5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3093', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 6, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3093', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.8, 7, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3102', 1, 2, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 2, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3102', 4, 2, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 3.3, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3102', 5, 2, 50, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 4, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3113', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 7.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3113', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 5.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3113', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 6.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3123', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 7, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3123', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4, 7, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3123', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 4, NULL, 5)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3133', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.3, 6, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3133', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3133', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 4, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3142', 1, 2, 100, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.5, 9.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3142', 4, 2, 100, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.5, 9.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN3142', 5, 2, 100, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.5, 9.5, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN4012', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 8, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN4012', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.7, 9, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TIN4012', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.7, 9, NULL, 6)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TLH1012', 5, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.9, 5.3, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1012', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 10, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1012', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.3, 9.5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1012', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1023', 1, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1023', 4, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 10, 9, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1023', 5, 3, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1034', 1, 4, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 6.5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1034', 4, 4, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.5, 8, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1034', 5, 4, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6, 8, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1043', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.7, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1043', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.7, 6.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1043', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1052', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 5, 6, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1052', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4.7, 6, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA1052', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.7, 2.5, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2023', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.3, 7, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2023', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7.3, 4, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2023', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 4, 4, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2033', 1, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 6.5, 4, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2033', 4, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 8.5, NULL, 4)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2033', 5, 3, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 3, NULL, 4)
GO
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2072', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2072', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 9.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'TOA2072', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7, NULL, 3)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1012', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 5, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1012', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9, 6, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1012', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7, NULL, 1)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1022', 1, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 8.5, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1022', 4, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8, 7, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'VLY1022', 5, 2, 70, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 7, 6, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'XHH1012', 1, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 9.5, 7, NULL, 2)
INSERT [dbo].[MonSinh] ([mamonhoc], [id], [stc], [heso], [batdau], [ketthuc], [thoikhoabieu], [diemquatrinh], [diemthi], [trangthai], [hocky]) VALUES (N'XHH1012', 4, 2, 60, CAST(0x00000000 AS Date), CAST(0x00000000 AS Date), NULL, 8.5, 7.5, NULL, 2)
INSERT [dbo].[Nganh] ([manganh], [tennganh], [gioithieu], [makhoa], [sonamdaotao], [khoabd]) VALUES (N'DHT011    ', N'Tin Học', NULL, N'DHT01', 4, 18)
INSERT [dbo].[SinhVien] ([id], [email], [matkhau], [hoten], [ngaysinh], [sodt], [gioitinh], [trangthai], [avatar], [diemconghien], [nienkhoa], [matruong], [makhoa], [manganh], [malop]) VALUES (1, N'michinin29@gmail.com', N'p54K11iuQyw=', N'Nguyễn Đông Nin', CAST(0xEA150B00 AS Date), NULL, 1, 1, N'ImagesAcc/Avatar/avatar-5.jpg', 0, N'3420102014', N'DHT       ', N'DHT01     ', N'DHT011    ', N'DHT01134B ')
INSERT [dbo].[SinhVien] ([id], [email], [matkhau], [hoten], [ngaysinh], [sodt], [gioitinh], [trangthai], [avatar], [diemconghien], [nienkhoa], [matruong], [makhoa], [manganh], [malop]) VALUES (2, N'nichinin25@yahoo.com', N'p54K11iuQyw=', N'Lê Thị Thương', CAST(0x2B1E0B00 AS Date), NULL, 0, 1, NULL, 0, N'3520132017', N'DHT       ', N'DHT01     ', N'DHT011    ', N'DHT01135A ')
INSERT [dbo].[SinhVien] ([id], [email], [matkhau], [hoten], [ngaysinh], [sodt], [gioitinh], [trangthai], [avatar], [diemconghien], [nienkhoa], [matruong], [makhoa], [manganh], [malop]) VALUES (3, N'nam@email.com', N'p54K11iuQyw=', N'nam', CAST(0x80390B00 AS Date), N'                    ', 1, 0, N'ImagesAcc/Avatar/100815noitieng36.jpg', 0, N'3420102014', N'DHT       ', N'DHT01     ', N'DHT011    ', N'DHT01134A ')
INSERT [dbo].[SinhVien] ([id], [email], [matkhau], [hoten], [ngaysinh], [sodt], [gioitinh], [trangthai], [avatar], [diemconghien], [nienkhoa], [matruong], [makhoa], [manganh], [malop]) VALUES (4, N'lioko119@gmail.com', N'p54K11iuQyw=', N'Bùi Tấn Kỷ', CAST(0x87190B00 AS Date), N'                    ', 1, 1, NULL, 0, N'3420102014', N'DHT       ', N'DHT01     ', N'DHT011    ', N'DHT01134B ')
INSERT [dbo].[SinhVien] ([id], [email], [matkhau], [hoten], [ngaysinh], [sodt], [gioitinh], [trangthai], [avatar], [diemconghien], [nienkhoa], [matruong], [makhoa], [manganh], [malop]) VALUES (5, N'ri@yahoo.com', N'p54K11iuQyw=', N'Ri', CAST(0xFD370B00 AS Date), N'                    ', 1, 0, NULL, 0, N'3420102014', N'DHT       ', N'DHT01     ', N'DHT011    ', N'DHT01134B ')
SET IDENTITY_INSERT [dbo].[sukiencanhan] ON 

INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (2, N'12345', N'', CAST(0x0000A29700107AC0 AS DateTime), CAST(0x0000A2970018B820 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (3, N'12345', N'', CAST(0x0000A29800107AC0 AS DateTime), CAST(0x0000A2980018B820 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (4, N'12345', N'', CAST(0x0000A2990018B820 AS DateTime), CAST(0x0000A2990020F580 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (5, N'12345', N'', CAST(0x0000A29A002932E0 AS DateTime), CAST(0x0000A29A00317040 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (6, N'12345', N'', CAST(0x0000A29B0020F580 AS DateTime), CAST(0x0000A29B002932E0 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (7, N'12345', N'', CAST(0x0000A29C0020F580 AS DateTime), CAST(0x0000A29C002932E0 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (8, N'1 2 3 4 5 6 7', N'', CAST(0x0000A2960041EB00 AS DateTime), CAST(0x0000A296004A2860 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (9, N'1 2 3 4 56 7', N'', CAST(0x0000A2970039ADA0 AS DateTime), CAST(0x0000A2970041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (10, N'1 2 3 4 56 7', N'', CAST(0x0000A2980039ADA0 AS DateTime), CAST(0x0000A2980041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (11, N'1 2 3 4 56 7', N'', CAST(0x0000A2990039ADA0 AS DateTime), CAST(0x0000A2990041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (12, N'1 2 3 4 56 7', N'', CAST(0x0000A29A0039ADA0 AS DateTime), CAST(0x0000A29A0041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (13, N'1 2 3 4 56 7', N'', CAST(0x0000A29B0039ADA0 AS DateTime), CAST(0x0000A29B0041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (14, N'1 2 3 4 56 7', N'', CAST(0x0000A29C0039ADA0 AS DateTime), CAST(0x0000A29C0041EB00 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (15, N'6465', N'', CAST(0x0000A296014159A0 AS DateTime), CAST(0x0000A29601499700 AS DateTime), N'', N'', 1)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (16, N'12345', N'', CAST(0x0000A29600083D60 AS DateTime), CAST(0x0000A29600107AC0 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (17, N'12345', N'', CAST(0x0000A2970018B820 AS DateTime), CAST(0x0000A2970020F580 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (19, N'12345', N'', CAST(0x0000A2990020F580 AS DateTime), CAST(0x0000A299002932E0 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (20, N'12345', N'', CAST(0x0000A29A0018B820 AS DateTime), CAST(0x0000A29A0020F580 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (21, N'12345', N'', CAST(0x0000A29B0018B820 AS DateTime), CAST(0x0000A29B0020F580 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (22, N'12345', N'', CAST(0x0000A29C0018B820 AS DateTime), CAST(0x0000A29C0020F580 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (28, N'12345', N'', CAST(0x0000A296002932E0 AS DateTime), CAST(0x0000A29600317040 AS DateTime), N'', N'', 2)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (29, N'12345', N'', CAST(0x0000A2970020F580 AS DateTime), CAST(0x0000A29700CDFE60 AS DateTime), N'', N'', 3)
INSERT [dbo].[sukiencanhan] ([ID], [tensukien], [noidung], [batdau], [ketthuc], [nguoithamgia], [diadiem], [SV_ID]) VALUES (30, N'456', N'', CAST(0x0000A2980018B820 AS DateTime), CAST(0x0000A29800C5C100 AS DateTime), N'', N'', 3)
SET IDENTITY_INSERT [dbo].[sukiencanhan] OFF
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHA       ', N'Khoa Luật', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHC       ', N'Khoa Giao Dục Thể Chức', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHD       ', N'Khoa Du Lịch', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHF       ', N'Đại Học Ngoài Ngữ', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHK       ', N'Đại Học Kinh Tế', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHL       ', N'Đại Học Nông Lâm', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHN       ', N'Đại Học Nghệ Thuật', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHQ       ', N'Đại Học Huế tại Quản Trị', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHS       ', N'Đại Học Sư Phạm', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHT       ', N'Đại Học Khoa Học', NULL, NULL, NULL)
INSERT [dbo].[Truong] ([matruong], [tentruong], [gioithieu], [sodt], [diachi]) VALUES (N'DHY       ', N'Đại Học Y Dược', NULL, NULL, NULL)
USE [master]
GO
ALTER DATABASE [manghoctap_new] SET  READ_WRITE 
GO
