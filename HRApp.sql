CREATE TABLE "employees" (
  "id" integer PRIMARY KEY,
  "firstname" varchar,
  "lastname" varchar,
  "employmentDate" integer,
  "department" integer,
  "position" integer,
  "employmentType" boolean,
  "leave" boolean,
  "training" integer,
  "attendance" integer,
  "created_at" timestamp
);

CREATE TABLE "department" (
  "id" integer PRIMARY KEY,
  "departmentName" varchar,
  "created_at" timestamp
);

CREATE TABLE "jobPosition" (
  "id" integer PRIMARY KEY,
  "position" integer,
  "created_at" timestamp
);

CREATE TABLE "payRoll" (
  "id" integer PRIMARY KEY,
  "hourlyRate" integer,
  "monthlySalary" integer,
  "created_at" timestamp
);

CREATE TABLE "leave" (
  "id" integer PRIMARY KEY,
  "position" integer,
  "leaveReason" varchar,
  "requestDate" integer,
  "created_at" timestamp
);

CREATE TABLE "training" (
  "id" integer PRIMARY KEY,
  "trainingName" varchar,
  
  "created_at" timestamp
);

CREATE TABLE "attendance" (
  "id" integer PRIMARY KEY,
  "date" timestamp,
  "created_at" timestamp
);

ALTER TABLE "jobPosition" ADD FOREIGN KEY ("id") REFERENCES "employees" ("position");

ALTER TABLE "payRoll" ADD FOREIGN KEY ("id") REFERENCES "employees" ("employmentType");

ALTER TABLE "department" ADD FOREIGN KEY ("id") REFERENCES "employees" ("department");

ALTER TABLE "leave" ADD FOREIGN KEY ("id") REFERENCES "employees" ("leave");

CREATE TABLE "employees_training" (
  "employees_training" integer,
  "training_id" integer,
  PRIMARY KEY ("employees_training", "training_id")
);

ALTER TABLE "employees_training" ADD FOREIGN KEY ("employees_training") REFERENCES "employees" ("training");

ALTER TABLE "employees_training" ADD FOREIGN KEY ("training_id") REFERENCES "training" ("id");


ALTER TABLE "attendance" ADD FOREIGN KEY ("id") REFERENCES "employees" ("attendance");