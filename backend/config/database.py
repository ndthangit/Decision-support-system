from sqlmodel import create_engine
from pydantic_settings import BaseSettings
from dotenv import load_dotenv
import os

# Load biến môi trường từ file .env
load_dotenv()
class DatabaseSettings(BaseSettings):
    DB_URL: str = os.getenv("DB_URL")
    DB_NAME: str = os.getenv("DB_NAME")
    DB_USER: str = os.getenv("DB_USER")
    DB_PASSWORD: str = os.getenv("DB_PASSWORD")
    DB_PORT: int = os.getenv("DB_PORT")
    DB_HOST: str = os.getenv("DB_HOST")

database_settings = DatabaseSettings()


DATABASE_URL = f"postgresql://{database_settings.DB_USER}:{database_settings.DB_PASSWORD}@{database_settings.DB_HOST}:{database_settings.DB_PORT}/{database_settings.DB_NAME}"

engine = create_engine(DATABASE_URL, echo=True)

if not engine:
    raise ConnectionError("Database engine not initialized")