CREATE TABLE IF NOT EXISTS event
(
    report_id text,
    created_date date,
    event_date date,
    patient_age numeric,
    age_units text,
    sex text,
    event_id serial,
    PRIMARY KEY (event_id)
);

CREATE TABLE IF NOT EXISTS product
(
    description text,
    product_code text,
    product text,
    product_id serial,
    PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS symptom
(
    terms text,
    term_id serial,
    PRIMARY KEY (term_id)
);

CREATE TABLE IF NOT EXISTS outcomes
(
    outcome text,
    outcome_id serial,
    PRIMARY KEY (outcome_id)
);

CREATE TABLE IF NOT EXISTS outcomes_symptom
(
    outcomes_outcome_id serial,
    symptom_term_id serial
);

CREATE TABLE IF NOT EXISTS product_type
(
    product_type_id serial,
    product_type text,
    PRIMARY KEY (product_type_id)
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


ALTER TABLE IF EXISTS outcomes_symptom
    ADD FOREIGN KEY (outcomes_outcome_id)
    REFERENCES outcomes (outcome_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS outcomes_symptom
    ADD FOREIGN KEY (symptom_term_id)
    REFERENCES symptom (term_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS product_type
    ADD FOREIGN KEY (product_type_id)
    REFERENCES product (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

