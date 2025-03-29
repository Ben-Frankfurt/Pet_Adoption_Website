SET NOCOUNT ON;
GO

USE master;
GO

----------------------------------------------------------------------
-- Check if "Pet_Adoptin" DB exists, if so, delete DB "Pet_Adoptin" --
----------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Pet_Adoptin')
BEGIN
    ALTER DATABASE Pet_Adoptin SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Pet_Adoptin;
END
GO

-----------------------------
-- Create "Pet_Adoptin" DB -- 
-----------------------------
DECLARE @device_directory NVARCHAR(520);
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) -1)
FROM master.dbo.sysaltfiles
WHERE dbid = 1 AND fileid = 1;


EXECUTE (N'CREATE DATABASE Pet_Adoptin
    ON PRIMARY (NAME = N''Pet_Adoptin'',FILENAME = N''' + @device_directory + N'Pet_Adoptin.mdf'')
    LOG ON (NAME = N''Pet_Adoptin_Log'', FILENAME = N''' + @device_directory + N'Pet_Adoptin.ldf'')');
GO

SET QUOTED_IDENTIFIER ON;
GO
SET DATEFORMAT mdy;
GO

USE Pet_Adoptin;
GO

---------------------------------------------------------------------
-- Before crating the DB tables, verify thay arn't allready exists --
---------------------------------------------------------------------

DROP TABLE IF EXISTS dbo.adoptions_log;
DROP TABLE IF EXISTS dbo.pet_list;
DROP TABLE IF EXISTS dbo.races;
DROP TABLE IF EXISTS dbo.lides;
DROP TABLE IF EXISTS dbo.customers;
DROP TABLE IF EXISTS dbo.emploeeys;
DROP TABLE IF EXISTS dbo.titles;
DROP TABLE IF EXISTS dbo.pet_type;

----------------------
-- Create DB tables --
----------------------

CREATE TABLE dbo.pet_type (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pet_type NVARCHAR(50)
);
GO

CREATE TABLE dbo.genders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    gender NVARCHAR(50)
);
GO

CREATE TABLE dbo.titles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(50) 
);
GO

CREATE TABLE dbo.races (
    id INT IDENTITY(1,1) PRIMARY KEY,
    race NVARCHAR(50) 
);
GO

CREATE TABLE dbo.loginlist (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(50),
    user_password NVARCHAR(100)  
);
GO

CREATE TABLE dbo.emploeeys (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    job_title INT,
    email_address NVARCHAR(50),
    mobile_phone NVARCHAR(50),

    CONSTRAINT fk_job_title FOREIGN KEY (job_title)
        REFERENCES dbo.titles(id)
);
GO

CREATE TABLE dbo.customers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    email_address NVARCHAR(50),
    mobile_phone NVARCHAR(50),
    home_address NVARCHAR(50)
);
GO

CREATE TABLE dbo.pet_list (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pet_name NVARCHAR(50),
    pet_adoption_status BIT,
    pet_gender INT,
    pet_type INT,
    pet_race INT,
    pet_age INT,
    pet_photo NVARCHAR(500),

    CONSTRAINT fk_pet_gender FOREIGN KEY(pet_gender)
        REFERENCES dbo.genders(id),

    CONSTRAINT fk_pet_type FOREIGN KEY(pet_type)
        REFERENCES dbo.pet_type(id),

    CONSTRAINT fk_pet_race FOREIGN KEY (pet_race)
        REFERENCES dbo.races(id)
);
GO

CREATE TABLE dbo.lides (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    pet_id INT,
    [date] DATETIME DEFAULT GETDATE(),

    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES dbo.customers(id),

    CONSTRAINT fk_pet_id FOREIGN KEY (pet_id)
        REFERENCES dbo.pet_list(id)

);
GO

CREATE TABLE dbo.adoptions_log (
    id INT IDENTITY(1,1) PRIMARY KEY,
    [date] DATETIME DEFAULT GETDATE(),
    pet_adopted INT,
    customer_id INT,
    emploee_id INT DEFAULT NULL,

    CONSTRAINT fk_pet_adopted FOREIGN KEY (pet_adopted)
        REFERENCES dbo.pet_list(id),

    CONSTRAINT fk_customer_id_ FOREIGN KEY (customer_id)
        REFERENCES dbo.customers(id),

    CONSTRAINT fk_emploeey_id FOREIGN KEY (emploeey_id)
        REFERENCES dbo.emploeeys(id)

);
GO