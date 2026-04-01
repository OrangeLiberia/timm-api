# SCHFEES/Session

This method allows to manage a school session object regarding Government School’s. Permitting the normal insert, update, delete and get operations to be performed.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Creates or Updates a Session information |
| `GET` | Get a specific session information or information for all classes |
| `DELETE` | Deletes a specific session |

## Endpoint URL

```
INT/V1/SCHFEES/MOE/School/Session
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/V1/SCHFEES/MOE/School/Session` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Session` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SessionID` | `Integer` | ✅ Required | Unique Session Identifier |
| `SessionName` | `String` | ✅ Required | Session Name DEL Request definition: |
| `SessionID` | `Integer` | ✅ Required | Unique Class Identifier GET Request definition: |
| `SessionID` | `String` | ✅ Required | (Optional) Unique Session Identifier to get information from a specific Session. If parameter is omitted all Sessions are returned |

## Mock Responses

### POST — Creates or Updates a Session information

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

### GET — Get a specific session information or information for all classes

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

### DELETE — Deletes a specific session

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
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### POST — Creates or Updates a Session information

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Session" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "SessionID": "ID-001234",
    "SessionName": "John Doe"
  }
}'
```

### GET — Get a specific session information or information for all classes

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Session?auth:user=api_user&auth:pwd=api_password&param:SessionID=ID-001234&param:SessionName=John Doe"
```

### DELETE — Deletes a specific session

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Session?auth:user=api_user&auth:pwd=api_password&param:SessionID=ID-001234&param:SessionName=John Doe"
```
