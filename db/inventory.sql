
DROP TABLE stocks;
DROP TABLE products CASCADE;
DROP TABLE manufacturers CASCADE;

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(255),
  description TEXT,
  buy_cost INT4,
  sell_cost INT4
);

CREATE TABLE manufacturers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  tel_no VARCHAR(255),
  rep_name VARCHAR(255)
);

CREATE TABLE stocks (
  id SERIAL8 PRIMARY KEY,
  product_id INT4 REFERENCES products(id) ON DELETE CASCADE,
  manufacturer_id INT4 REFERENCES manufacturers(id) ON DELETE CASCADE,
  quantity INT4
);
