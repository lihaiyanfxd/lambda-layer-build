from sqlmodel import create_engine, Session
from app.core.config import settings


engine = create_engine(
    settings.SQLALCHEMY_DATABASE_URI,
    pool_size=1,
    max_overflow=0,
    pool_pre_ping=True,
)


def get_session():
    with Session(engine) as session:
        yield session
