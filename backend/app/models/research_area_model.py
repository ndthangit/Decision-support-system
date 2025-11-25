from sqlmodel import Field, SQLModel, Relationship
import uuid

class ResearchArea(SQLModel, table=True):
    __tablename__ = "research_area"
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    name: str = Field(default=None, max_length=255)
    description: str = Field(default=None, max_length=255)
