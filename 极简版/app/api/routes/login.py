from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session

from app.core.db import get_session
from app.core.security import create_access_token, verify_password
from app.crud import get_user_by_email

router = APIRouter(prefix="/login", tags=["login"])


@router.post("/access-token")
def login(email: str, password: str, session: Session = Depends(get_session)):
    user = get_user_by_email(session, email)
    if not user or not verify_password(password, user.hashed_password):
        raise HTTPException(status_code=400, detail="Incorrect email or password")

    token = create_access_token(str(user.id))
    return {"access_token": token, "token_type": "bearer"}
