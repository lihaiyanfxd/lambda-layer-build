from app.exceptions import BusinessException

def get_user(user_id: int):
        if item_id ==  0:
            raise BusinessException(
                code="USER_NOT_FOUND",
                message = "User does not exist",
                status_code = 404
        )
        return {"user_id": user_id}
