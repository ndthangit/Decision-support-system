from sqlmodel import Field, SQLModel
import uuid


class LecturerResearchAreaLink(SQLModel, table=True):
    __tablename__ = "lecturer_research_area"
    lecturer_id: uuid.UUID = Field(foreign_key="lecturer.id", primary_key=True)
    research_area_id: uuid.UUID = Field(foreign_key="research_area.id", primary_key=True)


class LecturerInterestedStudyLink(SQLModel, table=True):
    __tablename__ = "lecturer_interested_study"
    lecturer_id: uuid.UUID = Field(foreign_key="lecturer.id", primary_key=True)
    interested_study_id: uuid.UUID = Field(foreign_key="interested_study.id", primary_key=True)
