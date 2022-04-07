--Подсчет колличества вида бракованной продукции
create or replace function func_count_type()
returns trigger as
$$
declare
        counting int;
begin
        counting = (select count(type_prod) as count from type_of_defective_product);
        raise notice 'count of type defective product: %', counting;
    return null;
end
$$
language 'plpgsql';

create trigger trigger_func_count_typeInsUpd
after insert or update
on type_of_defective_product execute procedure func_count_type();

create trigger trigger_func_count_typeDel
after delete
on type_of_defective_product execute procedure func_count_type();

--Подсчет суммы потерянной цены с продажы продукции
create or replace function func_count_sum_lost_price()
returns trigger as
$$
declare 
        sum_price int;
begin
        sum_price = (select sum(price) from lost_price_from_product_sales);
        raise notice 'lost price sum: %', sum_price;
        return null;
end
$$
language 'plpgsql';

create trigger trigger_func_count_sum_lost_priceInsUpt
after insert or update
on lost_price_from_product_sales execute procedure func_count_sum_lost_price();

create trigger trigger_func_count_sum_lost_priceDel
after delete
on lost_price_from_product_sales execute procedure func_count_sum_lost_price();

--Расчет и вывод колличества дней после выявления брака
create or replace function func_date_register()
returns trigger as
$$
declare
        datenow date;
        date_product date;
        interval int;
begin
        datenow = (select now());
        date_product = (select "date_of_registr" from "date_of_registration_of_defective_products" order by "id_date" desc limit 1);
        interval= datenow - date_product;
        raise notice 'days elapsed: %', interval;
        return null;
end
$$
language 'plpgsql';

create trigger trigger_func_date_registerInsUpt
after insert or update
on date_of_registration_of_defective_products execute procedure func_date_register();

create trigger trigger_func_date_registerDel
after delete
on date_of_registration_of_defective_products execute procedure func_date_register();

--Расчет какую часть составляет обьем бракованного продукта от всего обьема бракованной продукции
create or replace function func_volume_part()
returns trigger as
$$
declare
        sum_volume real;
        value_last_volume real;
        part_volume real;
begin
        sum_volume = (select sum(volume) from volume_of_defective_products);
        value_last_volume = (select "volume" from "volume_of_defective_products" order by "id_volume" desc limit 1);
        part_volume = value_last_volume / sum_volume;
        raise notice 'part of volume: %', part_volume;
        return null;
end
$$
language 'plpgsql';

create trigger trigger_func_volume_partInsUpt
after insert or update 
on volume_of_defective_products execute procedure func_volume_part();

create trigger trigger_func_volume_partDel
after delete
on volume_of_defective_products execute procedure func_volume_part();

