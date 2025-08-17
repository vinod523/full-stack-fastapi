# Full Stack FastAPI Template

<a href="https://github.com/vinod523/full-stack-fastapi/actions?query=workflow%3ATest" target="_blank"><img src="https://github.com/vinod523/full-stack-fastapi/workflows/Test/badge.svg" alt="Test"></a>
<a href="https://coverage-badge.samuelcolvin.workers.dev/redirect/vinod523/full-stack-fastapi" target="_blank"><img src="https://coverage-badge.samuelcolvin.workers.dev/vinod523/full-stack-fastapi.svg" alt="Coverage"></a>

**🚀 Quick Start: Create a New Project**

This repository is a template for creating full-stack web applications with FastAPI (Python) and React (TypeScript). You can create a new project from this template in two ways:

1. **Use GitHub's "Use this template" button** (easiest way)
2. **Use Copier** (for more customization options)

Jump to [How To Use It](#how-to-use-it) section below for detailed instructions.

## Technology Stack and Features

- ⚡ [**FastAPI**](https://fastapi.tiangolo.com) for the Python backend API.
    - 🧰 [SQLModel](https://sqlmodel.tiangolo.com) for the Python SQL database interactions (ORM).
    - 🔍 [Pydantic](https://docs.pydantic.dev), used by FastAPI, for the data validation and settings management.
    - 💾 [PostgreSQL](https://www.postgresql.org) as the SQL database.
- 🚀 [React](https://react.dev) for the frontend.
    - 💃 Using TypeScript, hooks, Vite, and other parts of a modern frontend stack.
    - 🎨 [Chakra UI](https://chakra-ui.com) for the frontend components.
    - 🤖 An automatically generated frontend client.
    - 🦇 Dark mode support.
- 🐋 [Docker Compose](https://www.docker.com) for development and production.
- 🔒 Secure password hashing by default.
- 🔑 JWT token authentication.
- 📫 Email based password recovery.
- ✅ Tests with [Pytest](https://pytest.org).
- 📞 [Traefik](https://traefik.io) as a reverse proxy / load balancer.
- 🚢 Deployment instructions using Docker Compose, including how to set up a frontend Traefik proxy to handle automatic HTTPS certificates.
- 🏭 CI (continuous integration) and CD (continuous deployment) based on GitHub Actions.

### Dashboard Login

[![API docs](img/login.png)](https://github.com/vinod523/full-stack-fastapi)

### Dashboard - Admin

[![API docs](img/dashboard.png)](https://github.com/vinod523/full-stack-fastapi)

### Dashboard - Create User

[![API docs](img/dashboard-create.png)](https://github.com/vinod523/full-stack-fastapi)

### Dashboard - Items

[![API docs](img/dashboard-items.png)](https://github.com/vinod523/full-stack-fastapi)

### Dashboard - User Settings

[![API docs](img/dashboard-user-settings.png)](https://github.com/vinod523/full-stack-fastapi)

### Dashboard - Dark Mode

[![API docs](img/dashboard-dark.png)](https://github.com/vinod523/full-stack-fastapi)

### Interactive API Documentation

[![API docs](img/docs.png)](https://github.com/vinod523/full-stack-fastapi)

## How To Use It

There are three ways to create a new project from this template:

### Option 1: Use GitHub Template (Recommended for beginners)

1. Click the **"Use this template"** button at the top of this GitHub repository
2. Create a new repository with your desired name
3. Clone your new repository
4. Follow the setup instructions below

### Option 2: Fork or Clone

You can **just fork or clone** this repository and use it as is.

✨ It just works. ✨

### Option 3: Use Copier (Recommended for advanced users)

See the [How To Use It - Alternative With Copier](#how-to-use-it---alternative-with-copier) section below.

### Configure

You can then update configs in the `.env` files to customize your configurations.

Before deploying it, make sure you change at least the values for:

- `SECRET_KEY`
- `FIRST_SUPERUSER_PASSWORD`
- `POSTGRES_PASSWORD`

### Generate Secret Keys

Some environment variables in the `.env` file have a default value of `changethis`.

You have to change them with a secret key, to generate secret keys you can run the following command:

```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

Copy the content and use that as password / secret key. And run that again to generate another secure key.

## How To Use It - Alternative With Copier

This repository also supports generating a new project using [Copier](https://copier.readthedocs.io).

It will copy all the files, ask you configuration questions, and update the `.env` files with your answers.

### Install Copier

You can install Copier with:

```bash
pip install copier
```

Or better, if you have [`pipx`](https://pipx.pypa.io/), you can run it with:

```bash
pipx install copier
```

**Note**: If you have `pipx`, installing copier is optional, you could run it directly.

### Generate a Project With Copier

Decide a name for your new project's directory, you will use it below. For example, `my-awesome-project`.

Go to the directory that will be the parent of your project, and run the command with your project's name:

```bash
copier copy https://github.com/vinod523/full-stack-fastapi my-awesome-project --trust
```

If you have `pipx` and you didn't install `copier`, you can run it directly:

```bash
pipx run copier copy https://github.com/vinod523/full-stack-fastapi my-awesome-project --trust
```

**Note** the `--trust` option is necessary to be able to execute a [post-creation script](https://github.com/vinod523/full-stack-fastapi/blob/main/.copier/update_dotenv.py) that updates your `.env` files.

### Input Variables

Copier will ask you for some data, you might want to have at hand before generating the project.

But don't worry, you can just update any of that in the `.env` files afterwards.

The input variables, with their default values (some auto generated) are:

- `project_name`: (default: `"FastAPI Project"`) The name of the project, shown to API users (in .env).
- `stack_name`: (default: `"fastapi-project"`) The name of the stack used for Docker Compose labels (no spaces) (in .env).
- `secret_key`: (default: `"changethis"`) The secret key for the project, used for security, stored in .env, you can generate one with the method above.
- `first_superuser`: (default: `"admin@example.com"`) The email of the first superuser (in .env).
- `first_superuser_password`: (default: `"changethis"`) The password of the first superuser (in .env).
- `smtp_host`: (default: "") The SMTP server host to send emails, you can set it later in .env.
- `smtp_user`: (default: "") The SMTP server user to send emails, you can set it later in .env.
- `smtp_password`: (default: "") The SMTP server password to send emails, you can set it later in .env.
- `emails_from_email`: (default: `"info@example.com"`) The email account to send emails from, you can set it later in .env.
- `postgres_password`: (default: `"changethis"`) The password for the PostgreSQL database, stored in .env, you can generate one with the method above.
- `sentry_dsn`: (default: "") The DSN for Sentry, if you are using it, you can set it later in .env.

### Test Template Generation

To verify that the template generation works correctly, you can run the template validation script:

```bash
# Make sure you have Copier installed
pip install copier

# Run the template test script
./scripts/test-template.sh
```

This script will create a test project and verify that all files are generated correctly and the .env file is properly updated.

## Backend Development

Backend docs: [backend/README.md](./backend/README.md).

## Frontend Development

Frontend docs: [frontend/README.md](./frontend/README.md).

## Deployment

Deployment docs: [deployment.md](./deployment.md).

## Development

General development docs: [development.md](./development.md).

This includes using Docker Compose, custom local domains, `.env` configurations, etc.

## Release Notes

Check the file [release-notes.md](./release-notes.md).

## License

The Full Stack FastAPI Template is licensed under the terms of the MIT license.
