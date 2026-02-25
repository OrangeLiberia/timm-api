# Subscriber/Balance/IN/Recharge

This method allows to top up a Subscribers IN wallet to using a voucher card ( aka scratch card ).

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows to top up an using a scratch card |

## Endpoint URL

```
TIMM/v2/Subscriber/Balance/IN/Recharge
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v2/Subscriber/Balance/IN/Recharge` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN/Recharge` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to top up. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `VOUCHERID` | `String` | ✅ Required | Voucher Hidden Number |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Internal_code` | `String` | Internal Error Code |

## Mock Responses

### POST — Allows to top up an using a scratch card

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Internal_code": "CODE001"
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

### POST — Allows to top up an using a scratch card

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN/Recharge" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "VOUCHERID": "ID-001234"
  }
}'
```
