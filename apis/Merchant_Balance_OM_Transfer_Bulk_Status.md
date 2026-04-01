# Merchant/Balance/OM/Transfer/Bulk/Status

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Query resource |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Get resource

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "balance": "250.00",
    "currency": "LRD",
    "accountNumber": "ACC-0777777588"
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

### GET — Get resource

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Status?auth:user=api_user&auth:pwd=api_password"
```
