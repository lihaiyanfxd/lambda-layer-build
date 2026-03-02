[ERROR]	2026-03-02T09:11:14.634Z	58aa4e22-c767-4d1e-99e5-ecf94c40ed96	An error occurred running the application.
Traceback (most recent call last):
  File "/opt/python/mangum/protocols/http.py", line 58, in run
    await app(self.scope, self.receive, self.send)
  File "/opt/python/fastapi/applications.py", line 1138, in __call__
    await super().__call__(scope, receive, send)
  File "/opt/python/starlette/applications.py", line 113, in __call__
    await self.middleware_stack(scope, receive, send)
  File "/opt/python/starlette/middleware/errors.py", line 186, in __call__
    raise exc
  File "/opt/python/starlette/middleware/errors.py", line 164, in __call__
    await self.app(scope, receive, _send)
  File "/opt/python/starlette/middleware/exceptions.py", line 63, in __call__
    await wrap_app_handling_exceptions(self.app, conn)(scope, receive, send)
  File "/opt/python/starlette/_exception_handler.py", line 53, in wrapped_app
    raise exc
  File "/opt/python/starlette/_exception_handler.py", line 42, in wrapped_app
    await app(scope, receive, sender)
  File "/opt/python/fastapi/middleware/asyncexitstack.py", line 18, in __call__
    await self.app(scope, receive, send)
  File "/opt/python/starlette/routing.py", line 716, in __call__
    await self.middleware_stack(scope, receive, send)
  File "/opt/python/starlette/routing.py", line 736, in app
    await route.handle(scope, receive, send)
  File "/opt/python/starlette/routing.py", line 290, in handle
    await self.app(scope, receive, send)
  File "/opt/python/fastapi/routing.py", line 121, in app
    await wrap_app_handling_exceptions(app, request)(scope, receive, send)
  File "/opt/python/starlette/_exception_handler.py", line 53, in wrapped_app
    raise exc
  File "/opt/python/starlette/_exception_handler.py", line 42, in wrapped_app
    await app(scope, receive, sender)
  File "/opt/python/fastapi/routing.py", line 107, in app
    response = await f(request)
               ^^^^^^^^^^^^^^^^
  File "/opt/python/fastapi/routing.py", line 426, in app
    raw_response = await run_endpoint_function(
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ...<3 lines>...
    )
    ^
  File "/opt/python/fastapi/routing.py", line 316, in run_endpoint_function
    return await run_in_threadpool(dependant.call, **values)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/python/starlette/concurrency.py", line 38, in run_in_threadpool
    return await anyio.to_thread.run_sync(func)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/python/anyio/to_thread.py", line 63, in run_sync
    return await get_async_backend().run_sync_in_worker_thread(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        func, args, abandon_on_cancel=abandon_on_cancel, limiter=limiter
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "/opt/python/anyio/_backends/_asyncio.py", line 2502, in run_sync_in_worker_thread
    return await future
           ^^^^^^^^^^^^
  File "/opt/python/anyio/_backends/_asyncio.py", line 986, in run
    result = context.run(func, *args)
  File "/var/task/app/api/users.py", line 28, in read_user
    return User(id=row[0])
                   ~~~^^^
KeyError: 0
