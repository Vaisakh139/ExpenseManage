use spendwise;
create table mainList(main_id int primary key identity(1,1),spendCategories varchar(50) not null unique, total decimal );
insert into mainList values('Groceries',0),('Transportation',0),('Food',0),('Fun',0),('Health Care',0),('Utilities',0),('Misc',0);
select * from mainList;

create table billTable(b_id int primary key identity(1,1), fs_main_id int references mainList(main_id) not null, bill_no varchar(100) unique, [data] date not null,expense_category varchar(100), [desc] varchar(255), amount decimal);
INSERT INTO billTable (fs_main_id, bill_no, [data], expense_category, [desc], amount)
VALUES
(1, 'B267/2024', '2023-01-01', 'shop', 'Tomato, Potato', 60.00),
(1, 'B4567/2024', '2023-01-03', 'person', 'Rice, Uzhunn, Parrippu', 97.00),
(1, 'B266667/2024', '2023-01-02', 'shop', 'Beef', 240.00),
(1, 'B234561/2024', '2023-02-05', 'shop', 'Apple, Orange, Grapes', 180.00),
(2, 'B234562/2024', '2023-02-01', 'category', 'Office Transportation', 30.00),
(2, 'B234563/2024', '2023-02-03', 'person', 'To Home', 130.00),
(2, 'B234564/2024', '2023-03-02', 'shop', 'Holiday', 600.00),
(2, 'B234565/2024', '2023-03-05', 'person', 'To home', 410.00),
(3, 'B234566/2024', '2023-02-01', 'category', 'Biriyani', 110.00),
(3, 'B2345677/2024', '2023-02-03', 'shop', 'Coffee and Snacks', 40.00),
(3, 'B234568/2024', '2023-02-02', 'shop', 'Oonu', 50),
(4, 'B2345679/2024', '2023-02-01', 'category', 'Second show', 199.00),
(4, 'B234560/2024', '2023-02-03', 'shop', 'Camping', 2500.00),
(4, 'B231567/2024', '2023-02-02', 'person', 'First show', 199.00),
(4, 'B232567/2024', '2023-02-05', 'shop', 'Second show', 199.00),
(5, 'B2343567/2024', '2023-02-01', 'person', 'Health insurance', 1499.00),
(5, 'B2345467/2024', '2023-02-03', 'category', 'Doctor visit', 597.00),
(5, 'B234557/2024', '2023-02-02', 'shop', 'Medicines', 197.00),
(6, 'B234567/2024', '2023-02-01', 'person', 'Internet, Cable and Landline', 399.00),
(6, 'B234577/2024', '2023-02-03', 'person', 'Drinking Water', 597.00),
(6, 'B234587/2024', '2023-02-02', 'shop', 'Electricity bill', 1970.00),
(6, 'B2345887/2024', '2023-02-01', 'person', 'Internet, Cable, Landline', 87.00),
(7, 'B2345699/2024', '2023-02-01', 'shop', 'Bike repair', 200.00),
(7, 'B274567/2024', '2023-02-03', 'shop', 'Borrow', 500.00),
(1, 'B267w/2024', '2024-03-01', 'shop', 'Tomato, Potato', 60.00),
(1, 'B4567e/2024', '2024-03-03', 'category', 'Rice, Uzhunn, Parrippu', 97.00),
(1, 'B26666r7/2024', '2024-01-02', 'person', 'Beef', 240.00),
(1, 'B23d4561/2024', '2024-02-05', 'person', 'Apple, Orange, Grapes', 180.00),
(2, 'B234s562/2024', '2024-03-01', 'category', 'Office Transportation', 30.00),
(2, 'B2345d63/2024', '2024-02-03', 'shop', 'To Home', 130.00),
(2, 'B23456f4/2024', '2024-01-02', 'shop', 'Holiday', 600.00),
(2, 'B234w565/2024', '2024-03-05', 'shop', 'To home', 410.00),
(3, 'B2345q66/2024', '2024-03-01', 'shop', 'Biriyani', 110.00),
(3, 'B23456t77/2024', '2024-03-03', 'shop', 'Coffee and Snacks', 40.00),
(3, 'B234h568/2024', '2024-03-02', 'shop', 'Oonu', 50),
(4, 'B234b5679/2024', '2024-03-01', 'shop', 'Second show', 199.00),
(4, 'B2345j60/2024', '2024-02-03', 'person', 'Camping', 2500.00),
(4, 'B23156i7/2024', '2024-02-02', 'category', 'First show', 199.00),
(4, 'B232a567/2024', '2024-03-05', 'person', 'Second show', 199.00),
(5, 'B2343w567/2024', '2024-03-01', 'shop', 'Health insurance', 1499.00),
(5, 'B23454e67/2024', '2024-03-03', 'person', 'Doctor visit', 597.00),
(5, 'B234557r/2024', '2024-03-02', 'category', 'Medicines', 197.00),
(6, 'B23456o7/2024', '2024-03-01', 'shop', 'Internet, Cable and Landline', 399.00),
(6, 'B234577p/2024', '2024-03-03', 'shop', 'Drinking Water', 597.00),
(6, 'B23458r7/2024', '2024-03-02', 'shop', 'Electricity bill', 1970.00),
(6, 'B2345l887/2024', '2024-03-01', 'shop', 'Internet, Cable, Landline', 87.00),
(7, 'B23456i99/2024', '2024-03-01', 'shop', 'Bike repair', 200.00),
(7, 'B274567u/2024', '2024-03-03', 'shop', 'Borrow', 500.00);


