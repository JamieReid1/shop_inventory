
DROP TABLE stock_items;
DROP TABLE products;
DROP TABLE manufacturers;

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

CREATE TABLE stock_items (
  id SERIAL8 PRIMARY KEY,
  product_id INT4 REFERENCES products(id),
  manufacturer_id INT4 REFERENCES manufacturers(id),
  quantity INT4 
);
