except Exception as e:
    print("EXCEPTION TYPE:", type(e))
    print("MODULE:", type(e).__module__)
    print("IS BUSINESS:", isinstance(e, BusinessException))
    raise
