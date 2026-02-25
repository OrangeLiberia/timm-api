# System/Redirect

This method will allow the caller to use this URL to redirect a call to an internal API.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows the redirect to an internal API specified by the redirect object |
| `GET` | redirect (Authentication) |

## Endpoint URL

```
TIMM/System/Redirect
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/System/Redirect` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/System/Redirect` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Verb` | `String` | ✅ Required |  |
| `Destination URL API` | `String` | ✅ Required | HTTP Verb to use to call the destination URL - GET, POST, PUT, DEL |

## Mock Responses

### POST — Allows the redirect to an internal API specified by the redirect object

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
  }
}
```

### GET — redirect (Authentication)

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### POST — Allows the redirect to an internal API specified by the redirect object

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/System/Redirect" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "Verb": "<Verb>",
    "Destination URL API": "<Destination URL API>"
  }
}'
```

### GET — redirect (Authentication)

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/System/Redirect?auth:user=api_user&auth:pwd=api_password&param:Verb=<Verb>&param:Destination URL API=<Destination URL API>"
```
