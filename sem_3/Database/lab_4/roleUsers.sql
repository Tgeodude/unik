create user Popov with encrypted password '1234';
create user Smirnov with encrypted password 'qwerty';
create user Ivanov with encrypted password 'db';

create role grandAdmin;
grant grandAdmin to Popov;
grant all privileges on database "faulty_products_at_the_steel_mill" to Popov;

create role volumeInserter;
grant volumeInserter to Smirnov;
grant insert on volume_of_defective_products to volumeInserter;

create role priceViewer;
grant priceViewer to Ivanov;
grant select on lost_price_from_product_sales to priceViewer;