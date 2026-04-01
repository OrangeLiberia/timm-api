# CRM/Types/Client

This method can be called to get the subscriber client types.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the client types |

## Endpoint URL

```
TIMM/v1/CRM/Types/Client
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Types/Client` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/Client` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ClientID` | `String` |  |
| `Client ID` | `String` | Client Type Description |

## Mock Responses

### GET — Returns the client types

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ClientID": "CLT-20241107-001",
    "Client ID": "sample_Client ID"
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

### GET — Returns the client types

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/Client?auth:user=api_user&auth:pwd=api_password"
```
