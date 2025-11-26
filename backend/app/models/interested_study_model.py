from sqlmodel import Field, SQLModel
import uuid

class InterestedStudy(SQLModel, table=True):
    __tablename__ = "interested_study"
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    name: str = Field(default=None, unique=True, max_length=255)