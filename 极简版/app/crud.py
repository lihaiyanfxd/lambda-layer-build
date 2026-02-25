from sqlmodel import Session, select
from app.models import User


def get_user_by_id(session: Session, user_id: int):
    statement = select(User).where(User.id == user_id)
    return session.exec(statement).first()
