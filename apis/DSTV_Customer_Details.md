# DSTV/Customer/Details

This method will allow to get information regarding a DSTV customer.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows to obtain details for a DSTV customer |

## Endpoint URL

```
TIMM/v1/DSTV/Customer/Details
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/DSTV/Customer/Details` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/DSTV/Customer/Details` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `DSTVSmartCardId` | `String` | ✅ Required | DSTV Smart Card were product should be activated. |

## Mock Responses

### GET — Allows to obtain details for a DSTV customer

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "msisdn": "0777777588",
    "name": "John Doe",
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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### GET — Allows to obtain details for a DSTV customer

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/DSTV/Customer/Details?auth:user=api_user&auth:pwd=api_password&param:DSTVSmartCardId=ID-001234"
```
