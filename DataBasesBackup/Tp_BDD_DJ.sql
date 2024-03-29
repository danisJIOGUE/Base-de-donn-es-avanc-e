USE [master]
GO
/****** Object:  Database [GestionENSAE]    Script Date: 30/03/2020 18:56:21 ******/
CREATE DATABASE [GestionENSAE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestionENSAE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL_ITS4\MSSQL\DATA\GestionENSAE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionENSAE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL_ITS4\MSSQL\DATA\GestionENSAE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionENSAE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionENSAE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionENSAE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionENSAE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionENSAE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionENSAE] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionENSAE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GestionENSAE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionENSAE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionENSAE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionENSAE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionENSAE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionENSAE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionENSAE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionENSAE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionENSAE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestionENSAE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionENSAE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionENSAE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionENSAE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionENSAE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionENSAE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionENSAE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestionENSAE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestionENSAE] SET  MULTI_USER 
GO
ALTER DATABASE [GestionENSAE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionENSAE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestionENSAE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestionENSAE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [GestionENSAE]
GO
/****** Object:  Table [dbo].[absence]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absence](
	[code_abscence] [int] IDENTITY(1,1) NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[matricule] [int] NULL,
	[matricule_etudiant] [int] NULL,
	[date_abs] [date] NULL,
	[nombre_heure] [varchar](5) NULL,
	[id_user] [int] NULL,
	[date_suppression] [date] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_abscence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carnetNote]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carnetNote](
	[matricule_etudiant] [int] NOT NULL,
	[matricule] [int] NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[classe] [varchar](5) NOT NULL,
	[note] [int] NOT NULL,
	[idperiode] [varchar](20) NOT NULL,
	[idstatut_note] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule_etudiant] ASC,
	[matricule] ASC,
	[code_matiere] ASC,
	[classe] ASC,
	[note] ASC,
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classe]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classe](
	[classe] [varchar](5) NOT NULL,
	[code_filiere] [int] NOT NULL,
	[nom_classe] [varchar](100) NULL,
	[user_id] [int] NULL,
	[date_modification] [date] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classe_has_enseignant_has_matiere]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classe_has_enseignant_has_matiere](
	[classe] [varchar](5) NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[matricule] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classe] ASC,
	[code_matiere] ASC,
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classe_has_unite_enseignement]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classe_has_unite_enseignement](
	[classe] [varchar](5) NOT NULL,
	[code_ue] [varchar](80) NOT NULL,
	[volume_horaire] [int] NULL,
	[credit] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[classe] ASC,
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[connexion]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[connexion](
	[idcon] [int] IDENTITY(1,1) NOT NULL,
	[matricule] [int] NOT NULL,
	[pwd] [varchar](100) NOT NULL,
	[date_connexion] [varchar](20) NULL,
	[profil] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emploiTemps]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emploiTemps](
	[matricule] [int] NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[classe] [varchar](5) NOT NULL,
	[idheure] [varchar](20) NOT NULL,
	[code_jour] [varchar](20) NOT NULL,
	[code_salle] [varchar](20) NOT NULL,
	[idemplloiTemps] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule] ASC,
	[code_matiere] ASC,
	[classe] ASC,
	[idheure] ASC,
	[code_jour] ASC,
	[code_salle] ASC,
	[idemplloiTemps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enseignant]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enseignant](
	[matricule] [int] NOT NULL,
	[idcon] [int] NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NULL,
	[statut] [varchar](10) NULL,
	[pwd] [varchar](100) NULL,
	[adresse_mail] [varchar](50) NULL,
	[telephone] [int] NULL,
	[photo] [varchar](20) NULL,
	[id_user] [int] NULL,
	[date_suppression] [varchar](30) NULL,
	[est_supprime] [varchar](10) NULL,
	[date_connexion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enseignant_has_matiere]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enseignant_has_matiere](
	[matricule] [int] NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule] ASC,
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[est_evalué]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[est_evalué](
	[matricule_etudiant] [int] NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[note] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule_etudiant] ASC,
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etat_sante]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etat_sante](
	[code_etat] [int] IDENTITY(1,1) NOT NULL,
	[matricule] [int] NULL,
	[nom] [varchar](100) NULL,
	[prenom] [varchar](100) NULL,
	[nom_maladie] [varchar](100) NULL,
	[consultation] [varchar](5) NULL,
	[hospitalisation] [varchar](5) NULL,
	[duree_hospitalisation] [int] NULL,
	[duree_maladie] [int] NULL,
	[dateDebut] [varchar](10) NULL,
	[dateFin] [varchar](10) NULL,
	[justificatif] [varchar](100) NULL,
	[date_soumission] [varchar](50) NULL,
	[id_user] [int] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_etat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etudiant]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etudiant](
	[matricule_etudiant] [int] NOT NULL,
	[pwd] [varchar](100) NULL,
	[idcon] [int] NULL,
	[nom_etudiant] [varchar](100) NULL,
	[date_naissance_etud] [varchar](30) NULL,
	[statut] [varchar](20) NULL,
	[prenom_etd] [varchar](100) NULL,
	[classe] [varchar](5) NOT NULL,
	[photo_etudiant] [varchar](50) NULL,
	[nationalite_etud] [varchar](30) NULL,
	[adresse] [varchar](100) NULL,
	[premiere_inscription] [int] NULL,
	[date_connexion] [varchar](30) NULL,
	[id_user] [int] NULL,
	[date_modification] [varchar](30) NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filiere]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filiere](
	[code_filiere] [int] NOT NULL,
	[matricule_responsable] [int] NOT NULL,
	[nom_filiere] [varchar](255) NULL,
	[id_user] [int] NULL,
	[date_supprime] [date] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_filiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[heure]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[heure](
	[idheure] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[heure_has_jour]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[heure_has_jour](
	[idheure] [varchar](20) NOT NULL,
	[code_jour] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idheure] ASC,
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jour]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jour](
	[code_jour] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matiere]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matiere](
	[code_matiere] [varchar](80) NOT NULL,
	[libele] [varchar](100) NULL,
	[volume_horaire] [int] NOT NULL,
	[credit] [decimal](18, 0) NULL,
	[code_ue] [varchar](80) NOT NULL,
	[matricule] [int] NULL,
	[heure_eff] [int] NULL,
	[total_heure_eff] [int] NULL,
	[id_user] [int] NULL,
	[date_modification] [date] NULL,
	[est_supprime] [varchar](10) NULL,
	[date_mat] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[option_classe]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[option_classe](
	[code_option] [varchar](6) NOT NULL,
	[classe] [varchar](5) NOT NULL,
	[nom_option] [varchar](50) NULL,
	[id_user] [int] NULL,
	[date_modification] [varchar](10) NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_option] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periode]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periode](
	[idperiode] [varchar](20) NOT NULL,
	[id_user] [int] NULL,
	[date_suppression] [date] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[responsable]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsable](
	[matricule_responsable] [int] NOT NULL,
	[idcon] [int] NULL,
	[pwd] [varchar](100) NULL,
	[adresse_mail] [varchar](100) NULL,
	[prenom] [varchar](100) NULL,
	[nom] [varchar](50) NOT NULL,
	[statut] [varchar](10) NULL,
	[photo_resp] [varchar](20) NULL,
	[poste] [varchar](50) NOT NULL,
	[date_fonction] [varchar](30) NULL,
	[date_connexion] [varchar](30) NULL,
	[id_user] [int] NULL,
	[date_suppression] [varchar](30) NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[matricule_responsable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[retard]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retard](
	[id_retard] [int] IDENTITY(1,1) NOT NULL,
	[code_matiere] [varchar](80) NOT NULL,
	[matricule] [int] NULL,
	[matricule_etudiant] [int] NULL,
	[date_rtd] [varchar](10) NULL,
	[nombre_minute] [varchar](5) NULL,
	[id_user] [int] NULL,
	[date_suppression] [varchar](10) NULL,
	[est_supprime] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_retard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salle_cours]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salle_cours](
	[code_salle] [varchar](20) NOT NULL,
	[id_user] [int] NULL,
	[date_suppression] [varchar](20) NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_salle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salle_cours_has_heure_has_jour]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salle_cours_has_heure_has_jour](
	[code_salle] [varchar](20) NOT NULL,
	[code_jour] [varchar](20) NOT NULL,
	[idheure] [varchar](20) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code_salle] ASC,
	[code_jour] ASC,
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statut_note]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statut_note](
	[idstatut_note] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idstatut_note] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statut_note_has_periode]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statut_note_has_periode](
	[idstatut_note] [varchar](10) NOT NULL,
	[idperiode] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idstatut_note] ASC,
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unite_enseignement]    Script Date: 30/03/2020 18:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unite_enseignement](
	[code_ue] [varchar](80) NOT NULL,
	[libele_ue] [varchar](50) NULL,
	[id_user] [int] NULL,
	[date_suppression] [date] NULL,
	[est_supprime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (17101, 1000110, N'BDD', N'ITS3', 3, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (17121, 1000110, N'BDD', N'ITS3', 19, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (18106, 1000110, N'BDD', N'ITS3', 3, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19207, 1000110, N'BDD', N'ITS3', 0, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19214, 1000110, N'BDD', N'ITS3', 3, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19221, 1000110, N'BDD', N'ITS3', 7, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19228, 1000110, N'BDD', N'ITS3', 4, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19235, 1000110, N'BDD', N'ITS3', 16, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19242, 1000110, N'BDD', N'ITS3', 8, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19249, 1000110, N'BDD', N'ITS3', 1, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19256, 1000110, N'BDD', N'ITS3', 4, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19259, 1000110, N'BDD', N'ITS3', 5, N'semestre 1', N'note 1')
INSERT [dbo].[carnetNote] ([matricule_etudiant], [matricule], [code_matiere], [classe], [note], [idperiode], [idstatut_note]) VALUES (19266, 1000110, N'BDD', N'ITS3', 11, N'semestre 1', N'note 1')
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ISE1', 2, N'Ingénieur Statisticien Economiste1', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ISE2', 2, N'Ingénieur Statisticien Economiste2', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ISE3', 2, N'Ingénieur Statisticien Economiste3', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ITS1', 1, N'Ingénieur des Travaux Statistiques1', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ITS2', 1, N'Ingénieur des Travaux Statistiques2', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ITS3', 1, N'Ingénieur des Travaux Statistiques3', NULL, NULL, NULL)
INSERT [dbo].[classe] ([classe], [code_filiere], [nom_classe], [user_id], [date_modification], [est_supprime]) VALUES (N'ITS4', 1, N'Ingénieur des Travaux Statistiques4', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[classe_has_enseignant_has_matiere] ON 

INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE1', N'ang', 1901215, 7)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE1', N'compta_nat2', 1000110, 36)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE1', N'estim', 1001210, 19)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE1', N'theo_sond', 1000109, 30)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE2', N'AD', 1000109, 14)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE2', N'anthropo_eco', 1901203, 25)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE2', N'dm', 1500108, 8)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE2', N'inst_plo', 1811205, 37)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE2', N'log_enq', 1001212, 31)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE3', N'ang', 1811205, 26)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE3', N'dw', 1901203, 9)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE3', N'eco_incert', 1811205, 20)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ISE3', N'prat_enq', 1901215, 32)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS1', N'eco_pub', 1500108, 33)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS1', N'GR', 1901215, 15)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS1', N'SIG', 1811205, 4)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS1', N'tech_exp', 1001210, 27)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'com_inter', 1901203, 34)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'comp_macro', 1000109, 22)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'eml', 1000110, 28)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'FM', 1500108, 16)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'pw', 1001210, 10)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS2', N'suivi_eval', 1811205, 1)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'add2', 1001212, 23)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'BDD', 1000110, 11)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'manag', 1000109, 5)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'opti_dyn', 1901203, 17)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'varqual', 1001210, 2)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS3', N'varqual', 1811205, 29)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'ang', 1000109, 39)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'BD', 1811205, 12)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'macro_dyn', 1001210, 35)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'metho_rech', 1001212, 6)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'method_enq', 1901215, 24)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'prati_ana', 1000110, 3)
INSERT [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule], [id]) VALUES (N'ITS4', N'Theo_jeux', 1811205, 18)
SET IDENTITY_INSERT [dbo].[classe_has_enseignant_has_matiere] OFF
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'eco3', 80, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'eco4', 60, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'eco5', 90, CAST(7 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'econometrie', 90, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'info2', 30, CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'lang_exp3', 50, CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'lang_exp4', 50, CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'Maths_appli', 60, CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'science_soc', 40, CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'sond_pratique', 50, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'stat_maths', 90, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ISE2', N'stat3', 50, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'compl', 75, CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'eco7', 60, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'econometrie3', 30, CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'op1', 120, CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'op2', 120, CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'stat_appl', 45, CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[classe_has_unite_enseignement] ([classe], [code_ue], [volume_horaire], [credit]) VALUES (N'ITS4', N'theo_pratiq_enq', 30, CAST(3 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[connexion] ON 

INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (1, 16215, N'12345', NULL, N'DELEGUE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (2, 16203, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (3, 141202, N'123456', NULL, N'CHEF')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (4, 101201, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (5, 1811204, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (6, 1000110, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (7, 16214, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (8, 17205, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (9, 17121, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (10, 18106, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (11, 17101, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (12, 17110, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (13, 17210, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (14, 16216, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (15, 16223, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (16, 16207, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (17, 16213, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (18, 16210, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (19, 18215, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (20, 18120, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (21, 19200, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (22, 19201, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (23, 19202, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (24, 19203, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (25, 19204, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (26, 19205, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (27, 19206, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (28, 19207, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (29, 19208, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (30, 19209, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (31, 19210, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (32, 19211, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (33, 19212, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (34, 19213, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (35, 19214, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (36, 19215, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (37, 19216, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (38, 19217, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (39, 19218, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (40, 19219, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (41, 19220, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (42, 19221, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (43, 19222, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (44, 19223, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (45, 19224, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (46, 19225, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (47, 19226, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (48, 19227, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (49, 19228, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (50, 19229, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (51, 19230, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (52, 19231, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (53, 19232, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (54, 19233, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (55, 19234, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (56, 19235, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (57, 19236, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (58, 19237, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (59, 19238, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (60, 19239, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (61, 19240, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (62, 19241, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (63, 19242, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (64, 19243, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (65, 19244, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (66, 19245, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (67, 19246, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (68, 19247, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (69, 19248, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (70, 19249, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (71, 19250, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (72, 19251, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (73, 19252, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (74, 19253, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (75, 19254, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (76, 19255, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (77, 19256, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (78, 19257, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (79, 19258, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (80, 19259, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (81, 19260, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (82, 19261, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (83, 19262, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (84, 19263, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (85, 19264, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (86, 19265, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (87, 19266, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (88, 19267, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (89, 19268, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (90, 19269, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (91, 19270, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (92, 19271, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (93, 19272, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (94, 19273, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (95, 19274, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (96, 19275, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (97, 19276, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (98, 19277, N'12345', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (99, 19278, N'12345', NULL, N'SIMPLE')
GO
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (100, 1901203, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (101, 1811205, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (102, 1001210, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (103, 1000110, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (104, 1411205, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (105, 1000109, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (106, 1001212, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (107, 1901215, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (108, 1500108, N'1234567', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (109, 171201, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (110, 101202, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (111, 101203, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (112, 181204, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (113, 141205, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (114, 181206, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (115, 181207, N'123456', NULL, N'SIMPLE')
INSERT [dbo].[connexion] ([idcon], [matricule], [pwd], [date_connexion], [profil]) VALUES (116, 181208, N'123456', NULL, N'SIMPLE')
SET IDENTITY_INSERT [dbo].[connexion] OFF
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1000109, 1, N'FALL', N'Ndiack', N'Vacataire', N'1234567', NULL, NULL, N'duv.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1000110, 1, N'DIOP', N'Ibrahima', N'Vacataire', N'1234567', NULL, NULL, N'bance.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1001210, 1, N'NDIAYE', N'Baba', N'Vacataire', N'1234567', NULL, NULL, N'bance.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1001212, 1, N'NDIAYE', N'DOUDOU', N'Vacataire', N'1234567', NULL, NULL, N'duv.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1411204, 1, N'DIAKITE', N'Souleymane', N'Permanant', N'1234567', NULL, NULL, N'duv.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1500108, 1, N'DIOP', N'Djibrill', N'Vacataire', N'1234567', NULL, NULL, N'fofana.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1811205, 1, N'FOFANA', N'Souleymane', N'Permanant', N'1234567', NULL, NULL, N'bance.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1811210, 1, N'DIOP', N'Oumar', N'Permanant', N'1234567', NULL, NULL, N'bance.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1901203, 1, N'SOUADOU', N'Sakho', N'Vacataire', N'1234567', NULL, NULL, N'bance.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant] ([matricule], [idcon], [nom], [prenom], [statut], [pwd], [adresse_mail], [telephone], [photo], [id_user], [date_suppression], [est_supprime], [date_connexion]) VALUES (1901215, 1, N'SOUMARE', N'Oumar', N'Vacataire', N'1234567', NULL, NULL, N'fofana.png', NULL, NULL, N'NON', NULL)
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000109, N'AD')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001212, N'add2')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000109, N'ang')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'ang')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901215, N'ang')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901203, N'anthropo_eco')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'BD')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000110, N'BDD')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901203, N'com_inter')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000109, N'comp_macro')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000110, N'compta_nat2')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1500108, N'dm')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901203, N'dw')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'eco_incert')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1500108, N'eco_pub')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000110, N'eml')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001210, N'estim')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1500108, N'FM')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901215, N'GR')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'inst_plo')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001212, N'log_enq')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001210, N'macro_dyn')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000109, N'manag')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001212, N'metho_rech')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901215, N'method_enq')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901203, N'opti_dyn')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1901215, N'prat_enq')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000110, N'prati_ana')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001210, N'pw')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'SIG')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'suivi_eval')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001210, N'tech_exp')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'Theo_jeux')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1000109, N'theo_sond')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1001210, N'varqual')
INSERT [dbo].[enseignant_has_matiere] ([matricule], [code_matiere]) VALUES (1811205, N'varqual')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16203, N'12345', 1, N'BANCE', NULL, N'SIMPLE', N'Youssouf', N'ITS4', N'duv.png', N'BURKINABE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16207, N'12345', 1, N'DIALLO', NULL, N'SIMPLE', N'Khariratou', N'ITS4', N'bance.png', N'SENEGALAISE', N'Grand Dakar', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16210, N'12345', 1, N'GERALDO', NULL, N'SIMPLE', N'Warissat', N'ITS4', N'fofana.png', N'TOGOLAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16213, N'12345', 1, N'HAMADOU ABDOULAYE', NULL, N'SIMPLE', N'Aubin', N'ITS4', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16214, N'12345', 1, N'HABIBOU KASSOUM', NULL, N'SIMPLE', N'Ibrahim', N'ITS4', N'bance.png', N'NIGERIENNE', N'Medina', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16215, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'DELEGUE', N'Rikel Danis', N'ITS4', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16216, N'12345', 1, N'KAINDJE FONDJO', NULL, N'SIMPLE', N'Carelle Véronique', N'ITS4', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (16223, N'12345', 1, N'MEKUEKO WAJI', NULL, N'SIMPLE', N'Farell Ornella', N'ITS4', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (17101, N'12345', 1, N'ABENG AKONO', NULL, N'SIMPLE', N'Pancrace', N'ISE3', N'duv.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (17110, N'12345', 1, N'DZOUKOU HOMSI', NULL, N'SIMPLE', N'Cabrelle Lauriane', N'ISE2', N'bance.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (17121, N'12345', 1, N'MEMBOUP NGOUPAYOU', NULL, N'DELEGUE', N'Raimatou', N'ISE3', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (17205, N'12345', 1, N'BAMOUNI', NULL, N'SIMPLE', N'Jean Christophe', N'ITS3', N'fofana.png', N'BURKINABE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (17210, N'12345', 1, N'DOSSOU', NULL, N'SIMPLE', N'Audinet', N'ISE1', N'diakite.png', N'BENINOISE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (18106, N'12345', 1, N'HOUNSOU', NULL, N'SIMPLE', N'Daniel', N'ISE3', N'fofana.png', N'BENINOISE', N'Fass paillote', 2014, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (18120, N'12345', 1, N'KONGA', NULL, N'SIMPLE', N'Cathy', N'ISE2', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2018, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (18215, N'12345', 1, N'KEUSSA TCHINDA', NULL, N'SIMPLE', N'Danny Lamazone', N'ITS1', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19200, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ITS4', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19201, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ITS1', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19202, N'12345', 1, N'HABIBOU KASSOUM', NULL, N'SIMPLE', N'Ibrahim', N'ITS2', N'bance.png', N'NIGERIENNE', N'Medina', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19203, N'12345', 1, N'DJIFACK ZEBAZE', NULL, N'SIMPLE', N'Duverier', N'ITS3', N'diakite.png', N'CAMEROUNAISE', N'Fass paillote', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19204, N'12345', 1, N'BAMOUNI', NULL, N'SIMPLE', N'Jean Christophe', N'ITS4', N'fofana.png', N'BURKINABE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19205, N'12345', 1, N'BANCE', NULL, N'SIMPLE', N'Youssouf', N'ISE1', N'duv.png', N'BURKINABE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19206, N'12345', 1, N'NANA NANA', NULL, N'SIMPLE', N'Bruce Wife', N'ISE2', N'bance.png', N'CAMEROUNAISE', N'Sacre cœur', 2015, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19207, N'12345', 1, N'MEMBOUP NGOUPAYOU', NULL, N'SIMPLE', N'Raimatou', N'ISE3', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19208, N'12345', 1, N'HOUNSOU', NULL, N'SIMPLE', N'Daniel', N'ITS1', N'fofana.png', N'BENINOISE', N'Fass paillote', 2014, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19209, N'12345', 1, N'ABENG AKONO', NULL, N'SIMPLE', N'Pancrace', N'ITS2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19210, N'12345', 1, N'DZOUKOU HOMSI', NULL, N'SIMPLE', N'Cabrelle Lauriane', N'ITS3', N'bance.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19211, N'12345', 1, N'DOSSOU', NULL, N'SIMPLE', N'Audinet', N'ITS4', N'diakite.png', N'BENINOISE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19212, N'12345', 1, N'KAINDJE FONDJO', NULL, N'SIMPLE', N'Carelle Véronique', N'ISE1', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19213, N'12345', 1, N'MEKUEKO WAJI', NULL, N'SIMPLE', N'Farell Ornella', N'ISE2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19214, N'12345', 1, N'DIALLO', NULL, N'SIMPLE', N'Khariratou', N'ISE3', N'bance.png', N'SENEGALAISE', N'Grand Dakar', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19215, N'12345', 1, N'HAMADOU ABDOULAYE', NULL, N'SIMPLE', N'Aubin', N'ITS1', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19216, N'12345', 1, N'GERALDO', NULL, N'SIMPLE', N'Warissat', N'ITS2', N'fofana.png', N'TOGOLAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19217, N'12345', 1, N'KEUSSA TCHINDA', NULL, N'SIMPLE', N'Danny Lamazone', N'ITS3', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19218, N'12345', 1, N'TEUDJA', NULL, N'SIMPLE', N'Maiva', N'ITS4', N'bance.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19219, N'12345', 1, N'THIERRY', NULL, N'SIMPLE', N'Brice', N'ISE1', N'diakite.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19220, N'12345', 1, N'KONGA', NULL, N'SIMPLE', N'Cathy', N'ISE2', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2018, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19221, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ISE3', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19222, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ITS1', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19223, N'12345', 1, N'HABIBOU KASSOUM', NULL, N'SIMPLE', N'Ibrahim', N'ITS2', N'bance.png', N'NIGERIENNE', N'Medina', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19224, N'12345', 1, N'DJIFACK ZEBAZE', NULL, N'SIMPLE', N'Duverier', N'ITS3', N'diakite.png', N'CAMEROUNAISE', N'Fass paillote', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19225, N'12345', 1, N'BAMOUNI', NULL, N'SIMPLE', N'Jean Christophe', N'ITS4', N'fofana.png', N'BURKINABE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19226, N'12345', 1, N'BANCE', NULL, N'SIMPLE', N'Youssouf', N'ISE1', N'duv.png', N'BURKINABE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19227, N'12345', 1, N'NANA NANA', NULL, N'SIMPLE', N'Bruce Wife', N'ISE2', N'bance.png', N'CAMEROUNAISE', N'Sacre cœur', 2015, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19228, N'12345', 1, N'MEMBOUP NGOUPAYOU', NULL, N'SIMPLE', N'Raimatou', N'ISE3', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19229, N'12345', 1, N'HOUNSOU', NULL, N'SIMPLE', N'Daniel', N'ITS1', N'fofana.png', N'BENINOISE', N'Fass paillote', 2014, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19230, N'12345', 1, N'ABENG AKONO', NULL, N'SIMPLE', N'Pancrace', N'ITS2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19231, N'12345', 1, N'DZOUKOU HOMSI', NULL, N'SIMPLE', N'Cabrelle Lauriane', N'ITS3', N'bance.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19232, N'12345', 1, N'DOSSOU', NULL, N'SIMPLE', N'Audinet', N'ITS4', N'diakite.png', N'BENINOISE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19233, N'12345', 1, N'KAINDJE FONDJO', NULL, N'SIMPLE', N'Carelle Véronique', N'ISE1', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19234, N'12345', 1, N'MEKUEKO WAJI', NULL, N'SIMPLE', N'Farell Ornella', N'ISE2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19235, N'12345', 1, N'DIALLO', NULL, N'SIMPLE', N'Khariratou', N'ISE3', N'bance.png', N'SENEGALAISE', N'Grand Dakar', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19236, N'12345', 1, N'HAMADOU ABDOULAYE', NULL, N'SIMPLE', N'Aubin', N'ITS1', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19237, N'12345', 1, N'GERALDO', NULL, N'SIMPLE', N'Warissat', N'ITS2', N'fofana.png', N'TOGOLAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19238, N'12345', 1, N'KEUSSA TCHINDA', NULL, N'SIMPLE', N'Danny Lamazone', N'ITS3', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19239, N'12345', 1, N'TEUDJA', NULL, N'SIMPLE', N'Maiva', N'ITS4', N'bance.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19240, N'12345', 1, N'THIERRY', NULL, N'SIMPLE', N'Brice', N'ISE1', N'diakite.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19241, N'12345', 1, N'KONGA', NULL, N'SIMPLE', N'Cathy', N'ISE2', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2018, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19242, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ISE3', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19243, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ITS1', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19244, N'12345', 1, N'HABIBOU KASSOUM', NULL, N'SIMPLE', N'Ibrahim', N'ITS2', N'bance.png', N'NIGERIENNE', N'Medina', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19245, N'12345', 1, N'DJIFACK ZEBAZE', NULL, N'SIMPLE', N'Duverier', N'ITS3', N'diakite.png', N'CAMEROUNAISE', N'Fass paillote', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19246, N'12345', 1, N'BAMOUNI', NULL, N'SIMPLE', N'Jean Christophe', N'ITS4', N'fofana.png', N'BURKINABE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19247, N'12345', 1, N'BANCE', NULL, N'SIMPLE', N'Youssouf', N'ISE1', N'duv.png', N'BURKINABE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19248, N'12345', 1, N'NANA NANA', NULL, N'SIMPLE', N'Bruce Wife', N'ISE2', N'bance.png', N'CAMEROUNAISE', N'Sacre cœur', 2015, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19249, N'12345', 1, N'MEMBOUP NGOUPAYOU', NULL, N'SIMPLE', N'Raimatou', N'ISE3', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19250, N'12345', 1, N'HOUNSOU', NULL, N'SIMPLE', N'Daniel', N'ITS1', N'fofana.png', N'BENINOISE', N'Fass paillote', 2014, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19251, N'12345', 1, N'ABENG AKONO', NULL, N'SIMPLE', N'Pancrace', N'ITS2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19252, N'12345', 1, N'DZOUKOU HOMSI', NULL, N'SIMPLE', N'Cabrelle Lauriane', N'ITS3', N'bance.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19253, N'12345', 1, N'DOSSOU', NULL, N'SIMPLE', N'Audinet', N'ITS4', N'diakite.png', N'BENINOISE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19254, N'12345', 1, N'KAINDJE FONDJO', NULL, N'SIMPLE', N'Carelle Véronique', N'ISE1', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19255, N'12345', 1, N'MEKUEKO WAJI', NULL, N'SIMPLE', N'Farell Ornella', N'ISE2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19256, N'12345', 1, N'DIALLO', NULL, N'SIMPLE', N'Khariratou', N'ISE3', N'bance.png', N'SENEGALAISE', N'Grand Dakar', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19257, N'12345', 1, N'HAMADOU ABDOULAYE', NULL, N'SIMPLE', N'Aubin', N'ITS1', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19258, N'12345', 1, N'GERALDO', NULL, N'SIMPLE', N'Warissat', N'ITS2', N'fofana.png', N'TOGOLAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19259, N'12345', 1, N'KEUSSA TCHINDA', NULL, N'SIMPLE', N'Danny Lamazone', N'ITS3', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19260, N'12345', 1, N'TEUDJA', NULL, N'SIMPLE', N'Maiva', N'ITS4', N'bance.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19261, N'12345', 1, N'THIERRY', NULL, N'SIMPLE', N'Brice', N'ISE1', N'diakite.png', N'CAMEROUNAISE', N'Grand Dakar', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19262, N'12345', 1, N'KONGA', NULL, N'SIMPLE', N'Cathy', N'ISE2', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2018, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19263, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ISE3', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19264, N'12345', 1, N'JIOGUE TAMATIO', NULL, N'SIMPLE', N'Rikel Danis', N'ITS1', N'duv.png', N'CAMEROUNAISE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19265, N'12345', 1, N'HABIBOU KASSOUM', NULL, N'SIMPLE', N'Ibrahim', N'ITS2', N'bance.png', N'NIGERIENNE', N'Medina', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19266, N'12345', 1, N'DJIFACK ZEBAZE', NULL, N'SIMPLE', N'Duverier', N'ITS3', N'diakite.png', N'CAMEROUNAISE', N'Fass paillote', 2019, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19267, N'12345', 1, N'BAMOUNI', NULL, N'SIMPLE', N'Jean Christophe', N'ITS4', N'fofana.png', N'BURKINABE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19268, N'12345', 1, N'BANCE', NULL, N'SIMPLE', N'Youssouf', N'ISE1', N'duv.png', N'BURKINABE', N'Fass paillote', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19269, N'12345', 1, N'NANA NANA', NULL, N'SIMPLE', N'Bruce Wife', N'ISE2', N'bance.png', N'CAMEROUNAISE', N'Sacre cœur', 2015, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19270, N'12345', 1, N'MEMBOUP NGOUPAYOU', NULL, N'SIMPLE', N'Raimatou', N'ISE3', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19271, N'12345', 1, N'HOUNSOU', NULL, N'SIMPLE', N'Daniel', N'ITS1', N'fofana.png', N'BENINOISE', N'Fass paillote', 2014, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19272, N'12345', 1, N'ABENG AKONO', NULL, N'SIMPLE', N'Pancrace', N'ITS2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19273, N'12345', 1, N'DZOUKOU HOMSI', NULL, N'SIMPLE', N'Cabrelle Lauriane', N'ITS3', N'bance.png', N'CAMEROUNAISE', N'HLM', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19274, N'12345', 1, N'DOSSOU', NULL, N'SIMPLE', N'Audinet', N'ITS4', N'diakite.png', N'BENINOISE', N'Fass paillote', 2017, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19275, N'12345', 1, N'KAINDJE FONDJO', NULL, N'SIMPLE', N'Carelle Véronique', N'ISE1', N'fofana.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19276, N'12345', 1, N'MEKUEKO WAJI', NULL, N'SIMPLE', N'Farell Ornella', N'ISE2', N'duv.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19277, N'12345', 1, N'DIALLO', NULL, N'SIMPLE', N'Khariratou', N'ISE3', N'bance.png', N'SENEGALAISE', N'Grand Dakar', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[etudiant] ([matricule_etudiant], [pwd], [idcon], [nom_etudiant], [date_naissance_etud], [statut], [prenom_etd], [classe], [photo_etudiant], [nationalite_etud], [adresse], [premiere_inscription], [date_connexion], [id_user], [date_modification], [est_supprime]) VALUES (19278, N'12345', 1, N'HAMADOU ABDOULAYE', NULL, N'SIMPLE', N'Aubin', N'ITS1', N'diakite.png', N'CAMEROUNAISE', N'HLM', 2016, NULL, NULL, NULL, N'NON')
INSERT [dbo].[filiere] ([code_filiere], [matricule_responsable], [nom_filiere], [id_user], [date_supprime], [est_supprime]) VALUES (1, 101202, N'Ingénieur des Travaux Statistiques', NULL, NULL, NULL)
INSERT [dbo].[filiere] ([code_filiere], [matricule_responsable], [nom_filiere], [id_user], [date_supprime], [est_supprime]) VALUES (2, 181204, N'Ingénieur Statisticien Economiste', NULL, NULL, NULL)
INSERT [dbo].[heure] ([idheure]) VALUES (N'08h - 10h')
INSERT [dbo].[heure] ([idheure]) VALUES (N'10h15 - 12h15')
INSERT [dbo].[heure] ([idheure]) VALUES (N'14h30 - 16h30')
INSERT [dbo].[heure] ([idheure]) VALUES (N'16h45 - 18h45')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'JEUDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'JEUDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'14h30 - 16h30', N'JEUDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'16h45 - 18h45', N'JEUDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'LUNDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'LUNDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'14h30 - 16h30', N'LUNDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'16h45 - 18h45', N'LUNDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'MARDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'MARDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'14h30 - 16h30', N'MARDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'16h45 - 18h45', N'MARDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'MERCREDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'MERCREDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'SAMEDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'SAMEDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'08h - 10h', N'VENDREDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'10h15 - 12h15', N'VENDREDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'14h30 - 16h30', N'VENDREDI')
INSERT [dbo].[heure_has_jour] ([idheure], [code_jour]) VALUES (N'16h45 - 18h45', N'VENDREDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'JEUDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'LUNDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'MARDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'MERCREDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'SAMEDI')
INSERT [dbo].[jour] ([code_jour]) VALUES (N'VENDREDI')
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'AD', N'audit', 20, CAST(1 AS Decimal(18, 0)), N'op2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'add1', N'analyse de données 1', 20, CAST(2 AS Decimal(18, 0)), N'stat2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'add2', N'analyse des données 2', 20, CAST(2 AS Decimal(18, 0)), N'stat3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'AF', N'analyse financière', 20, CAST(1 AS Decimal(18, 0)), N'op2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'alg', N'Algèbre ', 60, CAST(5 AS Decimal(18, 0)), N'Maths1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'algo_prog', N'algorithme et programmation', 40, CAST(3 AS Decimal(18, 0)), N'info1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'ana_fonct', N'Analyse fonctionnelle', 30, CAST(3 AS Decimal(18, 0)), N'Maths1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'ana_ser_temp', N'analyse descriptive des séries temporelles', 20, CAST(2 AS Decimal(18, 0)), N'stat2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'ang', N'anglais', 30, CAST(2 AS Decimal(18, 0)), N'compl', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'anthropo_eco', N'anthropologie économique', 20, CAST(2 AS Decimal(18, 0)), N'science_soc', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'BD', N'Big Data', 20, CAST(2 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'BDD', N'base de données avancées', 20, CAST(2 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'bdd_si', N'base de données et système dinformation', 30, CAST(2 AS Decimal(18, 0)), N'info2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'cacl_int_diff', N'Calcul intégral et différentiel ', 50, CAST(5 AS Decimal(18, 0)), N'Maths2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'calc_scien', N'Calcul scientifique', 30, CAST(2 AS Decimal(18, 0)), N'Maths1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'com_inter', N'commerce international', 20, CAST(2 AS Decimal(18, 0)), N'eco4', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'comp_macro', N'comportements macroéconomiques', 30, CAST(3 AS Decimal(18, 0)), N'eco3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'compta_ent', N'comptabilité des entreprises', 40, CAST(3 AS Decimal(18, 0)), N'Eco1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'compta_nat', N'comptabilité nationale I', 30, CAST(3 AS Decimal(18, 0)), N'eco2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'compta_nat2', N'comptabilité nationale II', 30, CAST(2 AS Decimal(18, 0)), N'eco5', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'Comptbanc', N'comptabilité bancaire', 20, CAST(2 AS Decimal(18, 0)), N'op2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'concu_imp', N'concurrence imparfaite', 20, CAST(2 AS Decimal(18, 0)), N'eco3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'conv_opti', N'convexité et optimisation', 40, CAST(3 AS Decimal(18, 0)), N'Maths2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'demo', N'demographie', 20, CAST(2 AS Decimal(18, 0)), N'science_soc', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'dm', N'dataMining', 20, CAST(2 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'dw', N'data ware house', 20, CAST(1 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'eco_dvp', N'economie du developpement', 20, CAST(2 AS Decimal(18, 0)), N'eco4', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'eco_incert', N'economie de lincertain et de linformation', 30, CAST(3 AS Decimal(18, 0)), N'eco3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'eco_pub', N'economie publique', 20, CAST(2 AS Decimal(18, 0)), N'eco4', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'eml', N'econometrie du modèle linéaire', 30, CAST(3 AS Decimal(18, 0)), N'econometrie', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'env_info_TIC', N'environnement informatique et TIC', 30, CAST(2 AS Decimal(18, 0)), N'info1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'estim', N'estimation', 50, CAST(4 AS Decimal(18, 0)), N'stat_maths', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'exp_eco', N'exposé économie', 20, CAST(3 AS Decimal(18, 0)), N'eco2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'FM', N'finance des marchés', 20, CAST(2 AS Decimal(18, 0)), N'op2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'GR', N'geston des risques', 20, CAST(1 AS Decimal(18, 0)), N'op2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'hist_pens_eco', N'histoire de la pensée économique', 30, CAST(3 AS Decimal(18, 0)), N'Eco1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'ind_stat', N'indices statistiques', 20, CAST(2 AS Decimal(18, 0)), N'stat2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'inst_plo', N'institution politique monétaires', 20, CAST(2 AS Decimal(18, 0)), N'eco5', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'Intro_ana_eco', N'Introduction à lanalyse économique', 30, CAST(4 AS Decimal(18, 0)), N'Eco1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'log_enq', N'logiciels denquêtes', 20, CAST(2 AS Decimal(18, 0)), N'sond_pratique', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'macro', N'macroéconomie', 40, CAST(4 AS Decimal(18, 0)), N'eco2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'macro_dyn', N'macroéconomie dynamique', 40, CAST(3 AS Decimal(18, 0)), N'eco5', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'manag', N'introduction au management', 30, CAST(2 AS Decimal(18, 0)), N'compl', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'metho_rech', N'méthodologie de la recherche', 15, CAST(1 AS Decimal(18, 0)), N'compl', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'method_enq', N'méthodologie denquêtes', 30, CAST(3 AS Decimal(18, 0)), N'stat3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'micro', N'microéconomie', 40, CAST(4 AS Decimal(18, 0)), N'eco2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'opti_dyn', N'optimisation dynamique', 60, CAST(5 AS Decimal(18, 0)), N'Maths_appli', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'OSS', N'Organisation du système statistique', 15, CAST(2 AS Decimal(18, 0)), N'stat_appl', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'pb_eco_compt', N'problème économique contemporains', 40, CAST(4 AS Decimal(18, 0)), N'Eco1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'po_eco', N'politique économique', 30, CAST(3 AS Decimal(18, 0)), N'eco7', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'prat_enq', N'pratique des enquêtes', 20, CAST(1 AS Decimal(18, 0)), N'sond_pratique', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'prati_ana', N'pratique des enquêtes III analyse', 30, CAST(3 AS Decimal(18, 0)), N'theo_pratiq_enq', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'pw', N'programmation web', 20, CAST(2 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'sertemp', N'econometrie des series temporelles', 30, CAST(3 AS Decimal(18, 0)), N'econometrie', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'SIG', N'système dinformation géographique', 30, CAST(3 AS Decimal(18, 0)), N'stat_appl', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'stat_desc', N'statistique descriptive', 40, CAST(5 AS Decimal(18, 0)), N'stat1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'suivi_eval', N'suivi evaluation', 30, CAST(3 AS Decimal(18, 0)), N'eco7', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'tech_exp', N'technique et expression', 20, CAST(1 AS Decimal(18, 0)), N'lang_exp3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'Theo_jeux', N'Théorie des jeux', 30, CAST(3 AS Decimal(18, 0)), N'Maths_appli', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'theo_mes', N'theorie de la mesure', 30, CAST(2 AS Decimal(18, 0)), N'Maths2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'theo_probas', N'théorie des probabilités', 50, CAST(4 AS Decimal(18, 0)), N'probas', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'theo_sond', N'theorie des sondages', 30, CAST(3 AS Decimal(18, 0)), N'sond_pratique', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'theo_test', N'théorie des tests', 40, CAST(4 AS Decimal(18, 0)), N'stat_maths', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'topo', N'Topologie ', 40, CAST(4 AS Decimal(18, 0)), N'Maths2', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'tp_dw', N'tp data ware house', 20, CAST(1 AS Decimal(18, 0)), N'op1', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[matiere] ([code_matiere], [libele], [volume_horaire], [credit], [code_ue], [matricule], [heure_eff], [total_heure_eff], [id_user], [date_modification], [est_supprime], [date_mat]) VALUES (N'varqual', N'econometrie des variables qualitatives', 30, CAST(3 AS Decimal(18, 0)), N'econometrie3', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[option_classe] ([code_option], [classe], [nom_option], [id_user], [date_modification], [est_supprime]) VALUES (N'ISE3-1', N'ISE3', N'Evaluation Politique Publiques', NULL, NULL, NULL)
INSERT [dbo].[option_classe] ([code_option], [classe], [nom_option], [id_user], [date_modification], [est_supprime]) VALUES (N'ISE3-2', N'ISE3', N'Statistique Bayesien', NULL, NULL, NULL)
INSERT [dbo].[option_classe] ([code_option], [classe], [nom_option], [id_user], [date_modification], [est_supprime]) VALUES (N'ITS4-1', N'ITS4', N'Statistique Informatique', NULL, NULL, NULL)
INSERT [dbo].[option_classe] ([code_option], [classe], [nom_option], [id_user], [date_modification], [est_supprime]) VALUES (N'ITS4-2', N'ITS4', N'Option finance', NULL, NULL, NULL)
INSERT [dbo].[periode] ([idperiode], [id_user], [date_suppression], [est_supprime]) VALUES (N'semestre 1', NULL, NULL, NULL)
INSERT [dbo].[periode] ([idperiode], [id_user], [date_suppression], [est_supprime]) VALUES (N'semestre 2', NULL, NULL, NULL)
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (101202, 1, N'123456', NULL, N'Souleymane', N'DANSOKHO', N'SIMPLE', N'diakite.png', N'Chargé des études', N'2010', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (101203, 1, N'123456', NULL, N'Souleymane', N'FOFANA', N'CHEF', N'diakite.png', N'Responsable filiaire', N'2010', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (141202, 1, N'123456', NULL, N'Oumar', N'SENE', N'SIMPLE', N'diakite.png', N'Chargé des etudes', N'2018', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (141205, 1, N'123456', NULL, N'Souleymane', N'DIAKITE', N'SIMPLE', N'diakite.png', N'Enseignant Premanent', N'2014', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (171201, 1, N'123456', NULL, N'Abdou', N'DIOUF', N'SIMPLE', N'diakite.png', N'Directeur', N'2017', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (181204, 1, N'123456', NULL, N'Idrissa', N'DIAGNE', N'CHEF', N'diakite.png', N'Responsable filiaire', N'2018', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (181206, 1, N'123456', NULL, N'Oumar', N'DIOP', N'SIMPLE', N'diakite.png', N'Enseignant Premanent', N'2018', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (181207, 1, N'123456', NULL, N'Souleymane', N'BALDE', N'SIMPLE', N'diakite.png', N'Enseignant Premanent', N'2018', NULL, NULL, NULL, N'NON')
INSERT [dbo].[responsable] ([matricule_responsable], [idcon], [pwd], [adresse_mail], [prenom], [nom], [statut], [photo_resp], [poste], [date_fonction], [date_connexion], [id_user], [date_suppression], [est_supprime]) VALUES (181208, 1, N'123456', NULL, N'Oumar', N'SENE', N'SIMPLE', N'diakite.png', N'Chargé des etudes', N'2018', NULL, NULL, NULL, N'NON')
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 1 niveau 5', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 1 niveau 6', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 1 niveau 7', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 2 niveau 5', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 2 niveau 6', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 2 niveau 7', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 3 niveau 5', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 3 niveau 6', NULL, NULL, NULL)
INSERT [dbo].[salle_cours] ([code_salle], [id_user], [date_suppression], [est_supprime]) VALUES (N'Salle 3 niveau 7', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[salle_cours_has_heure_has_jour] ON 

INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'JEUDI', N'08h - 10h', 91)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'JEUDI', N'10h15 - 12h15', 100)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'JEUDI', N'14h30 - 16h30', 109)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'JEUDI', N'16h45 - 18h45', 118)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'LUNDI', N'08h - 10h', 1)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'LUNDI', N'10h15 - 12h15', 10)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'LUNDI', N'14h30 - 16h30', 19)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'LUNDI', N'16h45 - 18h45', 28)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MARDI', N'08h - 10h', 37)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MARDI', N'10h15 - 12h15', 46)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MARDI', N'14h30 - 16h30', 55)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MARDI', N'16h45 - 18h45', 64)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MERCREDI', N'08h - 10h', 73)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'MERCREDI', N'10h15 - 12h15', 82)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'SAMEDI', N'08h - 10h', 163)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'SAMEDI', N'10h15 - 12h15', 172)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'VENDREDI', N'08h - 10h', 127)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'VENDREDI', N'10h15 - 12h15', 136)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'VENDREDI', N'14h30 - 16h30', 145)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 5', N'VENDREDI', N'16h45 - 18h45', 154)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'JEUDI', N'08h - 10h', 94)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'JEUDI', N'10h15 - 12h15', 103)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'JEUDI', N'14h30 - 16h30', 112)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'JEUDI', N'16h45 - 18h45', 121)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'LUNDI', N'08h - 10h', 4)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'LUNDI', N'10h15 - 12h15', 13)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'LUNDI', N'14h30 - 16h30', 22)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'LUNDI', N'16h45 - 18h45', 31)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MARDI', N'08h - 10h', 40)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MARDI', N'10h15 - 12h15', 49)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MARDI', N'14h30 - 16h30', 58)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MARDI', N'16h45 - 18h45', 67)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MERCREDI', N'08h - 10h', 76)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'MERCREDI', N'10h15 - 12h15', 85)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'SAMEDI', N'08h - 10h', 166)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'SAMEDI', N'10h15 - 12h15', 175)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'VENDREDI', N'08h - 10h', 130)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'VENDREDI', N'10h15 - 12h15', 139)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'VENDREDI', N'14h30 - 16h30', 148)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 6', N'VENDREDI', N'16h45 - 18h45', 157)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'JEUDI', N'08h - 10h', 97)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'JEUDI', N'10h15 - 12h15', 106)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'JEUDI', N'14h30 - 16h30', 115)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'JEUDI', N'16h45 - 18h45', 124)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'LUNDI', N'08h - 10h', 7)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'LUNDI', N'10h15 - 12h15', 16)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'LUNDI', N'14h30 - 16h30', 25)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'LUNDI', N'16h45 - 18h45', 34)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MARDI', N'08h - 10h', 43)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MARDI', N'10h15 - 12h15', 52)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MARDI', N'14h30 - 16h30', 61)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MARDI', N'16h45 - 18h45', 70)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MERCREDI', N'08h - 10h', 79)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'MERCREDI', N'10h15 - 12h15', 88)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'SAMEDI', N'08h - 10h', 169)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'SAMEDI', N'10h15 - 12h15', 178)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'VENDREDI', N'08h - 10h', 133)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'VENDREDI', N'10h15 - 12h15', 142)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'VENDREDI', N'14h30 - 16h30', 151)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 1 niveau 7', N'VENDREDI', N'16h45 - 18h45', 160)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'JEUDI', N'08h - 10h', 92)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'JEUDI', N'10h15 - 12h15', 101)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'JEUDI', N'14h30 - 16h30', 110)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'JEUDI', N'16h45 - 18h45', 119)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'LUNDI', N'08h - 10h', 2)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'LUNDI', N'10h15 - 12h15', 11)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'LUNDI', N'14h30 - 16h30', 20)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'LUNDI', N'16h45 - 18h45', 29)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MARDI', N'08h - 10h', 38)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MARDI', N'10h15 - 12h15', 47)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MARDI', N'14h30 - 16h30', 56)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MARDI', N'16h45 - 18h45', 65)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MERCREDI', N'08h - 10h', 74)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'MERCREDI', N'10h15 - 12h15', 83)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'SAMEDI', N'08h - 10h', 164)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'SAMEDI', N'10h15 - 12h15', 173)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'VENDREDI', N'08h - 10h', 128)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'VENDREDI', N'10h15 - 12h15', 137)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'VENDREDI', N'14h30 - 16h30', 146)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 5', N'VENDREDI', N'16h45 - 18h45', 155)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'JEUDI', N'08h - 10h', 95)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'JEUDI', N'10h15 - 12h15', 104)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'JEUDI', N'14h30 - 16h30', 113)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'JEUDI', N'16h45 - 18h45', 122)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'LUNDI', N'08h - 10h', 5)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'LUNDI', N'10h15 - 12h15', 14)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'LUNDI', N'14h30 - 16h30', 23)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'LUNDI', N'16h45 - 18h45', 32)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MARDI', N'08h - 10h', 41)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MARDI', N'10h15 - 12h15', 50)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MARDI', N'14h30 - 16h30', 59)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MARDI', N'16h45 - 18h45', 68)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MERCREDI', N'08h - 10h', 77)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'MERCREDI', N'10h15 - 12h15', 86)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'SAMEDI', N'08h - 10h', 167)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'SAMEDI', N'10h15 - 12h15', 176)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'VENDREDI', N'08h - 10h', 131)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'VENDREDI', N'10h15 - 12h15', 140)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'VENDREDI', N'14h30 - 16h30', 149)
GO
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 6', N'VENDREDI', N'16h45 - 18h45', 158)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'JEUDI', N'08h - 10h', 98)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'JEUDI', N'10h15 - 12h15', 107)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'JEUDI', N'14h30 - 16h30', 116)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'JEUDI', N'16h45 - 18h45', 125)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'LUNDI', N'08h - 10h', 8)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'LUNDI', N'10h15 - 12h15', 17)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'LUNDI', N'14h30 - 16h30', 26)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'LUNDI', N'16h45 - 18h45', 35)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MARDI', N'08h - 10h', 44)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MARDI', N'10h15 - 12h15', 53)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MARDI', N'14h30 - 16h30', 62)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MARDI', N'16h45 - 18h45', 71)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MERCREDI', N'08h - 10h', 80)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'MERCREDI', N'10h15 - 12h15', 89)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'SAMEDI', N'08h - 10h', 170)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'SAMEDI', N'10h15 - 12h15', 179)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'VENDREDI', N'08h - 10h', 134)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'VENDREDI', N'10h15 - 12h15', 143)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'VENDREDI', N'14h30 - 16h30', 152)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 2 niveau 7', N'VENDREDI', N'16h45 - 18h45', 161)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'JEUDI', N'08h - 10h', 93)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'JEUDI', N'10h15 - 12h15', 102)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'JEUDI', N'14h30 - 16h30', 111)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'JEUDI', N'16h45 - 18h45', 120)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'LUNDI', N'08h - 10h', 3)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'LUNDI', N'10h15 - 12h15', 12)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'LUNDI', N'14h30 - 16h30', 21)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'LUNDI', N'16h45 - 18h45', 30)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MARDI', N'08h - 10h', 39)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MARDI', N'10h15 - 12h15', 48)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MARDI', N'14h30 - 16h30', 57)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MARDI', N'16h45 - 18h45', 66)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MERCREDI', N'08h - 10h', 75)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'MERCREDI', N'10h15 - 12h15', 84)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'SAMEDI', N'08h - 10h', 165)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'SAMEDI', N'10h15 - 12h15', 174)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'VENDREDI', N'08h - 10h', 129)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'VENDREDI', N'10h15 - 12h15', 138)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'VENDREDI', N'14h30 - 16h30', 147)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 5', N'VENDREDI', N'16h45 - 18h45', 156)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'JEUDI', N'08h - 10h', 96)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'JEUDI', N'10h15 - 12h15', 105)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'JEUDI', N'14h30 - 16h30', 114)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'JEUDI', N'16h45 - 18h45', 123)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'LUNDI', N'08h - 10h', 6)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'LUNDI', N'10h15 - 12h15', 15)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'LUNDI', N'14h30 - 16h30', 24)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'LUNDI', N'16h45 - 18h45', 33)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MARDI', N'08h - 10h', 42)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MARDI', N'10h15 - 12h15', 51)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MARDI', N'14h30 - 16h30', 60)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MARDI', N'16h45 - 18h45', 69)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MERCREDI', N'08h - 10h', 78)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'MERCREDI', N'10h15 - 12h15', 87)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'SAMEDI', N'08h - 10h', 168)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'SAMEDI', N'10h15 - 12h15', 177)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'VENDREDI', N'08h - 10h', 132)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'VENDREDI', N'10h15 - 12h15', 141)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'VENDREDI', N'14h30 - 16h30', 150)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 6', N'VENDREDI', N'16h45 - 18h45', 159)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'JEUDI', N'08h - 10h', 99)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'JEUDI', N'10h15 - 12h15', 108)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'JEUDI', N'14h30 - 16h30', 117)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'JEUDI', N'16h45 - 18h45', 126)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'LUNDI', N'08h - 10h', 9)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'LUNDI', N'10h15 - 12h15', 18)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'LUNDI', N'14h30 - 16h30', 27)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'LUNDI', N'16h45 - 18h45', 36)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MARDI', N'08h - 10h', 45)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MARDI', N'10h15 - 12h15', 54)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MARDI', N'14h30 - 16h30', 63)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MARDI', N'16h45 - 18h45', 72)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MERCREDI', N'08h - 10h', 81)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'MERCREDI', N'10h15 - 12h15', 90)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'SAMEDI', N'08h - 10h', 171)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'SAMEDI', N'10h15 - 12h15', 180)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'VENDREDI', N'08h - 10h', 135)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'VENDREDI', N'10h15 - 12h15', 144)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'VENDREDI', N'14h30 - 16h30', 153)
INSERT [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure], [id]) VALUES (N'Salle 3 niveau 7', N'VENDREDI', N'16h45 - 18h45', 162)
SET IDENTITY_INSERT [dbo].[salle_cours_has_heure_has_jour] OFF
INSERT [dbo].[statut_note] ([idstatut_note]) VALUES (N'note 1')
INSERT [dbo].[statut_note] ([idstatut_note]) VALUES (N'note 2')
INSERT [dbo].[statut_note_has_periode] ([idstatut_note], [idperiode]) VALUES (N'note 1', N'semestre 1')
INSERT [dbo].[statut_note_has_periode] ([idstatut_note], [idperiode]) VALUES (N'note 2', N'semestre 1')
INSERT [dbo].[statut_note_has_periode] ([idstatut_note], [idperiode]) VALUES (N'note 1', N'semestre 2')
INSERT [dbo].[statut_note_has_periode] ([idstatut_note], [idperiode]) VALUES (N'note 2', N'semestre 2')
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'compl', N'complémentaire', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'Eco1', N'Economie 1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'eco2', N'economie2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'eco3', N'economie3', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'eco4', N'economie4', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'eco5', N'economie5', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'eco7', N'economie7', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'econometrie', N'econometrie', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'econometrie3', N'ecoonometrie3', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'info1', N'Informatique 1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'info2', N'informatique2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'lang_exp1', N'langue et expression 1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'lang_exp2 ', N'langue et expression 2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'lang_exp3', N'langues et expression3', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'lang_exp4', N'langues et expression4', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'Maths_appli', N'Mathématiques appliquées', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'Maths1', N'Mathématiques 1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'Maths2', N'Mathématique 2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'op1', N'optionel1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'op2', N'optionel2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'probas', N'probabilités', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'science_soc', N'sciences sociales', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'sond_pratique', N'sondage et pratique des enquêtes', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'stat_appl', N'statistique appliquée', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'stat_maths', N'statistiques mathématiques', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'stat1', N'statistique 1', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'stat2', N'statistique2', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'stat3', N'statistiques3', NULL, NULL, NULL)
INSERT [dbo].[unite_enseignement] ([code_ue], [libele_ue], [id_user], [date_suppression], [est_supprime]) VALUES (N'theo_pratiq_enq', N'théorie et pratique des enquêtes', NULL, NULL, NULL)
/****** Object:  Index [absence_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [absence_FKIndex1] ON [dbo].[absence]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [absence_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [absence_FKIndex2] ON [dbo].[absence]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [absence_FKIndex3]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [absence_FKIndex3] ON [dbo].[absence]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_26]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_26] ON [dbo].[absence]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_28]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_28] ON [dbo].[absence]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_30]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_30] ON [dbo].[absence]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [etudiant_has_classe_has_enseignant_has_matiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_has_classe_has_enseignant_has_matiere_FKIndex1] ON [dbo].[carnetNote]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [etudiant_has_classe_has_enseignant_has_matiere_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_has_classe_has_enseignant_has_matiere_FKIndex2] ON [dbo].[carnetNote]
(
	[classe] ASC,
	[code_matiere] ASC,
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_48]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_48] ON [dbo].[carnetNote]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_49]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_49] ON [dbo].[carnetNote]
(
	[classe] ASC,
	[code_matiere] ASC,
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [classe_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_FKIndex2] ON [dbo].[classe]
(
	[code_filiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_50]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_50] ON [dbo].[classe]
(
	[code_filiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_enseignant_has_matiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_enseignant_has_matiere_FKIndex1] ON [dbo].[classe_has_enseignant_has_matiere]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_enseignant_has_matiere_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_enseignant_has_matiere_FKIndex2] ON [dbo].[classe_has_enseignant_has_matiere]
(
	[matricule] ASC,
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_41]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_41] ON [dbo].[classe_has_enseignant_has_matiere]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_42]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_42] ON [dbo].[classe_has_enseignant_has_matiere]
(
	[matricule] ASC,
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_unite_enseignement_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_unite_enseignement_FKIndex1] ON [dbo].[classe_has_unite_enseignement]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_unite_enseignement_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_unite_enseignement_FKIndex2] ON [dbo].[classe_has_unite_enseignement]
(
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_32]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_32] ON [dbo].[classe_has_unite_enseignement]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_33]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_33] ON [dbo].[classe_has_unite_enseignement]
(
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_enseignant_has_matiere_has_salle_cours_has_heure_has_jour_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_enseignant_has_matiere_has_salle_cours_has_heure_has_jour_FKIndex1] ON [dbo].[emploiTemps]
(
	[classe] ASC,
	[code_matiere] ASC,
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [classe_has_enseignant_has_matiere_has_salle_cours_has_heure_has_jour_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [classe_has_enseignant_has_matiere_has_salle_cours_has_heure_has_jour_FKIndex2] ON [dbo].[emploiTemps]
(
	[code_salle] ASC,
	[code_jour] ASC,
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_39]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_39] ON [dbo].[emploiTemps]
(
	[classe] ASC,
	[code_matiere] ASC,
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_40]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_40] ON [dbo].[emploiTemps]
(
	[code_salle] ASC,
	[code_jour] ASC,
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [enseignant_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [enseignant_FKIndex1] ON [dbo].[enseignant]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_25]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_25] ON [dbo].[enseignant]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [enseignant_has_matiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [enseignant_has_matiere_FKIndex1] ON [dbo].[enseignant_has_matiere]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [enseignant_has_matiere_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [enseignant_has_matiere_FKIndex2] ON [dbo].[enseignant_has_matiere]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_28]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_28] ON [dbo].[enseignant_has_matiere]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_29]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_29] ON [dbo].[enseignant_has_matiere]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [etudiant_has_matiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_has_matiere_FKIndex1] ON [dbo].[est_evalué]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [etudiant_has_matiere_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_has_matiere_FKIndex2] ON [dbo].[est_evalué]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_39]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_39] ON [dbo].[est_evalué]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_40]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_40] ON [dbo].[est_evalué]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [etudiant_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_FKIndex1] ON [dbo].[etudiant]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [etudiant_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [etudiant_FKIndex2] ON [dbo].[etudiant]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_37]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_37] ON [dbo].[etudiant]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_40]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_40] ON [dbo].[etudiant]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [filiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [filiere_FKIndex1] ON [dbo].[filiere]
(
	[matricule_responsable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_26]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_26] ON [dbo].[filiere]
(
	[matricule_responsable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [heure_has_jour_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [heure_has_jour_FKIndex1] ON [dbo].[heure_has_jour]
(
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [heure_has_jour_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [heure_has_jour_FKIndex2] ON [dbo].[heure_has_jour]
(
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_33]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_33] ON [dbo].[heure_has_jour]
(
	[idheure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_34]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_34] ON [dbo].[heure_has_jour]
(
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_31]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_31] ON [dbo].[matiere]
(
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_39]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_39] ON [dbo].[matiere]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [matiere_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [matiere_FKIndex1] ON [dbo].[matiere]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [matiere_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [matiere_FKIndex2] ON [dbo].[matiere]
(
	[code_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_45]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_45] ON [dbo].[option_classe]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [option_classe_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [option_classe_FKIndex1] ON [dbo].[option_classe]
(
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_35]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_35] ON [dbo].[responsable]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [responsable_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [responsable_FKIndex2] ON [dbo].[responsable]
(
	[idcon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_29]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_29] ON [dbo].[retard]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_44]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_44] ON [dbo].[retard]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_45]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_45] ON [dbo].[retard]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [retard_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [retard_FKIndex1] ON [dbo].[retard]
(
	[matricule_etudiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [retard_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [retard_FKIndex2] ON [dbo].[retard]
(
	[matricule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [retard_FKIndex3]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [retard_FKIndex3] ON [dbo].[retard]
(
	[code_matiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_37]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_37] ON [dbo].[salle_cours_has_heure_has_jour]
(
	[code_salle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_38]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_38] ON [dbo].[salle_cours_has_heure_has_jour]
(
	[idheure] ASC,
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [salle_cours_has_heure_has_jour_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [salle_cours_has_heure_has_jour_FKIndex1] ON [dbo].[salle_cours_has_heure_has_jour]
(
	[code_salle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [salle_cours_has_heure_has_jour_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [salle_cours_has_heure_has_jour_FKIndex2] ON [dbo].[salle_cours_has_heure_has_jour]
(
	[idheure] ASC,
	[code_jour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_41]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_41] ON [dbo].[statut_note_has_periode]
(
	[idstatut_note] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Rel_42]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_42] ON [dbo].[statut_note_has_periode]
(
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [statut_note_has_periode_FKIndex1]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [statut_note_has_periode_FKIndex1] ON [dbo].[statut_note_has_periode]
(
	[idstatut_note] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [statut_note_has_periode_FKIndex2]    Script Date: 30/03/2020 18:56:21 ******/
CREATE NONCLUSTERED INDEX [statut_note_has_periode_FKIndex2] ON [dbo].[statut_note_has_periode]
(
	[idperiode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[connexion] ADD  DEFAULT ('SIMPLE') FOR [profil]
GO
ALTER TABLE [dbo].[enseignant] ADD  DEFAULT ((1)) FOR [idcon]
GO
ALTER TABLE [dbo].[enseignant] ADD  DEFAULT ('1234567') FOR [pwd]
GO
ALTER TABLE [dbo].[enseignant] ADD  DEFAULT ('NON') FOR [est_supprime]
GO
ALTER TABLE [dbo].[etudiant] ADD  DEFAULT ('12345') FOR [pwd]
GO
ALTER TABLE [dbo].[etudiant] ADD  DEFAULT ((1)) FOR [idcon]
GO
ALTER TABLE [dbo].[etudiant] ADD  DEFAULT ('SIMPLE') FOR [statut]
GO
ALTER TABLE [dbo].[etudiant] ADD  DEFAULT ('NON') FOR [est_supprime]
GO
ALTER TABLE [dbo].[matiere] ADD  DEFAULT ((0)) FOR [heure_eff]
GO
ALTER TABLE [dbo].[responsable] ADD  DEFAULT ((1)) FOR [idcon]
GO
ALTER TABLE [dbo].[responsable] ADD  DEFAULT ('123456') FOR [pwd]
GO
ALTER TABLE [dbo].[responsable] ADD  DEFAULT ('SIMPLE') FOR [statut]
GO
ALTER TABLE [dbo].[responsable] ADD  DEFAULT ('NON') FOR [est_supprime]
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD FOREIGN KEY([code_matiere])
REFERENCES [dbo].[matiere] ([code_matiere])
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD FOREIGN KEY([matricule_etudiant])
REFERENCES [dbo].[etudiant] ([matricule_etudiant])
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD FOREIGN KEY([matricule])
REFERENCES [dbo].[enseignant] ([matricule])
GO
ALTER TABLE [dbo].[carnetNote]  WITH CHECK ADD FOREIGN KEY([matricule_etudiant])
REFERENCES [dbo].[etudiant] ([matricule_etudiant])
GO
ALTER TABLE [dbo].[carnetNote]  WITH CHECK ADD FOREIGN KEY([classe], [code_matiere], [matricule])
REFERENCES [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule])
GO
ALTER TABLE [dbo].[classe]  WITH CHECK ADD FOREIGN KEY([code_filiere])
REFERENCES [dbo].[filiere] ([code_filiere])
GO
ALTER TABLE [dbo].[classe_has_enseignant_has_matiere]  WITH CHECK ADD FOREIGN KEY([classe])
REFERENCES [dbo].[classe] ([classe])
GO
ALTER TABLE [dbo].[classe_has_enseignant_has_matiere]  WITH CHECK ADD FOREIGN KEY([matricule], [code_matiere])
REFERENCES [dbo].[enseignant_has_matiere] ([matricule], [code_matiere])
GO
ALTER TABLE [dbo].[classe_has_unite_enseignement]  WITH CHECK ADD FOREIGN KEY([classe])
REFERENCES [dbo].[classe] ([classe])
GO
ALTER TABLE [dbo].[classe_has_unite_enseignement]  WITH CHECK ADD FOREIGN KEY([code_ue])
REFERENCES [dbo].[unite_enseignement] ([code_ue])
GO
ALTER TABLE [dbo].[emploiTemps]  WITH CHECK ADD FOREIGN KEY([classe], [code_matiere], [matricule])
REFERENCES [dbo].[classe_has_enseignant_has_matiere] ([classe], [code_matiere], [matricule])
GO
ALTER TABLE [dbo].[emploiTemps]  WITH CHECK ADD FOREIGN KEY([code_salle], [code_jour], [idheure])
REFERENCES [dbo].[salle_cours_has_heure_has_jour] ([code_salle], [code_jour], [idheure])
GO
ALTER TABLE [dbo].[enseignant]  WITH CHECK ADD FOREIGN KEY([idcon])
REFERENCES [dbo].[connexion] ([idcon])
GO
ALTER TABLE [dbo].[enseignant_has_matiere]  WITH CHECK ADD FOREIGN KEY([code_matiere])
REFERENCES [dbo].[matiere] ([code_matiere])
GO
ALTER TABLE [dbo].[enseignant_has_matiere]  WITH CHECK ADD FOREIGN KEY([matricule])
REFERENCES [dbo].[enseignant] ([matricule])
GO
ALTER TABLE [dbo].[est_evalué]  WITH CHECK ADD FOREIGN KEY([code_matiere])
REFERENCES [dbo].[matiere] ([code_matiere])
GO
ALTER TABLE [dbo].[est_evalué]  WITH CHECK ADD FOREIGN KEY([matricule_etudiant])
REFERENCES [dbo].[etudiant] ([matricule_etudiant])
GO
ALTER TABLE [dbo].[etudiant]  WITH CHECK ADD FOREIGN KEY([classe])
REFERENCES [dbo].[classe] ([classe])
GO
ALTER TABLE [dbo].[etudiant]  WITH CHECK ADD FOREIGN KEY([idcon])
REFERENCES [dbo].[connexion] ([idcon])
GO
ALTER TABLE [dbo].[filiere]  WITH CHECK ADD FOREIGN KEY([matricule_responsable])
REFERENCES [dbo].[responsable] ([matricule_responsable])
GO
ALTER TABLE [dbo].[heure_has_jour]  WITH CHECK ADD FOREIGN KEY([code_jour])
REFERENCES [dbo].[jour] ([code_jour])
GO
ALTER TABLE [dbo].[heure_has_jour]  WITH CHECK ADD FOREIGN KEY([idheure])
REFERENCES [dbo].[heure] ([idheure])
GO
ALTER TABLE [dbo].[matiere]  WITH CHECK ADD FOREIGN KEY([code_ue])
REFERENCES [dbo].[unite_enseignement] ([code_ue])
GO
ALTER TABLE [dbo].[matiere]  WITH CHECK ADD FOREIGN KEY([matricule])
REFERENCES [dbo].[enseignant] ([matricule])
GO
ALTER TABLE [dbo].[option_classe]  WITH CHECK ADD FOREIGN KEY([classe])
REFERENCES [dbo].[classe] ([classe])
GO
ALTER TABLE [dbo].[responsable]  WITH CHECK ADD FOREIGN KEY([idcon])
REFERENCES [dbo].[connexion] ([idcon])
GO
ALTER TABLE [dbo].[retard]  WITH CHECK ADD FOREIGN KEY([code_matiere])
REFERENCES [dbo].[matiere] ([code_matiere])
GO
ALTER TABLE [dbo].[retard]  WITH CHECK ADD FOREIGN KEY([matricule_etudiant])
REFERENCES [dbo].[etudiant] ([matricule_etudiant])
GO
ALTER TABLE [dbo].[retard]  WITH CHECK ADD FOREIGN KEY([matricule])
REFERENCES [dbo].[enseignant] ([matricule])
GO
ALTER TABLE [dbo].[salle_cours_has_heure_has_jour]  WITH CHECK ADD FOREIGN KEY([code_salle])
REFERENCES [dbo].[salle_cours] ([code_salle])
GO
ALTER TABLE [dbo].[salle_cours_has_heure_has_jour]  WITH CHECK ADD FOREIGN KEY([idheure], [code_jour])
REFERENCES [dbo].[heure_has_jour] ([idheure], [code_jour])
GO
ALTER TABLE [dbo].[statut_note_has_periode]  WITH CHECK ADD FOREIGN KEY([idperiode])
REFERENCES [dbo].[periode] ([idperiode])
GO
ALTER TABLE [dbo].[statut_note_has_periode]  WITH CHECK ADD FOREIGN KEY([idstatut_note])
REFERENCES [dbo].[statut_note] ([idstatut_note])
GO
USE [master]
GO
ALTER DATABASE [GestionENSAE] SET  READ_WRITE 
GO
