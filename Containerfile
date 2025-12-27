FROM dhi.io/uv:0-dev AS builder

ENV UV_PYTHON_INSTALL_DIR=/app/.uv/.python

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN ["uv", "sync", "--frozen", "--no-cache", "--python-preference=only-managed"]

FROM dhi.io/python:3.14

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/.uv /app/.uv
COPY ./src .

CMD ["python", "-m", "gunicorn", "skogul.wsgi:application", "--bind", "0.0.0.0:8000"]