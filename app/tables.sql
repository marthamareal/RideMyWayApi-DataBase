 CREATE TABLE IF NOT EXISTS USERS  (
  ID SERIAL PRIMARY KEY NOT NULL,
  F_NAME VARCHAR(45) NOT NULL ,
  L_NAME VARCHAR(45) NOT NULL ,
  EMAIL  VARCHAR(50) NOT NULL UNIQUE ,
  CITY VARCHAR(50) NOT NULL ,
  PHONE_NO VARCHAR(25) NOT NULL ,
  PASSWORD VARCHAR(45) NOT NULL,
  LOGGED_IN BOOLEAN DEFAULT FALSE
 );

  CREATE TABLE IF NOT EXISTS RIDES  (
  ID SERIAL PRIMARY KEY NOT NULL,
  REF_NO VARCHAR(45) NOT NULL UNIQUE ,
  SOURCE VARCHAR(45) NOT NULL ,
  DESTINATION  VARCHAR(50) NOT NULL,
  DATE VARCHAR(50) NOT NULL ,
  CREATOR_ID INTEGER NOT NULL ,
  TIME VARCHAR(25) NOT NULL ,
  REQUESTS_NO VARCHAR(45) NOT NULL,
  FOREIGN KEY (CREATOR_ID) REFERENCES users (ID)
 );

  CREATE TABLE IF NOT EXISTS REQUESTS  (
  ID SERIAL PRIMARY KEY NOT NULL,
  RIDE_ID INTEGER NOT NULL ,
  REQUESTOR_ID INTEGER NOT NULL,
  STATUS VARCHAR(45) NOT NULL,
  FOREIGN KEY (RIDE_ID) REFERENCES rides (ID),
  FOREIGN KEY (REQUESTOR_ID) REFERENCES users (ID)
 );
