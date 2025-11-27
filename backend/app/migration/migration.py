from pathlib import Path

from app.databases.postgres import engine


async def _init_sql() -> None:
    sql_path = Path(__file__).resolve().parents[3] / "data" / "init.sql"
    if sql_path.exists():
        try:
            sql_text = sql_path.read_text(encoding="utf-8")
            commands = [cmd.strip() for cmd in sql_text.split(';') if cmd.strip()]
            async with engine.begin() as conn:
                for cmd in commands:
                    await conn.exec_driver_sql(cmd.lower())
        except Exception as ex:
            print(f"Migration: error reading/executing init.sql: {ex}")


async def migrate_database() -> None:
    await _init_sql()
    return
