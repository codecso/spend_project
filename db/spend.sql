DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  tag_id int REFERENCES tags(id),
  merchant_id int REFERENCES merchants(id),
  timing VARCHAR(255),
  amount INT
);
