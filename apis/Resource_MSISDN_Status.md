# Resource/MSISDN/Status

This method can be used to check the status of a SIM card.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Notifies the system of an event regarding a package of a Subscriber. |

## Endpoint URL

```
TIMM/v1/Resource/SimCard/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Resource/SimCard/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Resource/SimCard/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to activate. The package 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Status` | `String` | Reference to the action within the provisioning ID |

## Mock Responses

### GET — Notifies the system of an event regarding a package of a Subscriber.

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

### GET — Notifies the system of an event regarding a package of a Subscriber.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Resource/SimCard/Status?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
