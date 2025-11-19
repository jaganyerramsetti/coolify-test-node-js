# Node.js Test Application

A simple Fastify-based Node.js test application with various endpoints for testing purposes.

## Features

- Fast and lightweight Fastify web server
- CORS enabled for cross-origin requests
- Multiple test endpoints for different HTTP status codes
- Environment variable inspection endpoints
- Health check endpoint

## Prerequisites

- Node.js (v14 or higher recommended)
- npm (comes with Node.js)

## Installation

Install the dependencies:

```bash
npm install
```

## Running the Application

### Start the server

```bash
npm start
```

Or using Node directly:

```bash
node index.js
```

### Development mode (with auto-reload)

```bash
npm run dev
```

The server will start on port **5900** by default (or the port specified in the `PORT` environment variable).

## Configuration

### Environment Variables

- `PORT` - Server port (default: 5900)

Example:

```bash
PORT=8080 npm start
```

## API Endpoints

### `GET /`
Returns a simple hello message.

**Response:**
```json
{
  "hello": "from nodejs"
}
```

### `GET /health`
Health check endpoint.

**Response:**
```
OK
```

### `GET /300`
Returns HTTP status code 300.

**Response:**
```json
{
  "hello": "300"
}
```

### `GET /401`
Returns HTTP status code 401.

**Response:**
```json
{
  "hello": "401"
}
```

### `GET /500`
Returns HTTP status code 500.

**Response:**
```json
{
  "hello": "500"
}
```

### `GET /env`
Returns all environment variables.

**Response:**
```json
{
  "env": {
    "NODE_ENV": "development",
    "PORT": "5900",
    ...
  }
}
```

### `GET /env/:env`
Returns a specific environment variable value.

**Example:**
```
GET /env/PORT
```

**Response:**
```json
{
  "env": "5900"
}
```

## Docker Deployment

### Building the Docker Image

```bash
docker build -t nodejs-app .
```

### Running with Docker

```bash
docker run -p 5900:5900 -e PORT=5900 nodejs-app
```

### Using Docker Compose

```bash
docker-compose up -d
```

This will build and start the container in detached mode. The application will be available at `http://localhost:5900`.

## Coolify Deployment

This application is configured for easy deployment on Coolify using Docker.

### Prerequisites

- A Coolify instance
- A public Git repository (GitHub, GitLab, etc.)

### Deployment Steps

1. **Push to Repository**: Ensure your code is pushed to a public Git repository

2. **Add Application in Coolify**:
   - Go to your Coolify dashboard
   - Click "New Resource" → "Application"
   - Select your Git repository
   - Coolify will automatically detect the `coolify.json` configuration

3. **Configuration**:
   - The `coolify.json` file is already configured with:
     - Build pack: `dockerfile` (uses the Dockerfile)
     - Base directory: `/nodejs`
     - Exposed port: `5900`
   
4. **Environment Variables** (optional):
   - You can set environment variables in Coolify's dashboard
   - Default port is 5900, but can be overridden with `PORT` environment variable

5. **Deploy**: Click deploy and Coolify will:
   - Build the Docker image using the Dockerfile
   - Start the container
   - Expose the application on port 5900

### Files for Coolify Deployment

- `Dockerfile` - Docker image definition
- `coolify.json` - Coolify-specific configuration
- `.dockerignore` - Files to exclude from Docker build

## Technology Stack

- **Fastify** - Fast and low overhead web framework
- **@fastify/cors** - CORS support for Fastify
- **Docker** - Containerization for deployment

## License

ISC

