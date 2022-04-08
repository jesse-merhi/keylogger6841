import base64
import keyboard

code = "cHJpbnQoInRoaXMgd2FzIGVuY3J5cHRlZCEiKQ=="
bytes = code.encode("ascii")
mesagebytes = base64.b64decode(bytes)
message = mesagebytes.decode("ascii")
exec(message)
