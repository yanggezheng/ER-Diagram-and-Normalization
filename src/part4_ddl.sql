
CREATE TABLE IF NOT EXISTS event
(
    report_id text,
    created_date date,
    event_date date,
    patient_age numeric,
    age_units text,
    sex text,
    event_id serial,
    product_code text,
    product_type text,
    PRIMARY KEY (event_id)
);

CREATE TABLE IF NOT EXISTS product
(
    description text,
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

CREATE TABLE IF NOT EXISTS event_product
(
    event_event_id serial,
    product_product_id serial
);

CREATE TABLE IF NOT EXISTS event_outcomes
(
    event_event_id serial,
    outcomes_outcome_id serial
);

CREATE TABLE IF NOT EXISTS event_symptom
(
    event_event_id serial,
    symptom_term_id serial
);

CREATE TABLE IF NOT EXISTS product_symptom
(
    product_product_id serial,
    symptom_term_id serial
);

CREATE TABLE IF NOT EXISTS product_outcomes
(
    product_product_id serial,
    outcomes_outcome_id serial
);

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


ALTER TABLE IF EXISTS event_product
    ADD FOREIGN KEY (event_event_id)
    REFERENCES event (event_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event_product
    ADD FOREIGN KEY (product_product_id)
    REFERENCES product (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event_outcomes
    ADD FOREIGN KEY (event_event_id)
    REFERENCES event (event_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event_outcomes
    ADD FOREIGN KEY (outcomes_outcome_id)
    REFERENCES outcomes (outcome_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event_symptom
    ADD FOREIGN KEY (event_event_id)
    REFERENCES event (event_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS event_symptom
    ADD FOREIGN KEY (symptom_term_id)
    REFERENCES symptom (term_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS product_symptom
    ADD FOREIGN KEY (product_product_id)
    REFERENCES product (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS product_symptom
    ADD FOREIGN KEY (symptom_term_id)
    REFERENCES symptom (term_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS product_outcomes
    ADD FOREIGN KEY (product_product_id)
    REFERENCES product (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS product_outcomes
    ADD FOREIGN KEY (outcomes_outcome_id)
    REFERENCES outcomes (outcome_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

