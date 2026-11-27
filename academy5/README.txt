BICH NGOC ENGLISH ACADEMY 5.0 - local MVP
1. Stop v4.1 (Ctrl+C). In pgAdmin create database bich_ngoc_academy_v5 (owner postgres).
2. Extract ZIP. Double click START.bat. Enter PostgreSQL password and a new admin password (ASCII, 12-72 characters). The script creates .env and installs packages. Requires Node 20+ and PostgreSQL on localhost:5432.
3. Open http://localhost:8000 (not 127.0.0.1). Login admin / your chosen admin password.
4. Create a class, create student assigned to class, add lesson and questions, assign task. Log out and log in as student. For a teacher account, create teacher then log in as teacher and create their own classes and lessons. Parent links are created by admin.
5. Next time use npm.cmd start or START.bat. Keep .env private. Changing ADMIN_PASSWORD after first startup does not reset account.
Limitations: no preloaded curriculum; teacher authors content. Local prototype, not production audited. Browser TTS and recording, no AI grading. Practice/test share submission grading, one attempt per assignment. CSV not native XLSX. No automatic enrollment, notifications, full exam engines, file uploads, or complete attendance management. No database integration tests performed in build environment. Backup before use with real student data. Do not expose local server to internet. Audio stored in database; keep recordings short. Use fake accounts for testing.
