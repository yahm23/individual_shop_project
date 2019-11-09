DROP TABLE records;
DROP TABLE record_labels;
DROP TABLE artists;


CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE record_labels(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  contact_info VARCHAR(255)
);

CREATE TABLE records(
  id SERIAL4,
  name VARCHAR(255),
  description VARCHAR(255),
  genre VARCHAR(255),
  buy_cost INT8,
  sell_cost INT8,
  artist_id INT4,
  record_label_id INT4,
  quantity INT4
);
