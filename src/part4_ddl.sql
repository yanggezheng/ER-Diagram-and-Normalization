DROP TABLE IF EXISTS event;
CREATE TABLE event
(   
    event_id serial,
    report_id text,
    created_date date,
    event_date date,
    patient_age numeric,
    age_units text,
    sex text,
    PRIMARY KEY (event_id)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product
(
    product_id serial,
    description text,
    product_code text,
    product text,
    product_type text,
    PRIMARY KEY (product_id)
);

DROP TABLE IF EXISTS symptom;
CREATE TABLE symptom
(
    terms text,
    term_id serial,
    PRIMARY KEY (term_id)
);

DROP TABLE IF EXISTS outcomes;
CREATE TABLE outcomes
(
    outcome text,
    outcome_id serial,
    PRIMARY KEY (outcome_id)
);

ALTER TABLE IF EXISTS event
    ADD FOREIGN KEY (event_id)
    REFERENCES product (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event
    ADD FOREIGN KEY (event_id)
    REFERENCES symptom (term_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event
    ADD FOREIGN KEY (event_id)
    REFERENCES outcomes (outcome_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;