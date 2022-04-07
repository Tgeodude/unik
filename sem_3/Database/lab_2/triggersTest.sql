--Тестирование триггера по подсчету колличества вида бракованной продукции
select * from type_of_defective_product;
insert into type_of_defective_product(type_prof, ID_type) values ('Раскол металла', 1);
update type_of_defective_product set type_prof = 'Выгорание сплава' where ID_type = 1;
delete from type_of_defective_product where ID_type = 1;

--Тестирование тригерра по подсчету суммы потерянной цены с продажи продукции
select * from lost_price_from_product_sales;
insert into lost_price_from_product_sales(price, ID_price) values (15000, 1);
update lost_price_from_product_sales set price = 17000 where ID_price = 1;
delete from lost_price_from_product_sales where ID_price = 1;

--Тестирование тригерра по расчету и выводу колличества дней после выявления брака
select * from date_of_registration_of_defective_products;
insert into date_of_registration_of_defective_products(date_of_registr, ID_date) values (to_date('2019-03-06', 'YYYY-MM-DD'), 1);
update date_of_registration_of_defective_products set date_of_registr = to_date('2020-07-02', 'YYYY-MM-DD') where ID_date = 1;
delete from date_of_registration_of_defective_products where ID_date = 1;

--Тестирование тригерра по расчету какую часть составляет обьем бракованного продукта от всего обьема бракованной продукции
select * from volume_of_defective_products;
insert into volume_of_defective_products(volume, ID_volume) values (130, 1);
update volume_of_defective_products set volume = 160 where ID_volume = 1;
delete from volume_of_defective_products where ID_volume = 1;