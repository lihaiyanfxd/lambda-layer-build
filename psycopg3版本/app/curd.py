import psycopg
from app.core.config import settings


def get_user_by_id(user_id: int):
    with psycopg.connect(settings.DATABASE_URL) as conn:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT id, name FROM my_table WHERE id = %s",
                (user_id,),
            )
            return cur.fetchone()
