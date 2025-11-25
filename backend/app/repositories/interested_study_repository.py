from typing import List, Optional
from uuid import UUID

from sqlmodel import Session, select

from ..databases.postgres import engine
from ..models.interested_study_model import InterestedStudy


def create_interested_study(study: InterestedStudy) -> InterestedStudy:
    with Session(engine) as session:
        session.add(study)
        session.commit()
        session.refresh(study)
        return study


def get_interested_study(study_id: UUID) -> Optional[InterestedStudy]:
    with Session(engine) as session:
        return session.get(InterestedStudy, study_id)


def get_interested_studies(skip: int = 0, limit: int = 100) -> List[InterestedStudy]:
    with Session(engine) as session:
        statement = select(InterestedStudy).offset(skip).limit(limit)
        return session.exec(statement).all()


def update_interested_study(study_id: UUID, data: dict) -> Optional[InterestedStudy]:
    with Session(engine) as session:
        db_obj = session.get(InterestedStudy, study_id)
        if not db_obj:
            return None
        for key, value in data.items():
            if hasattr(db_obj, key):
                setattr(db_obj, key, value)
        session.add(db_obj)
        session.commit()
        session.refresh(db_obj)
        return db_obj


def delete_interested_study(study_id: UUID) -> bool:
    with Session(engine) as session:
        db_obj = session.get(InterestedStudy, study_id)
        if not db_obj:
            return False
        session.delete(db_obj)
        session.commit()
        return True
