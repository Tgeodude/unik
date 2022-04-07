create database faulty_products_at_the_steel_mill
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
use faulty_products_at_the_steel_mill;

--Вид бракованной продукции
create table type_of_defective_product
(
    ID_type int not null primary key,
    type_prod varchar(15)
);
--Обьем бракованной продукции
create table volume_of_defective_products
(
    ID_volume int not null primary key,
    volume int not null
);
--Дата регистрации брака
create table date_of_registration_of_defective_products
(
    ID_date int not null primary key,
    date_of_registr date
);
--Отдел в котором произошел брак
create table department_in_which_defective_products_occurred
(
    ID_department int not null primary key,
    department varchar(25)
);
--Процесс дальнейшего действия
create table process_for_further_action_on_defective_products
(
    ID_process_action int not null primary key,
    process_action varchar(20)
);
--Процесс при котором произошел брак
create table the_process_by_which_defective_products_occurred
(
    ID_manufacturing_process int not null primary key,
    manufacturing_process varchar(20)
);
--Потерянная цена с продаж продукции
create table lost_price_from_product_sales
(
    ID_price int not null primary key,
    price int not null
);
--Бракованный продукт
create table defective_product
(
    ID_primary_production int not null primary key,
    name_product varchar(15),
    ID_type int references type_of_defective_product(ID_type),
    ID_volume int references volume_of_defective_products(ID_volume),
    ID_date int references date_of_registration_of_defective_products(ID_date),
    ID_department int references department_in_which_defective_products_occurred(ID_department),
    ID_process_action int references process_for_further_action_on_defective_products(ID_process_action),
    ID_manufacturing_process int references the_process_by_which_defective_products_occurred(ID_manufacturing_process),
    ID_price int references lost_price_from_product_sales(ID_price)
);
--Поставщик продукта после которого произошел брак
create table product_supplier
(
    ID_supplier int not null primary key,
    supplier varchar(20)
);
--Наименование первичного продукта
create table primary_product_name
(
    name_primary_product varchar(20),
    ID_primary_production int references defective_product(ID_primary_production),
    ID_supplier int references product_supplier(ID_supplier)
);
--Виды брака
insert into type_of_defective_product(type_prod, ID_type)
values
('Раскол Металла', 1),
('Выгарание стали', 2),
('Выделение газов', 3);
--Объем брака
insert into volume_of_defective_products(volume, ID_volume)
values
(15000, 1),
(10000, 2),
(5000, 3),
(20000, 4),
(1000, 5);
--Дата когда произошел брак
insert into date_of_registration_of_defective_products(date_of_registr, ID_date)
values
(to_date('2020-07-02', 'YYYY-MM-DD'), 1),
(to_date('2020-06-03', 'YYYY-MM-DD'), 2),
(to_date('2019-10-07', 'YYYY-MM-DD'), 3),
(to_date('2021-11-01', 'YYYY-MM-DD'), 4);
--Отдел где произошел брак
insert into department_in_which_defective_products_occurred(department, ID_department)
values
('Металло прокатный цех', 1),
('Цех окамкование', 2),
('Сталеплавильный цех', 3),
('Цех обработки руды', 4);
--Дальнейшие действия
insert into process_for_further_action_on_defective_products(process_action, ID_process_action)
values
('Переработка брака', 1),
('Продажа брака', 2),
('Утилизация брака', 3);
--Действие при котором произошел брак
insert into the_process_by_which_defective_products_occurred(manufacturing_process, ID_manufacturing_process)
values
('Плавление окатышей', 1),
('Прокат между цехами', 2),
('Обработка руды', 3),
('Обработка окатышей', 4);
--Убытки
insert into lost_price_from_product_sales(price, ID_price)
values
(100000, 1),
(200000, 2),
(400000, 3),
(800000, 4),
(1000000, 5);
--Брак
insert into defective_product(name_product, ID_primary_production, ID_type, ID_volume, ID_date, ID_department, ID_process_action, ID_manufacturing_process, ID_price)
values
('Метал. прутья', 1, 1, 1, 1, 1, 1, 1, 1),
('Стальные шары', 2, 2, 2, 2, 2, 2, 2, 2),
('Стальные листы', 3, 3, 3, 3, 3, 3, 3, 3);
--Поставщик
insert into product_supplier(supplier, ID_supplier)
values
('ООО Веселые горы', 1),
('ГОК Сталь и Металл', 2),
('ГОК Курская руда', 3);
insert into primary_product_name(name_primary_product, ID_primary_production, ID_supplier)
--Первычиный продукт
values
('Руда', 1, 1),
('Цветной металл', 2, 2),
('Черный металл', 3, 3);