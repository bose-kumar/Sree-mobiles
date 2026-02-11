USE [Sreemobile]
GO

/****** Object:  Table [dbo].[Vendor_Master_Table]    Script Date: 02-02-2026 10:27:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vendor_Master_Table](
	[VendorId] [varchar](20) NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[VendorAddress] [varchar](250) NULL,
	[GSTNo] [varchar](20) NULL,
	[EmailId] [varchar](100) NULL,
	[MobileNo] [varchar](15) NULL,
	[BankName] [varchar](100) NULL,
	[Branch] [varchar](100) NULL,
	[AccountNo] [varchar](30) NULL,
	[AccountName] [varchar](100) NULL,
	[AccountType] [varchar](30) NULL,
	[IFSCCode] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vendor_Master_Table] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO


ALTER TABLE Vendor_Master_Table
DROP CONSTRAINT VendorId;


CREATE TABLE Vendor_Master_Table
(
    VendorId VARCHAR(20)  NOT NULL,
    VendorName VARCHAR(100) NOT NULL,
    VendorAddress VARCHAR(250) NULL,
    GSTNo VARCHAR(20)  NULL,
    EmailId VARCHAR(100) NULL,
    MobileNo VARCHAR(15)  NULL,
    BankName VARCHAR(100) NULL,
    Branch VARCHAR(100) NULL,
    AccountNo VARCHAR(30)  NULL,
    AccountName VARCHAR(100) NULL,
    AccountType VARCHAR(30)  NULL,
    IFSCCode VARCHAR(20)  NULL,
    CreatedDate DATETIME
);

ALTER TABLE Vendor_Master_Table
ADD RowId INT IDENTITY(1,1);

ALTER TABLE Vendor_Master_Table
ADD CONSTRAINT PK_Vendor_Master_Table
PRIMARY KEY (VendorId);


CREATE PROCEDURE sp_deleteVendorRow
    @RowId INT
AS
BEGIN
    DELETE FROM Vendor_Master_Table
    WHERE RowId = @RowId
END




CREATE PROCEDURE sp_GetVendors
AS
BEGIN
    SELECT
        RowId,
        VendorId,
        VendorName,
        MobileNo,
        GSTNo,
        BankName
    FROM Vendor_Master_Table
    ORDER BY RowId DESC;
END
select * from Vendor_Master_Table

CREATE PROCEDURE sp_GetVendorByRowId
    @RowId INT
    @VendorId ,
        VendorName,
        VendorAddress,
        GSTNo,
        EmailId,
        MobileNo,
        BankName,
        Branch,
        AccountNo,
        AccountName,
        AccountType,
        IFSCCode
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RowId,
        VendorId,
        VendorName,
        VendorAddress,
        GSTNo,
        EmailId,
        MobileNo,
        BankName,
        Branch,
        AccountNo,
        AccountName,
        AccountType,
        IFSCCode
    FROM Vendor_Master_Table
    WHERE RowId = @RowId;
END
GO
sp_helptext sp_GetVendorByRowId

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_GetVendorByRowId
    @RowId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RowId,
        VendorId,
        VendorName,
        VendorAddress,
        GSTNo,
        EmailId,
        MobileNo,
        BankName,
        Branch,
        AccountNo,
        AccountName,
        AccountType,
        IFSCCode
    FROM Vendor_Master_Table
    WHERE RowId = @RowId;
END

CREATE PROCEDURE sp_UpdateVendor
    @RowId INT,
    @VendorId VARCHAR(20),
    @VendorName VARCHAR(100),
    @VendorAddress VARCHAR(250),
    @GSTNo VARCHAR(20),
    @EmailId VARCHAR(100),
    @MobileNo VARCHAR(15),
    @BankName VARCHAR(100),
    @Branch VARCHAR(100),
    @AccountNo VARCHAR(30),
    @AccountName VARCHAR(100),
    @AccountType VARCHAR(30),
    @IFSCCode VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Vendor_Master_Table
    SET
        VendorId = @VendorId,
        VendorName = @VendorName,
        VendorAddress = @VendorAddress,
        GSTNo = @GSTNo,
        EmailId = @EmailId,
        MobileNo = @MobileNo,
        BankName = @BankName,
        Branch = @Branch,
        AccountNo = @AccountNo,
        AccountName = @AccountName,
        AccountType = @AccountType,
        IFSCCode = @IFSCCode
    WHERE RowId = @RowId;
END
GO

CREATE PROCEDURE sp_GetVendorIds
AS
BEGIN
    SELECT VendorId
    FROM Vendor_Master_Table
    ORDER BY VendorId;
END
GO

CREATE PROCEDURE sp_GetVendorByVendorId
    @VendorId VARCHAR(20)
AS
BEGIN
    SELECT VendorName, MobileNo
    FROM Vendor_Master_Table
    WHERE VendorId = @VendorId;
END
GO


