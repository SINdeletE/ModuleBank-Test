from datetime import datetime

import oracledb
from dotenv import dotenv_values

config = dotenv_values(".env")
config_dsn = (
    f"{config['ORACLE_HOST']}:"
    f"{config['ORACLE_PORT']}/"
    f"{config['ORACLE_SERVICE_NAME']}"
)


def test_integration_connection():
    with oracledb.connect(user="PDBADMIN", password=config["ORACLE_PWD"],
        dsn=config_dsn) as connection, connection.cursor() as cursor:
            sql = "select sysdate from dual"
            exc = cursor.execute(sql)
            assert exc is not None, "No cursor after execution"

            row = cursor.fetchone()
            assert row is not None, "No result"
            assert isinstance(row[0], datetime)
