DROP TABLE IF EXISTS characteristic_reviews;
DROP TABLE IF EXISTS reviews_photos;
DROP TABLE IF EXISTS characteristics;
DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  product INTEGER,
  rating INTEGER,
  date TIMESTAMP,
  summary VARCHAR(150),
  body VARCHAR(1000),
  recommend BOOLEAN,
  reported BOOLEAN,
  reviewer_name VARCHAR(35),
  reviewer_email VARCHAR(50),
  response VARCHAR(1000),
  helpfulness INTEGER
);

CREATE TABLE characteristics (
  id SERIAL PRIMARY KEY,
  product_id INTEGER,
  name VARCHAR(7)
);

CREATE TABLE characteristic_reviews (
  id SERIAL PRIMARY KEY,
  characteristic_id INTEGER,
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id),
  review_id INTEGER,
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  value INTEGER
);

CREATE TABLE reviews_photos (
  id SERIAL PRIMARY KEY,
  review_id INTEGER,
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  url VARCHAR(200)
);

CREATE INDEX review_id_index ON reviews(review_id);
CREATE INDEX reviews_photos_review_id_index ON reviews_photos(review_id);
CREATE INDEX product_index ON reviews(product);
CREATE INDEX characteristic_reviews_characteristic_id_index ON characteristic_reviews(characteristic_id);
CREATE INDEX characteristics_product_id_index ON characteristics(product_id);