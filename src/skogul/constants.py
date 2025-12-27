from os import getenv

DJANGO_DEBUG_MODE = bool(getenv("DJANGO_DEBUG_MODE", default=1))
DJANGO_SECRET_KEY = str(
    getenv(
        "DJANGO_SECRET_KEY",
        default="django-insecure-zdr%6--e*z(*gj4-de4m3e&*h37v---^4)%!ookao5=)5#xz^@",
    )
)
