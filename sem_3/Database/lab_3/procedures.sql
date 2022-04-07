--Подсчет кол-ва бракованных продуктов по указанной дате
create function get_product_by(date_registr date)
returns int as
$$
declare
        counting int;
        find_id int;
begin
        find_id = (select date_of_registration_of_defective_products.id_date from date_of_registration_of_defective_products  where date_of_registration_of_defective_products.date_of_registr = date_registr);
        counting = (select count(*) from defective_product  where ID_date = find_id);
        return counting;
end
$$
language 'plpgsql';

--Поиск брака по ID
create function get_prod_ID(find_id int)
returns varchar(50) as
$$
declare
        prod_found varchar(50);
begin
        prod_found = (select name_product from defective_product where ID_primary_production = find_id);
        return prod_found;
end
$$
language 'plpgsql';

--Процедура добавления нового объема
create procedure insert_volume_of_defective_products(value_volume int)
language sql
as
$$
insert into volume_of_defective_products(volume, ID_volume)
values
(value_volume, 6);
$$