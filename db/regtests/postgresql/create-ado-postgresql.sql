/* Copied from ado-postgresql.sql*/
/* File generated automatically by dynamo */
/* Entity types */
CREATE TABLE entity_type (
  /* the entity type identifier */
  "id" SERIAL,
  /* the entity type name (table name) */
  "name" VARCHAR(127) UNIQUE NOT NULL,
  PRIMARY KEY ("id")
);
/* Sequence generator */
CREATE TABLE sequence (
  /* the sequence name */
  "name" VARCHAR(127) NOT NULL,
  /* the sequence record version */
  "version" int ,
  /* the sequence value */
  "value" BIGINT ,
  /* the sequence block size */
  "block_size" BIGINT ,
  PRIMARY KEY ("name")
);
INSERT INTO entity_type (name) VALUES
('entity_type')
,('sequence')
;
/* Copied from ado-postgresql.sql*/
/* File generated automatically by dynamo */
/* This is the Audit_Info table */
CREATE TABLE audit_info (
  /*  */
  "id" BIGINT ,
  /* the entity id */
  "entity_id" BIGINT ,
  /* the entity type */
  "entity_type" INTEGER NOT NULL,
  /* the old value */
  "old_value" VARCHAR(255) ,
  /* the new value */
  "new_value" VARCHAR(255) ,
  /* the audit date */
  "date" DATE NOT NULL,
  PRIMARY KEY ("id")
);
/* This is the User email table */
CREATE TABLE audit_email (
  /*  */
  "id" BIGINT NOT NULL,
  /* the user email address */
  "user_email" VARCHAR(32) ,
  /* the user email status */
  "email_status" INTEGER ,
  PRIMARY KEY ("id")
);
/* The Comment table records a user comment associated with a database entity.
                 The comment can be associated with any other database record. */
CREATE TABLE TEST_COMMENTS (
  /* the comment identifier */
  "id" INTEGER ,
  /* the comment version. */
  "version" INTEGER NOT NULL,
  /* the comment publication date. */
  "date" TIMESTAMP NOT NULL,
  /* the comment message. */
  "message" VARCHAR(256) NOT NULL,
  /* the entity identifier to which this comment is associated. */
  "entity_id" INTEGER NOT NULL,
  /* the user who posted this comment */
  "user_fk" INTEGER NOT NULL,
  /* the entity type that correspond to the entity associated with this comment. */
  "entity__type_fk" INTEGER NOT NULL,
  PRIMARY KEY ("id")
);
/*  */
CREATE TABLE test_image (
  /* the image identifier */
  "id" INTEGER ,
  /* the image version. */
  "version" INTEGER NOT NULL,
  /* the message creation date */
  "create_date" TIMESTAMP NOT NULL,
  /* the image data */
  "image" BYTEA ,
  PRIMARY KEY ("id")
);
/* Record representing a user */
CREATE TABLE allocate (
  /* the user id */
  "id" BIGINT NOT NULL,
  /* the allocate version. */
  "version" INTEGER NOT NULL,
  /* the sequence value */
  "name" VARCHAR(255) ,
  PRIMARY KEY ("id")
);
/* Record representing a user */
CREATE TABLE test_user (
  /* the user id */
  "id" BIGINT NOT NULL,
  /* the comment version. */
  "version" INTEGER NOT NULL,
  /* the sequence value */
  "value" BIGINT NOT NULL,
  /* the user name */
  "name" VARCHAR(255) ,
  /* the user name */
  "select" VARCHAR(255) ,
  PRIMARY KEY ("id")
);
/* Record representing a user */
CREATE TABLE test_nullable_table (
  /* the user id */
  "id" BIGINT NOT NULL,
  /* the comment version. */
  "version" INTEGER NOT NULL,
  /* an identifier value */
  "id_value" BIGINT ,
  /* an integer value */
  "int_value" INTEGER ,
  /* a boolean value */
  "bool_value" BOOLEAN ,
  /* a string value */
  "string_value" VARCHAR(255) ,
  /* a time value */
  "time_value" TIMESTAMP ,
  /* an entity value */
  "entity_value" INTEGER ,
  PRIMARY KEY ("id")
);
/* Record representing a user */
CREATE TABLE test_table (
  /* the user id */
  "id" BIGINT NOT NULL,
  /* the comment version. */
  "version" INTEGER NOT NULL,
  /* an identifier value */
  "id_value" BIGINT NOT NULL,
  /* an integer value */
  "int_value" INTEGER NOT NULL,
  /* a boolean value */
  "bool_value" BOOLEAN NOT NULL,
  /* a string value */
  "string_value" VARCHAR(255) NOT NULL,
  /* a time value */
  "time_value" TIMESTAMP NOT NULL,
  /* an entity value */
  "entity_value" INTEGER NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO entity_type (name) VALUES
('audit_info')
,('audit_email')
,('TEST_COMMENTS')
,('test_image')
,('allocate')
,('test_user')
,('test_nullable_table')
,('test_table')
;
