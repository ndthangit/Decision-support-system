from typing import List, Optional
from uuid import UUID

from sqlmodel import Session, select

from ..databases.postgres import engine
from ..models.research_area_model import ResearchArea


def create_research_area(area: ResearchArea) -> ResearchArea:
    with Session(engine) as session:
        session.add(area)
        session.commit()
        session.refresh(area)
        return area


def get_research_area(area_id: UUID) -> Optional[ResearchArea]:
    with Session(engine) as session:
        return session.get(ResearchArea, area_id)


def get_research_areas(skip: int = 0, limit: int = 100) -> List[ResearchArea]:
    with Session(engine) as session:
        statement = select(ResearchArea).offset(skip).limit(limit)
        return session.exec(statement).all()


def update_research_area(area_id: UUID, data: dict) -> Optional[ResearchArea]:
    with Session(engine) as session:
        db_obj = session.get(ResearchArea, area_id)
        if not db_obj:
            return None
        for key, value in data.items():
            if hasattr(db_obj, key):
                setattr(db_obj, key, value)
        session.add(db_obj)
        session.commit()
        session.refresh(db_obj)
        return db_obj


def delete_research_area(area_id: UUID) -> bool:
    with Session(engine) as session:
        db_obj = session.get(ResearchArea, area_id)
        if not db_obj:
            return False
        session.delete(db_obj)
        session.commit()
        return True
