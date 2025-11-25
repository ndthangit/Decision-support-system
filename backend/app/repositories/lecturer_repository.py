from typing import List, Optional
from uuid import UUID

from sqlmodel import Session, select

from ..databases.postgres import engine
from ..models.lecturer_model import Lecturer


def create_lecturer(lecturer: Lecturer) -> Lecturer:
    with Session(engine) as session:
        session.add(lecturer)
        session.commit()
        session.refresh(lecturer)
        return lecturer


def get_lecturer(lecturer_id: UUID) -> Optional[Lecturer]:
    with Session(engine) as session:
        return session.get(Lecturer, lecturer_id)


def get_lecturers(skip: int = 0, limit: int = 100) -> List[Lecturer]:
    with Session(engine) as session:
        statement = select(Lecturer).offset(skip).limit(limit)
        return session.exec(statement).all()


def update_lecturer(lecturer_id: UUID, data: dict) -> Optional[Lecturer]:
    with Session(engine) as session:
        db_obj = session.get(Lecturer, lecturer_id)
        if not db_obj:
            return None
        for key, value in data.items():
            if hasattr(db_obj, key):
                setattr(db_obj, key, value)
        session.add(db_obj)
        session.commit()
        session.refresh(db_obj)
        return db_obj


def delete_lecturer(lecturer_id: UUID) -> bool:
    with Session(engine) as session:
        db_obj = session.get(Lecturer, lecturer_id)
        if not db_obj:
            return False
        session.delete(db_obj)
        session.commit()
        return True
