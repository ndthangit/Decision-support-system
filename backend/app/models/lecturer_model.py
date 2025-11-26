from .research_area_model import ResearchArea
from .interested_study_model import InterestedStudy
from .links import LecturerResearchAreaLink, LecturerInterestedStudyLink
from pydantic import EmailStr
from typing import List
from sqlmodel import Field, Relationship, SQLModel
import uuid


class Lecturer(SQLModel, table=True):
    __tablename__ = "lecturer"
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    full_name: str = Field(default=None, max_length=255)
    email: EmailStr | None = Field(index=True, max_length=255)
    research_areas: list["ResearchArea"] = Relationship(back_populates="lecturers", link_model=LecturerResearchAreaLink)
    interested_studies: list["InterestedStudy"] = Relationship(back_populates="lecturers", link_model=LecturerInterestedStudyLink)
