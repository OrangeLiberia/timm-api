# SCHFEES/Class

This method allows to manage a school class object regarding Government School’s. Permitting the normal insert, update, delete and get operations to be performed.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Creates or Updates a Class information |
| `GET` | Get a specific class information or information for all classes |
| `DELETE` | Deletes a specific Class |

## Endpoint URL

```
INT/V1/SCHFEES/MOE/School/Class
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/V1/SCHFEES/MOE/School/Class` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Class` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ClassID` | `Integer` | ✅ Required | Unique Class Identifier |
| `ClassName` | `String` | ✅ Required | Class Name DEL Request definition: |
| `ClassID` | `Integer` | ✅ Required | Unique Class Identifier GET Request definition: |
| `SchooldID` | `String` | ✅ Required | (Optional) Unique Class Identifier to get information from a specific Class. If parameter is omitted all classes are returned |

## Mock Responses

### POST — Creates or Updates a Class information

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

### GET — Get a specific class information or information for all classes

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

### DELETE — Deletes a specific Class

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

### POST — Creates or Updates a Class information

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Class" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "ClassID": "ID-001234",
    "ClassName": "John Doe",
    "SchooldID": "ID-001234"
  }
}'
```

### GET — Get a specific class information or information for all classes

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Class?auth:user=api_user&auth:pwd=api_password&param:ClassID=ID-001234&param:ClassName=John Doe&param:SchooldID=ID-001234"
```

### DELETE — Deletes a specific Class

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School/Class?auth:user=api_user&auth:pwd=api_password&param:ClassID=ID-001234&param:ClassName=John Doe&param:SchooldID=ID-001234"
```
