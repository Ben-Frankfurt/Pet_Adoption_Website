USE Pet_Adoptin;
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAvailbePets]
as 
BEGIN
SELECT pet_list.id, pet_list.pet_name, pet_list.pet_age, pet_list.pet_photo,pet_type.name as 'type', races.name as 'race'
FROM pet_list JOIN pet_type ON pet_list.pet_type = pet_type.id
    JOIN races ON pet_list.pet_race = races.id
WHERE pet_list.pet_adoption_status = 0
END
GO

CREATE PROCEDURE [dbo].[spGetLidesList]
as 
BEGIN
SELECT lides.id, lides.date, customers.id as 'customer_id',
	customers.first_name as 'customer_first_name',
	customers.last_name as 'customer_last_name', customers.mobile_phone as 'customer_phone',
	customers.email_address, pet_list.id as 'pet_id', pet_list.pet_name, 
	pet_list.pet_photo, pet_type.name, races.name
FROM lides JOIN customers ON lides.customer_id = customers.id
	JOIN pet_list ON lides.pet_id = pet_list.id
	JOIN pet_type ON pet_list.pet_type = pet_type.id
	JOIN races ON pet_list.pet_race = races.id
END
GO