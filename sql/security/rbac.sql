-- Role Based Access Control
-- Create roles
CREATE ROLE data_engineer_role NOLOGIN;
CREATE ROLE data_analyst_role NOLOGIN;
CREATE ROLE admin_role NOLOGIN;
CREATE ROLE researcher_role NOLOGIN;

-- Grant permissions to the roles;
-- Data engineering role permissions: full read/write on the operations and inventory
GRANT USAGE ON SCHEMA operations, inventory TO data_engineer_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA operations, inventory TO data_engineer_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA operations, inventory TO data_engineer_role;


-- Assignment 1: Grant the Data Engineering Role Read-Only access to all tables in the research schema in the next

-- Data Analyst Permissions: Full access to the analytics schema and read-only access on operations, inventory.
GRANT USAGE ON SCHEMA analytics, operations, inventory TO data_analyst_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA analytics TO data_analyst_role;
GRANT SELECT ON ALL TABLES IN SCHEMA operations, inventory TO data_analyst_role;
REVOKE SELECT ON operations.customers FROM data_analyst_role;

-- Assignment 2: Grant the researcher role full read/write access to the research schema and read access to the drugs table.

-- Admin role: full access to all SCHEMAS
GRANT ALL PRIVILEGES ON SCHEMA analytics, inventory, operations, research TO admin_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA analytics, inventory, operations, research TO admin_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA analytics, inventory, operations, research TO admin_role;

-- Create the users
CREATE USER Chinyere WITH PASSWORD 'omk*#123'; --DE
CREATE USER Mohammed WITH PASSWORD '*moh492#';  --DA
CREATE USER Kolawole WITH PASSWORD 'Ace@123'; --DA

-- grant permissions to users based on thier roles
GRANT data_engineer_role TO Chinyere;
GRANT data_analyst_role TO Mohammed, Kolawole;

-- Assignment 3: We just onboarded 4 new team members in LZ Pharma (Crainsor, Temitayo, Vincent, Anthony). 
Anthony was onboarded as a Database Administrator, Vincent was onboarded as a researcher, Temitayo was onboarded as a Business Analyst, and Crainsor was onboarded as a data engineer. Using the information given, create and grant user permissions based on their appropriate roles.```

-- Assignment 1:Grant the Data Engineering Role Read-Only access to all tables in the research schema in the next
CREATE ROLE data_engineering;
GRANT USAGE ON SCHEMA research TO data_engineering;
GRANT SELECT ON ALL TABLES IN SCHEMA research TO data_engineering;
ALTER DEFAULT PRIVILEGES IN SCHEMA research
GRANT SELECT ON TABLES TO data_engineering;

-- Assignment 2: Grant the researcher role full read/write access to the research schema and read access to the drugs table.
-- Grant full read/write access to the research schema
CREATE ROLE researcher;
GRANT USAGE ON SCHEMA research TO researcher; 
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA research TO researcher;

-- Ensure future tables inherit permissions
ALTER DEFAULT PRIVILEGES IN SCHEMA research
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO researcher;

-- Read-only access to the drugs table 
GRANT SELECT ON inventory.drugs TO researcher;

-- Assignment 3: We just onboarded 4 new team members in LZ Pharma (Crainsor, Temitayo, Vincent, Anthony).
Anthony was onboarded as a Database Administrator, Vincent was onboarded as a researcher, Temitayo was onboarded as a Business Analyst, and Crainsor was onboarded as a data engineer. Using the information given, create and grant user permissions based on their appropriate roles.
--create the user
CREATE USER Crainsor WITH PASSWORD 'Cmk*#123'; --DE
CREATE USER Temitayo WITH PASSWORD '*Toh492*';  --BA
CREATE USER Vincent WITH PASSWORD '*Voh492*'; --R
CREATE USER Anthony WITH PASSWORD 'ANYY8*';--DA

-- grant permissions to users based on thier rolesCREATE ROLE researcher_role;
CREATE ROLE Database_Administrator_role;
CREATE ROLE Business_Analyst_role 

-- grant permissions to users based on thier roles
GRANT data_engineer_role TO Crainsor;
GRANT Business_Analyst_role TO Temitayo;
GRANT researcher_role TO Vincent;
GRANT Database_Administrator_role TO Anthony;




