USE Pet_Adoptin;
GO

-------------------------------------
------ fill the pet_type table ------
-------------------------------------
SET IDENTITY_INSERT dbo.pet_type ON;

INSERT INTO dbo.pet_type (id, name) VALUES (1, N'חתול');
INSERT INTO dbo.pet_type (id, name) VALUES (2, N'כלב');

SET IDENTITY_INSERT dbo.pet_type OFF;
GO

-----------------------------------
------ fill the titles table ------
-----------------------------------
SET IDENTITY_INSERT dbo.titles ON;

INSERT INTO dbo.titles (id, name) VALUES (1, N'מנכ"ל');
INSERT INTO dbo.titles (id, name) VALUES (2, N'סמנכ"ל');
INSERT INTO dbo.titles (id, name) VALUES (3, N'סמנכ"ל שיווק');
INSERT INTO dbo.titles (id, name) VALUES (4, N'וטרינר');
INSERT INTO dbo.titles (id, name) VALUES (5, N'נציג/ת מכירות');

SET IDENTITY_INSERT dbo.titles OFF;
GO

-----------------------------------
------ fill the races table ------
-----------------------------------
SET IDENTITY_INSERT dbo.races ON;

INSERT INTO dbo.races (id, name) VALUES (1, N'לברדור רטריבר');
INSERT INTO dbo.races (id, name) VALUES (2, N'ג''רמן שפרד');
INSERT INTO dbo.races (id, name) VALUES (3, N'ביגל');
INSERT INTO dbo.races (id, name) VALUES (4, N'פודל');
INSERT INTO dbo.races (id, name) VALUES (5, N'בולדוג אנגלי');
INSERT INTO dbo.races (id, name) VALUES (6, N'צ''יוואווה');
INSERT INTO dbo.races (id, name) VALUES (7, N'בולדוג צרפתי');
INSERT INTO dbo.races (id, name) VALUES (8, N'רוטוויילר');
INSERT INTO dbo.races (id, name) VALUES (9, N'יורקשייר טרייר');
INSERT INTO dbo.races (id, name) VALUES (10, N'דבלמן פינצ''ר');
INSERT INTO dbo.races (id, name) VALUES (11, N'בוקסר');
INSERT INTO dbo.races (id, name) VALUES (12, N'סיבירי האסקי');
INSERT INTO dbo.races (id, name) VALUES (13, N'גולדן רטריבר');
INSERT INTO dbo.races (id, name) VALUES (14, N'שיצו');
INSERT INTO dbo.races (id, name) VALUES (15, N'דלמטי');
INSERT INTO dbo.races (id, name) VALUES (16, N'פרסי');
INSERT INTO dbo.races (id, name) VALUES (17, N'סיאמי');
INSERT INTO dbo.races (id, name) VALUES (18, N'מיין קון');
INSERT INTO dbo.races (id, name) VALUES (19, N'בריטי קצר שיער');
INSERT INTO dbo.races (id, name) VALUES (20, N'בנגלי');
INSERT INTO dbo.races (id, name) VALUES (21, N'אקסוטי קצר שיער');
INSERT INTO dbo.races (id, name) VALUES (22, N'ספינקס');
INSERT INTO dbo.races (id, name) VALUES (23, N'רוסי כחול');
INSERT INTO dbo.races (id, name) VALUES (24, N'אביסינאי');
INSERT INTO dbo.races (id, name) VALUES (25, N'טורקית אנגורה');
INSERT INTO dbo.races (id, name) VALUES (26, N'נורווגית פורסט קאט');
INSERT INTO dbo.races (id, name) VALUES (27, N'סומלי');
INSERT INTO dbo.races (id, name) VALUES (28, N'בלינזי');
INSERT INTO dbo.races (id, name) VALUES (29, N'סקוטיש פולד');
INSERT INTO dbo.races (id, name) VALUES (30, N'רוג''מאפין');

SET IDENTITY_INSERT dbo.races OFF;
GO

--------------------------------------
------ fill the emploeeys table ------
--------------------------------------
SET IDENTITY_INSERT dbo.emploeeys ON;

INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (1, N'דינה', N'לוי', 1, N'dinalevy@gmail.com', N'+972 53 526 1294');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (2, N'סהר', N'יעקובי', 2, N'sahry@gmail.com', N'+972 54 543 2513');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (3, N'שני', N'ניצן', 3, N'shaninizan@gmail.com', N'+972 52 524 3211');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (4, N'עינב', N'יששכר', 4, N'einav@gmail.com', N'+972 52 156 3232');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (5, N'דוד', N'נעמן', 4, N'davidn@gmail.com', N'+972 53 856 9601');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (6, N'אודי', N'יצחק', 5, N'odii3419@gmail.com', N'+972 54 863 9124');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (7, N'נופר', N'הרוש', 5, N'nofnof@gmail.com', N'+972 52 555 7302');
INSERT INTO dbo.emploeeys (id, first_name, last_name, job_title, email_address, mobile_phone) 
    VALUES (8, N'נועה', N'ורדי', 5, N'noavardi@gmail.com', N'+972 53 201 0303');

SET IDENTITY_INSERT dbo.emploeeys OFF;
GO

--------------------------------------
------ fill the customers table ------
--------------------------------------
SET IDENTITY_INSERT dbo.customers ON;

INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (1, N'שירה', N'ברק', N'nofnof@gmail.com', N'+972 52 561 0302', N'הרצל 10, תל אביב-יפו');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (2, N'עדנה', N'לביא', N'nofnof@gmail.com', N'+972 54 355 7802', N'אלנבי 15, תל אביב-יפו');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (3, N'יוסף', N'פרידמן', N'nofnof@gmail.com', N'+972 52 578 1291', N'בן יהודה 50, ירושלים');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (4, N'מוחמד', N'מזרחי', N'nofnof@gmail.com', N'+972 53 445 7531', N'המלך דוד 7, ירושלים');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (5, N'אעבד', N'גולדברג', N'nofnof@gmail.com', N'+972 54 120 1946', N'הזית 3, חיפה');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (6, N'אוהד', N'פרלמן', N'nofnof@gmail.com', N'+972 52 193 0000', N'הנגב 22, באר שבע');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (7, N'מעיין', N'אלקיים', N'nofnof@gmail.com', N'+972 53 250 7557', N'השלום 12, נתניה');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (8, N'קרן', N'גינזבורג', N'nofnof@gmail.com', N'+972 52 930 7302', N'הדקל 5, פתח תקווה');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (9, N'דפנה', N'רפפורט', N'nofnof@gmail.com', N'+972 52 001 9110', N'הפרחים 8, אשדוד');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (10, N'שובל', N'כהנר', N'nofnof@gmail.com', N'+972 57 333 0503', N'העצמאות 17, רמת גן');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (11, N'שימעון', N'יצחקי', N'nofnof@gmail.com', N'+972 52 701 4500', N'כורכר 9, בני ברק');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (12, N'אלון', N'כהן', N'nofnof@gmail.com', N'+972 55 254 9470', N'המגדל 4, חולון');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (13, N'יבגני', N'לוי זרבייב', N'nofnof@gmail.com', N'+972 53 894 4020', N'נווה מדבר 11, רעננה');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (14, N'דור', N'יפעת', N'nofnof@gmail.com', N'+972 52 732 4601', N'השקד 6, ראשון לציון');
INSERT INTO dbo.customers (id, first_name, last_name, email_address, mobile_phone, home_address) 
    VALUES (15, N'הדס', N'נחמייאס', N'nofnof@gmail.com', N'+972 52 428 4867', N'הכרמל 3, קרית אתא');

SET IDENTITY_INSERT dbo.customers OFF;
GO

--------------------------------------
------ fill the pet_list table ------
--------------------------------------
SET IDENTITY_INSERT dbo.pet_list ON;

INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (1, N'מיצי', 0 ,1, 1, 14, N'https://images.pexels.com/photos/31057632/pexels-photo-31057632/free-photo-of-majestic-persian-cat-resting-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (2, N'לוקי', 0 ,1, 2, 14, N'https://images.pexels.com/photos/357141/pexels-photo-357141.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (3, N'קיטי', 0 ,1, 3, 8, N'https://images.pexels.com/photos/7790029/pexels-photo-7790029.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (4, N'ג''ינג''י', 0 ,1, 1, 4, N'https://images.pexels.com/photos/1296660/pexels-photo-1296660.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (5, N'פרסי', 0 ,1, 2, 4, N'https://images.pexels.com/photos/1082256/pexels-photo-1082256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (6, N'מוקה', 0 ,1, 5, 4, N'https://images.pexels.com/photos/29228411/pexels-photo-29228411/free-photo-of-festive-cat-under-the-christmas-tree-in-ottawa.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (7, N'טופי', 0 ,1, 7, 3, N'https://images.pexels.com/photos/31065406/pexels-photo-31065406/free-photo-of-sphynx-cat-in-hawaiian-shirt-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (8, N'שוקי', 0 ,1, 11, 3, N'https://images.pexels.com/photos/29976323/pexels-photo-29976323/free-photo-of-serene-siberian-cat-perched-on-snowy-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (9, N'בלו', 0 ,1, 8, 1, N'https://images.pexels.com/photos/17988059/pexels-photo-17988059/free-photo-of-cat-with-collar-with-bell.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (10, N'סאנדי', 0 ,1, 8, 4, N'https://images.pexels.com/photos/28560106/pexels-photo-28560106/free-photo-of-elegant-grey-cat-with-intense-gazing-eyes.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (11, N'תמי', 0 ,1, 7, 8, N'https://images.pexels.com/photos/17330855/pexels-photo-17330855/free-photo-of-close-up-of-sphynx-cat.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (12, N'נינה', 0 ,1, 10, 9, N'https://images.pexels.com/photos/15147583/pexels-photo-15147583/free-photo-of-white-cat-lying-on-a-stool.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (13, N'מיני', 0 ,1, 10, 6, N'https://images.pexels.com/photos/29268291/pexels-photo-29268291/free-photo-of-elegant-white-cat-against-blue-background.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (14, N'פיבי', 0 ,1, 13, 3, N'https://images.pexels.com/photos/31083436/pexels-photo-31083436/free-photo-of-domestic-cat-lounging-on-tiled-outdoor-patio.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (15, N'יוני', 0 ,1, 13, 1, N'https://images.pexels.com/photos/31079252/pexels-photo-31079252/free-photo-of-sunlit-feline-lounging-on-porch-in-athens.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (16, N'פומיה', 0 ,1, 13, 4, N'https://images.pexels.com/photos/31081426/pexels-photo-31081426/free-photo-of-black-and-white-cat-posing-on-vibrant-background.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (17, N'ג''יני', 0 ,1, 4, 15, N'https://images.pexels.com/photos/208907/pexels-photo-208907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (18, N'נמר', 0 ,1, 4, 12, N'https://images.pexels.com/photos/29750372/pexels-photo-29750372/free-photo-of-portrait-of-a-british-shorthair-cat-with-amber-eyes.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (19, N'קוקי', 0 ,1, 4, 9, N'https://images.pexels.com/photos/30338360/pexels-photo-30338360/free-photo-of-plush-british-shorthair-cat-resting-indoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (20, N'פינתי', 0 ,1, 4, 1, N'https://images.pexels.com/photos/4869957/pexels-photo-4869957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (21, N'עלמה', 0 ,1, 15, 4, N'https://images.pexels.com/photos/5521476/pexels-photo-5521476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (22, N'מימי', 0 ,1, 14, 6, N'https://images.pexels.com/photos/127028/pexels-photo-127028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (23, N'בליס', 0 ,1, 14, 10, N'https://images.pexels.com/photos/29684355/pexels-photo-29684355/free-photo-of-adorable-scottish-fold-cat-with-bright-orange-eyes.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (24, N'לבנה', 0 ,1, 14, 13, N'https://images.pexels.com/photos/6869651/pexels-photo-6869651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (25, N'דיאנה', 0 ,1, 9, 4, N'https://images.pexels.com/photos/10409730/pexels-photo-10409730.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (26, N'סאדי', 0 ,1, 9, 14, N'https://images.pexels.com/photos/11926911/pexels-photo-11926911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (27, N'אלפי', 0 ,1, 1, 9, N'https://images.pexels.com/photos/1296660/pexels-photo-1296660.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (28, N'קסטרו', 0 ,1, 1, 1, N'https://images.pexels.com/photos/9991563/pexels-photo-9991563.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (29, N'ספארי', 0 ,1, 1, 8, N'https://images.pexels.com/photos/7445016/pexels-photo-7445016.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (30, N'מור', 0 ,1, 1, 3, N'https://images.pexels.com/photos/1047557/pexels-photo-1047557.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (31, N'בובי', 0 ,2, 1, 1, N'https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (32, N'מקס', 0 ,2, 1, 4, N'https://images.pexels.com/photos/2419256/pexels-photo-2419256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (33, N'רקס', 0 ,2, 2, 8, N'https://images.pexels.com/photos/333083/pexels-photo-333083.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (34, N'לוקי', 0 ,2, 2, 9, N'https://images.pexels.com/photos/351406/pexels-photo-351406.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (35, N'גק', 0 ,2, 2, 4, N'https://images.pexels.com/photos/6209949/pexels-photo-6209949.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (36, N'צארלי', 0 ,2, 3, 4, N'https://images.pexels.com/photos/3764319/pexels-photo-3764319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (37, N'אודי', 0 ,2, 4, 17, N'https://images.pexels.com/photos/1485726/pexels-photo-1485726.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (38, N'דובי', 0 ,2, 4, 12, N'https://images.pexels.com/photos/1029726/pexels-photo-1029726.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (39, N'זאוס', 0 ,2, 5, 7, N'https://images.pexels.com/photos/3978352/pexels-photo-3978352.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (40, N'רוקי', 0 ,2, 5, 3, N'https://images.pexels.com/photos/28452379/pexels-photo-28452379/free-photo-of-cute-english-bulldog-puppy-walking-on-a-sunny-day.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (41, N'טוני', 0 ,2, 6, 4, N'https://images.pexels.com/photos/191353/pexels-photo-191353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (42, N'סאני', 0 ,2, 6, 4, N'https://images.pexels.com/photos/2133205/pexels-photo-2133205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (43, 'בראון', 0 ,2, 6, 4, N'https://images.pexels.com/photos/2133015/pexels-photo-2133015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (44, N'תום', 0 ,2, 7, 4, N'https://images.pexels.com/photos/776078/pexels-photo-776078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (45, N'ג''ינג''י', 0 ,2, 8, 12, N'https://images.pexels.com/photos/170325/pexels-photo-170325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (46, N'נמרוד', 0 ,2, 8, 9, N'https://images.pexels.com/photos/68798/pexels-photo-68798.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (47, N'סיני', 0 ,2, 8, 1, N'https://images.pexels.com/photos/2867230/pexels-photo-2867230.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (48, N'סירי', 0 ,2, 9, 4, N'https://images.pexels.com/photos/3512/garden-dog-pet.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (49, N'טופי', 0 ,2, 9, 2, N'https://images.pexels.com/photos/54623/yorkshire-terrier-terrier-dog-small-dog-54623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (50, N'סמי', 0 ,2, 10, 1, N'https://images.pexels.com/photos/7516156/pexels-photo-7516156.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (51, N'ג''וי', 0 ,2, 11, 8, N'https://images.pexels.com/photos/1769538/pexels-photo-1769538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (52, N'בלו', 0 ,2, 12, 1, N'https://images.pexels.com/photos/3726314/pexels-photo-3726314.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (53, N'רדי', 0 ,2, 12, 4, N'https://images.pexels.com/photos/3812207/pexels-photo-3812207.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (54, N'רוני', 0 ,2, 12, 6, N'https://images.pexels.com/photos/3715583/pexels-photo-3715583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (55, N'פינקי', 0 ,2, 12, 1, N'https://images.pexels.com/photos/3478875/pexels-photo-3478875.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (56, N'ז''אק', 0 ,2, 13, 15, N'https://images.pexels.com/photos/1959055/pexels-photo-1959055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (57, N'ארסי', 0 ,2, 13, 10, N'https://images.pexels.com/photos/752383/pexels-photo-752383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (58, N'ג''ימי', 0 ,2, 14, 11, N'https://images.pexels.com/photos/130765/pexels-photo-130765.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (59, N'רמי', 0 ,2, 15, 4, N'https://images.pexels.com/photos/101634/pexels-photo-101634.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
INSERT INTO dbo.pet_list (id, pet_name, pet_adoption_status, pet_type, pet_race, pet_age, pet_photo)
    VALUES (60, N'כוכב', 0 ,2, 15, 1, N'https://images.pexels.com/photos/3763311/pexels-photo-3763311.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

SET IDENTITY_INSERT dbo.pet_list OFF;
GO

--------------------------------------
------ fill the lides table ------
--------------------------------------
SET IDENTITY_INSERT dbo.lides ON;

INSERT INTO dbo.lides (id, customer_id, pet_id, [date]) VALUES (1,5,3,N'2024-12-03 15:32:25');
INSERT INTO dbo.lides (id, customer_id, pet_id, [date]) VALUES (2,7,51,N'2024-10-23 10:52:23');
INSERT INTO dbo.lides (id, customer_id, pet_id, [date]) VALUES (3,1,9,N'2025-02-03 23:00:25');
INSERT INTO dbo.lides (id, customer_id, pet_id, [date]) VALUES (4,8,25,N'2025-01-10 15:10:25');
INSERT INTO dbo.lides (id, customer_id, pet_id, [date]) VALUES (5,2,38,N'2025-01-12 11:56:25');

SET IDENTITY_INSERT dbo.lides OFF;
GO