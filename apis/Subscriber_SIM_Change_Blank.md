# Subscriber/SIM/Change/Blank

This method is used to change a subscriber SIM card to a Blank (not activated SIM). It will only return a successful code if the change SIM is successful.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Change a subscribers SIM |

## Endpoint URL

```
TIMM/v1/Subscriber/SIM/Change/Blank
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/SIM/Change/Blank` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/SIM/Change/Blank` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want change the SIM Card Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `ICCIDDestination` | `String` | ✅ Required | ICCID of the destination |

## Mock Responses

### POST — Change a subscribers SIM

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "status": "Active",
    "iccid": "892310700000000780"
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

### POST — Change a subscribers SIM

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/SIM/Change/Blank" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "ICCIDDestination": "892310700000000780"
  }
}'
```
