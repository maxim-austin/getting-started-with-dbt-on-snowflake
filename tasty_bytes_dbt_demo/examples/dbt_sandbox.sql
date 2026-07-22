-- SQL sandbox for Tasty Bytes dbt demo
-- Co-authored with CoCo
SHOW TABLES IN DATABASE tasty_bytes_dbt_db;

SHOW VIEWS IN DATABASE tasty_bytes_dbt_db;

CREATE USER IF NOT EXISTS github_actions_service_user
  TYPE = SERVICE
  WORKLOAD_IDENTITY = (
    TYPE = OIDC
    ISSUER = 'https://token.actions.githubusercontent.com',
    SUBJECT = 'repo:github.com/maxim-austin/getting-started-with-dbt-on-snowflake:environment:prod'
  )
  DEFAULT_ROLE = ACCOUNTADMIN
  COMMENT = 'Service user for GitHub Actions';

GRANT ROLE ACCOUNTADMIN TO USER github_actions_service_user;

ALTER USER github_actions_service_user SET DEFAULT_WAREHOUSE = 'TASTY_BYTES_DBT_WH';

CREATE SCHEMA IF NOT EXISTS tasty_bytes_dbt_db.mkrupenin
CLONE tasty_bytes_dbt_db.dev;
