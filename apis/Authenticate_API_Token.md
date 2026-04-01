# Authenticate/API/Token

This method can be called to obtain an authentication token to access the API. The authentication .

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Adds or Sets the Caller Ring Back Tone on a Subscriber |

## Endpoint URL

```
TIMM/v1/Authentication/API/Token
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Authentication/API/Token` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Authentication/API/Token` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AuthType` | `EnumString` | ✅ Required | Identification type token: - Singlev1: Only Username and Password will be use to authenticate - Mutualv1: Username, Password and Signature will be used to authenticate, requires previous sharing of public key. |
| `Username` | `String` | ✅ Required | User provided |
| `Password` | `String` | ✅ Required | Password provided |
| `Timestamp` | `String` | ✅ Required | Represents a time when the action should be executed. Date format that should be used: YYYY-MM-DDTHH:mm:ss |
| `Sign` | `String` | ⬜ Optional | CMS Signature of Username + Password + Timestamp encoded in Base64 |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Token` | `String` | Authentication Token |

## Mock Responses

### GET — Adds or Sets the Caller Ring Back Tone on a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.mock_payload.mock_signature"
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

### GET — Adds or Sets the Caller Ring Back Tone on a Subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Authentication/API/Token?auth:user=api_user&auth:pwd=api_password&param:AuthType=Singlev1&param:Username=api_user&param:Password=api_password&param:Timestamp=2024-11-07T10:30:00&param:Sign=<Sign>"
```
