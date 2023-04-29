-- Table: public.departments

-- DROP TABLE IF EXISTS public.departments;

CREATE TABLE IF NOT EXISTS public.departments
(
    dept_num text COLLATE pg_catalog."default" NOT NULL,
    dept_name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (dept_num)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.departments
    OWNER to postgres;
		
-- Table: public.dept_mgr

-- DROP TABLE IF EXISTS public.dept_mgr;

CREATE TABLE IF NOT EXISTS public.dept_mgr
(
    dm_dept_num text COLLATE pg_catalog."default" NOT NULL,
    dm_emp_num integer NOT NULL,
    CONSTRAINT "fk_DEPT_MGR_DM_DEPT_NUM" FOREIGN KEY (dm_dept_num)
        REFERENCES public.departments (dept_num) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_DEPT_MGR_DM_EMP_NUM" FOREIGN KEY (dm_emp_num)
        REFERENCES public.employees (emp_num) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_mgr
    OWNER to postgres;
		
		
		
-- Table: public.dept_xref

-- DROP TABLE IF EXISTS public.dept_xref;

CREATE TABLE IF NOT EXISTS public.dept_xref
(
    dx_emp_num integer NOT NULL,
    dx_dept_num text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "fk_DEPT_XREF_DX_DEPT_NUM" FOREIGN KEY (dx_dept_num)
        REFERENCES public.departments (dept_num) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_DEPT_XREF_DX_EMP_NUM" FOREIGN KEY (dx_emp_num)
        REFERENCES public.employees (emp_num) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dept_xref
    OWNER to postgres;
		-- Table: public.employees

-- DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_num integer NOT NULL,
    emp_title_id text COLLATE pg_catalog."default" NOT NULL,
    emp_birthdate date NOT NULL,
    emp_fname text COLLATE pg_catalog."default" NOT NULL,
    emp_lname text COLLATE pg_catalog."default" NOT NULL,
    emp_sex text COLLATE pg_catalog."default" NOT NULL,
    emp_hire_date date NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (emp_num),
    CONSTRAINT "fk_EMPLOYEES_EMP_TITLE_ID" FOREIGN KEY (emp_title_id)
        REFERENCES public.titles (title_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;
		
-- Table: public.salaries

-- DROP TABLE IF EXISTS public.salaries;

CREATE TABLE IF NOT EXISTS public.salaries
(
    sal_emp_num integer NOT NULL,
    salary money NOT NULL,
    CONSTRAINT "uc_SALARIES_SAL_EMP_NUM" UNIQUE (sal_emp_num),
    CONSTRAINT "fk_SALARIES_SAL_EMP_NUM" FOREIGN KEY (sal_emp_num)
        REFERENCES public.employees (emp_num) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.salaries
    OWNER to postgres;
		
		
-- Table: public.titles

-- DROP TABLE IF EXISTS public.titles;

CREATE TABLE IF NOT EXISTS public.titles
(
    title_id text COLLATE pg_catalog."default" NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (title_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.titles
    OWNER to postgres;