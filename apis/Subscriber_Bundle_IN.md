# Subscriber/Bundle/IN

This method will allow get information the information of the Bundles available to be purchase through IN account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allow to get the information of Bundles available for activation through IN payment |

## Endpoint URL

```
TIMM/v1/Subscriber/Bundle/IN
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/IN` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/IN` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Allow to get the information of Bundles available for activation through IN payment

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "bundleId": "BDL-001",
    "name": "Data Bundle 1GB",
    "status": "Active"
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

### GET — Allow to get the information of Bundles available for activation through IN payment

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/IN?auth:user=api_user&auth:pwd=api_password"
```
