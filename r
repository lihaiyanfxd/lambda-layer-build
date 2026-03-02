from fastapi import APIRouter, HTTPException
from app.crud import get_user_by_id
from app.models import User
from app.core.exceptions import BusinessException
import logging

logger = logging.getLogger(__name__)

router = APIRouter()


@router.get("/users/{user_id}", response_model=User)
def read_user(user_id: int):
    logger.info("read_user() start")
    if user_id == 0:
        logger.error(f"user_idは{user_id}が入力しました")
        raise BusinessException(
            code="USER_NOT_FOUND",
            message = "User does not exist",
            status_code = 404
        )
    
    row = get_user_by_id(user_id)

    if row is None:
        raise HTTPException(status_code=404, detail="User not found")
    logger.info("read_user() end")
    #return User(id=row[0], name=row[1])
    return User(id=row["id"],name=row["name"])

