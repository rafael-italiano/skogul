from os import getenv

DJANGO_DEBUG_MODE = bool(int(getenv("DJANGO_DEBUG_MODE", default=1)))

if DJANGO_DEBUG_MODE:
    DJANGO_SECRET_KEY = "django-insecure-dev-only"
else:
    DJANGO_SECRET_KEY = getenv("DJANGO_SECRET_KEY", "")
    if not DJANGO_SECRET_KEY:
        raise RuntimeError("DJANGO_SECRET_KEY must be set in production")
