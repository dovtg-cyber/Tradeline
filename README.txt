TRADELINE EUROPE — Docker fix

IMPORTANT: Dockerfile must be in the ROOT of the existing Flask project, in the same folder as app.py and requirements.txt. Do not upload this folder as a nested subfolder unless you also set Render's Dockerfile Path to that nested location.

1. Download and extract this package.
2. Copy Dockerfile and .dockerignore into the root of the existing TRADELINE project (same level as app.py, requirements.txt, templates/ and static/).
3. Commit and push both files to GitHub.
4. In Render, open the Web Service settings:
   - Runtime: Docker
   - Dockerfile Path: ./Dockerfile
   - Docker Build Context Directory: .
5. Add environment variables in Render Environment:
   - SECRET_KEY: a long random secret
   - ADMIN_EMAIL: your admin email
   - ADMIN_PASSWORD: a unique strong password
   - DATABASE_URL: your PostgreSQL connection string
   - BANK_IBAN: PL16102029060000120205861028
   - BANK_HOLDER: DARYA HARBUZAVA
   - BANK_NAME: PKO Bank Polski
6. Deploy. When deployment completes, open https://YOUR-SERVICE.onrender.com/health. Expected response: {"status":"ok","app":"TRADELINE EUROPE"}

If your project is configured as a Python runtime using render.yaml (buildCommand + startCommand), you do not need Docker. Choose one deployment method: Docker runtime OR Python runtime. Do not select Docker while the Dockerfile is absent from the repository root.

Do not put passwords, SECRET_KEY, .env files, or database files in GitHub. A container's local filesystem is not persistent storage; use PostgreSQL for production data.
