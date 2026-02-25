from typing import Optional
from sqlmodel import SQLModel, Field


class MyTable(SQLModel, table=True):
    __tablename__ = "my_table"   # 指定真实表名

    id: Optional[int] = Field(default=None, primary_key=True)
    name: str
