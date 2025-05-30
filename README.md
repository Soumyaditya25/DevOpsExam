## Overview

This project shows how to:

1. Build a simple Flask web app (`app.py`).
2. Containerize it with Docker (`Dockerfile`).
3. Automate build, test, and deploy to a remote VM via GitHub Actions (`.github/workflows/ci-cd.yaml`).

---

## Prerequisites

* **Git** on your local machine.
* **Docker** installed locally:
  ```bash
  docker --version
  ```
* **GitHub account** to host this repo and configure Actions.
* **Remote VM** (Ubuntu/Debian) with Docker installed.
* **GitHub Secrets** (in your repo Settings → Secrets):
  * `SSH_PRIVATE_KEY`: contents of your private SSH key (matching the public key on the VM).
  * `DOCKERHUB_USERNAME`
  * `DOCKERHUB_TOKEN`

---

## Local Development

1. **Clone & enter**:

   ```bash
   git clone https://github.com/Soumyaditya25/DevOpsExam.git
   cd DevOpsExam
   ```

2. **Run without Docker**:

   ```bash
   pip install -r requirements.txt
   export FLASK_APP=app.py
   flask run --host=0.0.0.0 --port=5000
   ```

   Visit: [http://localhost:5000](http://localhost:5000).

3. **Build & run with Docker**:

   ```bash
   docker build -t devopsexam:local .
   docker run -d --name test -p 5000:5000 flask-app:latest
   ```

   Visit: [http://localhost:5000](http://localhost:5000).

   ```bash
   docker stop test && docker rm test
   ```

---

## Dockerfile (Essential Parts)

```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
EXPOSE 5000
LABEL maintainer="Soumyaditya Batabyal <soumyaditya2021@gmail.com>"
CMD ["python", "app.py"]
```

* Builds a minimal image with Flask.
* Listens on port 5000.

With love,
**Soumyaditya**
