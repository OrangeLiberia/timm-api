# Agent/Details/OM

This method provides the Agent details.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the details for a Agent for his Orange Money wallet. |

## Endpoint URL

```
TIMM/v1/Agent/Details/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/Details/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Details/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |

## Mock Responses

### GET — Gets the details for a Agent for his Orange Money wallet.

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

### GET — Gets the details for a Agent for his Orange Money wallet.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Details/OM?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