select * from billTable;
drop table billTable;

select fs_main_id , sum(amount), data from billTable group by fs_main_id, data;

SELECT fs_main_id, 
       SUM(amount) AS total_amount, 
       FORMAT(data, 'yyyy-MM') AS year_month
FROM billTable
WHERE FORMAT(data, 'yyyy-MM') = '2024-05'
GROUP BY fs_main_id, FORMAT(data, 'yyyy-MM');

SELECT fs_main_id, 
       SUM(amount) AS total_amount, 
       FORMAT(data, 'yyyy-MM') AS year_month
FROM billTable
WHERE YEAR(data)= YEAR('2024-03-24') AND MONTH(data)=MONTH('2024-03-24')
GROUP BY fs_main_id, FORMAT(data, 'yyyy-MM');


create table itemsList(items_id int primary key identity(1,1), main_id int references mainList(main_id) not null, items_name varchar(100) unique);
insert into itemsList (main_id, items_name) values
(1, 'milk'),
(1, 'meat'),
(1, 'fruits'),
(1, 'vegetables'),
(2, 'bus'),
(2, 'fuel'),
(2, 'train'),
(3, 'dineout'),
(3, 'swiggy'),
(3, 'zomato'),
(4, 'leisure'),
(4, 'fun'),
(5, 'medical insurance'),
(5, 'doctor visit'),
(6, 'internet'),
(6, 'electricity'),
(6, 'water'),
(7, 'others');
select * from itemsList;

update mainList set total=( select sum(amount) from billTable where main_id= 7) where main_id= 7;

select sum(total) from mainList;
select items_name from itemsList;
select items_name from itemsList where main_id=1;
select [desc] from billTable where fs_main_id=1;




-- to add data
create procedure addBill (
@fs_main_id int,
@bill_no  varchar(50),
@data  date,
@exps_catgry varchar(100),
@desc varchar(50),
@amount  decimal(10,2)
)
as 
begin
insert into billTable values(@fs_main_id, @bill_no, @data,@exps_catgry, @desc, @amount )
end;
exec addBill 
@fs_main_id = 4,
@bill_no = 'rF3GH4w563',
@data = '2024-05-11',
@exps_catgry = 'person',
@desc = 'TOMATO, COMWW',
@amount = 102.90;



-- delete table data
create procedure deleteData(
@item_id int
)
as
begin 
delete from billTable where b_id = @item_id;
end;
exec deleteData @item_id = 35;

--to edit Data
create procedure editData(
@b_id int,
@fs_main_id int,
@bill_no  varchar(50),
@data  date,
@exps_catgry varchar(100),
@desc varchar(50),
@amount  decimal(10,2)
)
as
begin
update billTable set 
fs_main_id= @fs_main_id,
bill_no= @bill_no,
[data]= @data,
expense_category = @exps_catgry ,
[desc]= @desc,
amount = @amount
 where b_id = @b_id;
end;
exec editData 
@b_id = 36,
@fs_main_id =4,
@bill_no  = 'ASDFGHJK',
@data = '2020-01-01',
@exps_catgry = 'person',
@desc = 'asd dfg hjk ',
@amount  = 145.55;


-- to get each card details
create procedure spendDetails (
@cardId int,
@data date
)
as 
begin
SELECT m.main_id, m.spendCategories, b.fs_main_id, b.bill_no, b.[data], b.expense_category, b.[desc], b.amount 
FROM mainList m
JOIN billTable b ON m.main_id = b.fs_main_id
WHERE m.main_id = @cardId and  YEAR(b.[data]) = YEAR(@data) and MONTH(b.[data]) = MONTH(@data);
end;
exec spendDetails @cardId=2, @data='2024-03-03';

drop procedure spendDetails;

--inside card d- heading and total
create procedure headSum(
@fs_id int,
@data date
)
as 
begin
--select top 1 ml.spendCategories, ml.total , bt.[data] from mainList ml inner join billTable bt  on ml.main_id = bt.fs_main_id    where bt.fs_main_id = @fs_id and YEAR(bt.[data]) = YEAR(@data) AND MONTH(bt.[data]) = MONTH(@data) order by ml.spendCategories;
select distinct ml.spendCategories, ml.total , FORMAT(bt.[data], 'yyyy-MM') as 'Expense Month'  from mainList ml inner join billTable bt  on ml.main_id = bt.fs_main_id    where bt.fs_main_id = @fs_id and YEAR(bt.[data]) = YEAR(@data) AND MONTH(bt.[data]) = MONTH(@data) order by ml.spendCategories;
end;
exec headSum @fs_id =  2, @data = '2024-02-05';

drop procedure headSum;



-- get data  ( home page data)
create procedure getData( 
@data date
)
as 
begin
SELECT
    ml.spendCategories AS Item,
    ml.total AS Total,
    STRING_AGG(il.items_name, ', ') AS items_list,
    FORMAT(bt.[data], 'yyyy-MM') AS YearMonth
FROM
    mainList ml
JOIN
    billTable bt ON ml.main_id = bt.fs_main_id
JOIN
    itemsList il ON ml.main_id = il.main_id
WHERE
    YEAR(bt.[data]) = YEAR(@data) AND MONTH(bt.[data]) = MONTH(@data)
GROUP BY
    ml.spendCategories,
	ml.total,
    FORMAT(bt.[data], 'yyyy-MM')
end;
exec getData @data='2024-02-05';




