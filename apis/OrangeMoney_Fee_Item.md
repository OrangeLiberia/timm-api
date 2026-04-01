# OrangeMoney/Fee/Item

This method returns the base item list of the available fees and their description.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the fee base item information |

## Endpoint URL

```
/TIMM/v1/OM/Fee/Item/Base
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Fee/Item/Base` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Item/Base` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Gets the fee base item information

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

### GET — Gets the fee base item information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Item/Base?auth:user=api_user&auth:pwd=api_password"
```
