# SCHFEES/ClassSession

This method allows to manage a school ClassSession object regarding Government School’s. This allows the management of the configuration that relates a School with a Class to which exist a Session, for brevity sake will refer to this triplet as a ClassSession. Permitting the normal insert, update, delete and get operations to be performed.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Creates or Updates the configuration of a ClassSession |
| `GET` | Get a specific ClassSession information or information for all ClassesSessions |
| `DELETE` | Deletes a specific ClassSession |

## Endpoint URL

```
INT/V1/SCHFEES/MOE/School/ClassSession
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/V1/SCHFEES/MOE/School/ClassSession` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/ClassSession` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SchoolID` | `String` | ✅ Required | Unique SchoolID Identifier |
| `ClassID` | `Integer` | ✅ Required | Unique Class Identifier |
| `SessionID` | `Integer` | ✅ Required | Unique Session Identifier GET Request definition: |
| `SchoolID` | `String` | ✅ Required | (Optional) Unique School Identifier to get information for a specific School. |

## Mock Responses

### POST — Creates or Updates the configuration of a ClassSession

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

### GET — Get a specific ClassSession information or information for all ClassesSessions

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

### DELETE — Deletes a specific ClassSession

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

### POST — Creates or Updates the configuration of a ClassSession

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/ClassSession" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "SchoolID": "ID-001234",
    "ClassID": "ID-001234",
    "SessionID": "ID-001234"
  }
}'
```

### GET — Get a specific ClassSession information or information for all ClassesSessions

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/ClassSession?auth:user=api_user&auth:pwd=api_password&param:SchoolID=ID-001234&param:ClassID=ID-001234&param:SessionID=ID-001234"
```

### DELETE — Deletes a specific ClassSession

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/ClassSession?auth:user=api_user&auth:pwd=api_password&param:SchoolID=ID-001234&param:ClassID=ID-001234&param:SessionID=ID-001234"
```
