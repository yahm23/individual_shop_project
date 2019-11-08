DROP TABLE records;
DROP TABLE record_labels;
DROP TABLE artists;


CREATE TABLE artists(
  id SERIAL4,
  name VARCHAR(255)
);

CREATE TABLE record_labels(
  id SERIAL4,
  name VARCHAR(255),
  contact_info VARCHAR(255)
);

CREATE TABLE records(
  id SERIAL4,
  name VARCHAR(255),
  description VARCHAR(255),
  genre VARCHAR(255),
  buy_cost INT4,
  sell_cost INT4,
  artist_id INT4 REFERENCES FROM artists(id),
  record_label_id INT4 REFERENCES FROM record_labels(id)
  quantity INT4
);
