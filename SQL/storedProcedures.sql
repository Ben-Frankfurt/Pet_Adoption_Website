USE Pet_Adoptin;
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------
-- create stored procidure for all avilble pets --
--------------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spGetAvailbePets]
as 
BEGIN
SELECT pet_list.id, pet_list.pet_name, pet_list.pet_age, pet_list.pet_photo, pet_type.pet_type as 'type', races.race as 'race', genders.gender
FROM pet_list JOIN pet_type ON pet_list.pet_type = pet_type.id
    JOIN races ON pet_list.pet_race = races.id
    JOIN genders ON pet_list.pet_gender = genders.id
WHERE pet_list.pet_adoption_status = 0
END
GO

--------------------------------------------
-- create stored procidure for lides page --
--------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spGetLidesList]
as 
BEGIN
SELECT lides.id, lides.date, customers.id as 'customer_id',
	customers.first_name as 'customer_first_name',
	customers.last_name as 'customer_last_name', customers.mobile_phone as 'customer_phone',
	customers.email_address, pet_list.id as 'pet_id', pet_list.pet_name, 
	pet_list.pet_photo, pet_type.pet_type, races.race
FROM lides JOIN customers ON lides.customer_id = customers.id
	JOIN pet_list ON lides.pet_id = pet_list.id
	JOIN pet_type ON pet_list.pet_type = pet_type.id
	JOIN races ON pet_list.pet_race = races.id
END
GO

-------------------------------------------------
-- create stored procidure for serch by filter --
-------------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spSerchSpecificAnimle]
@min_age INT,
@max_age INT,
@race VARCHAR(50),
@type VARCHAR(50),
@gender VARCHAR(50)
as 
BEGIN
SELECT pet_list.id, pet_list.pet_name, pet_list.pet_age, pet_list.pet_photo, pet_type.pet_type as 'type', races.race as 'race', genders.gender
FROM pet_list JOIN pet_type ON pet_list.pet_type = pet_type.id
    JOIN races ON pet_list.pet_race = races.id
    JOIN genders ON pet_list.pet_gender = genders.id
WHERE pet_list.pet_adoption_status = 0 AND pet_list.pet_age BETWEEN @min_age AND @max_age
	AND races.race LIKE @race AND pet_type.pet_type LIKE @type AND genders.gender = @gender
END
GO


---------------------------------------------------
-- create stored procidure for full card per pet --
---------------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spGetFullCard]
@pet_id INT
as 
BEGIN
SELECT pet_list.id, pet_list.pet_name, pet_list.pet_age, pet_list.pet_photo, pet_type.pet_type as 'type', races.race as 'race', genders.gender
FROM pet_list JOIN pet_type ON pet_list.pet_type = pet_type.id
    JOIN races ON pet_list.pet_race = races.id
    JOIN genders ON pet_list.pet_gender = genders.id
WHERE pet_list.id = @pet_id
END
GO

-----------------------------------------------------------------------
-- create stored procidure for insert new customer and return his id --
-----------------------------------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spInsertCustomerAndReturnCustomerId]
@customer_first_name NVARCHAR(50),
@customer_last_name NVARCHAR(50),
@customer_email_address NVARCHAR(50),
@customer_mobile_phone NVARCHAR(50)

as
BEGIN
IF NOT EXISTS(SELECT * FROM customers WHERE first_name = @customer_first_name AND last_name = @customer_last_name AND email_address = @customer_email_address AND mobile_phone = @customer_mobile_phone)
	INSERT INTO dbo.customers (first_name, last_name, email_address, mobile_phone) VALUES (@customer_first_name, @customer_last_name, @customer_email_address, @customer_mobile_phone);
	SELECT id FROM customers WHERE first_name = @customer_first_name AND last_name = @customer_last_name AND email_address = @customer_email_address AND mobile_phone = @customer_mobile_phone;
END
GO

-----------------------------------------------------------------------
-- create stored procidure for insert new lide and return his id --
-----------------------------------------------------------------------
CREATE or ALTER PROCEDURE [dbo].[spInsertNewLideAndReturnLideId]
@customer_id INT,
@pet_id INT

as 
BEGIN
IF NOT EXISTS(SELECT * FROM lides WHERE customer_id = @customer_id AND pet_id = @pet_id)
	INSERT INTO dbo.lides(customer_id, pet_id) VALUES (@customer_id, @pet_id);
	SELECT id FROM lides WHERE customer_id = @customer_id AND pet_id = @pet_id
END
GO