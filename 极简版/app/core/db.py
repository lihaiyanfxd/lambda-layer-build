from sqlmodel import Session, create_engine
from app.core.config import settings

engine = create_engine(
    settings.SQLALCHEMY_DATABASE_URI,
    pool_pre_ping=True,
    pool_recycle=300,
)


def get_session():
    with Session(engine) as session:
        yield session
