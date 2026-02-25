from fastapi import APIRouter, HTTPException
from app.crud import get_user_by_id
from app.models import User

router = APIRouter()


@router.get("/users/{user_id}", response_model=User)
def read_user(user_id: int):
    row = get_user_by_id(user_id)

    if row is None:
        raise HTTPException(status_code=404, detail="User not found")

    return User(id=row[0], name=row[1])
