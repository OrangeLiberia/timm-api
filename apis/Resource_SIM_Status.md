# Resource/SIM/Status

This method can be used to check the status of a SIM card.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get the status of the SIM |

## Endpoint URL

```
TIMM/v1/Resource/SIM/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Resource/SIM/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Resource/SIM/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ICCID` | `String` | ✅ Required | Unique SIM Card number of 19 or 20 digits |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Status` | `String` | Active and Blank |

## Mock Responses

### GET — Get the status of the SIM

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Status": "Active"
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

### GET — Get the status of the SIM

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Resource/SIM/Status?auth:user=api_user&auth:pwd=api_password&param:ICCID=892310700000000780"
```
