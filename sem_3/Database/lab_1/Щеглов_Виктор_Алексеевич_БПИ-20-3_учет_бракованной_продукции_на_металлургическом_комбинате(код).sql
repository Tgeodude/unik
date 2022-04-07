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
)