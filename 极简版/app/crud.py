from sqlmodel import Session, select
from app.models import MyTable


def get_user_by_id(session: Session, user_id: int):
    statement = select(MyTable).where(MyTable.id == user_id)
    return session.exec(statement).first()
