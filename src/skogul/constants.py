from os import getenv

DJANGO_DEBUG_MODE = bool(int(getenv("DJANGO_DEBUG_MODE", default=1)))

if DJANGO_DEBUG_MODE:
    DJANGO_SECRET_KEY = "django-insecure-dev-only"
else:
    DJANGO_SECRET_KEY = getenv("DJANGO_SECRET_KEY", "")
    if not DJANGO_SECRET_KEY:
        raise RuntimeError("DJANGO_SECRET_KEY must be set in production")

POSTGRES_DB = getenv(
    "POSTGRES_DB",
    default="app_db",
)
POSTGRES_USER = getenv(
    "POSTGRES_USER",
    default="postgres",
)
POSTGRES_PASSWORD = getenv("POSTGRES_PASSWORD", default="postgres")
POSTGRES_HOST = getenv(
    "POSTGRES_HOST",
    default="localhost",
)
