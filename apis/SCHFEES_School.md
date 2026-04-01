# SCHFEES/School

This method allows to manage the school object and school object list regarding Government School’s. Where normal insert, update, delete and get operations can be performed on it.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Creates or Updates a School information |
| `GET` | Get a specific school information or information for all schools |
| `DELETE` | Deletes a specific School |

## Endpoint URL

```
INT/V1/SCHFEES/MOE/School
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/V1/SCHFEES/MOE/School` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SchooldID` | `String` | ✅ Required | Unique School Identifier |
| `SchoolName` | `String` | ✅ Required | School Name |
| `CountyName` | `String` | ✅ Required | Geographical County |
| `DistrictName` | `String` | ✅ Required | District Name |
| `SchoolType` | `String` | ✅ Required | Type of School ( Public, HS, …) |
| `SchoolAddress` | `String` | ✅ Required | Address of the School DEL Request definition: |
| `SchooldID` | `String` | ✅ Required | Unique School Identifier GET Request definition: |
| `SchooldID` | `String` | ✅ Required | (Optional) Unique School Identifier to get information from a specific school If parameter is omitted all school’s are returned |

## Mock Responses

### POST — Creates or Updates a School information

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

### GET — Get a specific school information or information for all schools

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

### DELETE — Deletes a specific School

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

### POST — Creates or Updates a School information

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "SchooldID": "ID-001234",
    "SchoolName": "John Doe",
    "CountyName": "John Doe",
    "DistrictName": "John Doe",
    "SchoolType": "<SchoolType>",
    "SchoolAddress": "<SchoolAddress>"
  }
}'
```

### GET — Get a specific school information or information for all schools

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School?auth:user=api_user&auth:pwd=api_password&param:SchooldID=ID-001234&param:SchoolName=John Doe&param:CountyName=John Doe&param:DistrictName=John Doe&param:SchoolType=<SchoolType>&param:SchoolAddress=<SchoolAddress>"
```

### DELETE — Deletes a specific School

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/INT/V1/SCHFEES/MOE/School?auth:user=api_user&auth:pwd=api_password&param:SchooldID=ID-001234&param:SchoolName=John Doe&param:CountyName=John Doe&param:DistrictName=John Doe&param:SchoolType=<SchoolType>&param:SchoolAddress=<SchoolAddress>"
```
