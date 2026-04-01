# COMMON/Currency/List

This method can be called to return all the list of currencies supported.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the available currencies |

## Endpoint URL

```
TIMM/v1/COMMON/Currency/List
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/COMMON/Currency/List` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/COMMON/Currency/List` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Currency` | `String` |  |
| `Currency Code` | `String` |  |
| `Currency Name` | `String` | Currency Description |
| `Symbol` | `String` | Currency Symbol |

## Mock Responses

### GET — Returns the available currencies

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Currency": "LRD",
    "Currency Code": "LRD",
    "Currency Name": "LRD",
    "Symbol": "LRD"
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

### GET — Returns the available currencies

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/COMMON/Currency/List?auth:user=api_user&auth:pwd=api_password"
```
