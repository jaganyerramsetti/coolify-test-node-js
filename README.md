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

## Technology Stack

- **Fastify** - Fast and low overhead web framework
- **@fastify/cors** - CORS support for Fastify

## License

ISC

