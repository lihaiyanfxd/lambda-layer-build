from fastapi import APIRouter
import logging

from app.core.exceptions import BusinessException

router = APIRouter()

logger = logging.getLogger(__name__)


@router.get("/users/{user_id}")
def read_user(user_id: int):

    logger.info("read_user start")

    try:

        if user_id == 0:

            logger.error("ユーザー0はerrorです。注意してください")

            raise BusinessException(
                code="USER_ERROR",
                message="ユーザー0はerrorです",
                status_code=400
            )

        return {
            "id": user_id,
            "name": "test user"
        }

    finally:
        logger.info("read_user end")
