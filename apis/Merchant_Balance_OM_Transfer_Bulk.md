# Merchant/Balance/OM/Transfer/Bulk

/Cancel This method allows to cancel a non-executed Bulk operation.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a Merchant to cancel check the status of the eValue transfer submitted by the |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Cancel
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Cancel` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Cancel` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `OPID` | `String` | ✅ Required | Operation ID |
| `EXTERNALID` | `Integer` | ⬜ Optional | Reference’s to unique id of the caller transaction |

## Mock Responses

### GET — Allows for a Merchant to cancel check the status of the eValue transfer submitted by the

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

### GET — Allows for a Merchant to cancel check the status of the eValue transfer submitted by the

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer/Bulk/Cancel?auth:user=api_user&auth:pwd=api_password&param:OPID=ID-001234&param:EXTERNALID=ID-001234"
```
