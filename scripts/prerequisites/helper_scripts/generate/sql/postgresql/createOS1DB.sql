-- create user ${youruser1}
CREATE ROLE ${youruser1} WITH INHERIT LOGIN ENCRYPTED PASSWORD '${yourpassword}';

-- create database ${os_name}
create database ${os_name} owner ${youruser1} template template0 encoding UTF8 ;
revoke connect on database ${os_name} from public;
grant all privileges on database ${os_name} to ${youruser1};
grant connect, temp, create on database ${os_name} to ${youruser1};

-- please modify location follow your requirement
create tablespace ${os_name}_tbs owner ${youruser1} location '/pgsqldata/${os_name}';
grant create on tablespace ${os_name}_tbs to ${youruser1};  

-- create a schema for ${os_name} and set the default
-- connect to the respective database before executing the below commands
\connect ${os_name};
CREATE SCHEMA IF NOT EXISTS AUTHORIZATION ${youruser1};
SET ROLE ${youruser1};
ALTER DATABASE ${os_name} SET search_path TO ${youruser1};
