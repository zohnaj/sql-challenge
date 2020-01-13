DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_employee;

CREATE TABLE "employees" (
  "emp_no" INT,
  "birth_date" DATE,
  "first_name" VARCHAR(30),
  "last_name" VARCHAR(30),
  "gender" VARCHAR(30),
  "hire_date" DATE,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "departments" (
  "dept_no" VARCHAR(30),
  "dept_name" VARCHAR(30),
  PRIMARY KEY ("dept_no"), 
  UNIQUE (dept_name)
);

CREATE TABLE "dept_manager" (
  "dept_no" VARCHAR(30),
  "emp_no" INT,
  "from_date" DATE,
  "to_date" DATE,
  FOREIGN KEY ("dept_no") REFERENCES departments ("dept_no"),
  PRIMARY KEY ("emp_no", "dept_no")
);

-- CREATE INDEX "FK" ON  "dept_manager" ("dept_no", "emp_no");

CREATE TABLE "dept_employee" (
  "emp_no" INT,
  "dept_no" VARCHAR(30),
  "from_date" DATE,
  "to_date" DATE,
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

-- CREATE INDEX "FK" ON  "dept_employee" ("emp_no", "dept_no");

CREATE TABLE "titles" (
  "emp_no" INT,
  "title" VARCHAR(30),
  "from_date" DATE,
  "to_date" DATE,
   PRIMARY KEY (emp_no, from_date)
);

-- CREATE INDEX "FK" ON  "titles" ("emp_no");
CREATE TABLE "salaries" (
  "emp_no" INT,
  "salary" INT,
  "from_date" DATE,
  "to_date" DATE,
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
   PRIMARY KEY (emp_no, from_date)
);

-- CREATE INDEX "FK" ON  "salaries" ("emp_no");

