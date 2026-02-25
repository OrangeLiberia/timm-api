# CRM/Subscriber/Status

This method can be called to get the registration data of the subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the Subscriber Registration Status |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Subscriber/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | MSISDN |
| `ServiceID` | `String` | Unique Service ID |
| `ICCID` | `String` | Subscriber ICCID |
| `IMSI` | `String` |  |
| `Subscriber IMSI` | `Integer` | 1 – PrePaid , 0 - PostPaid |
| `Status` | `String` | Status of the subscriber (Active, Blocked, HotLine and Canceled) JSON Object |
| `ProfileLst : array of Profiles` | `Object` | Enum Type of Profile: CRM, IN, OM |
| `Profile` | `String` | Name of Profile |

## Mock Responses

### GET — Returns the Subscriber Registration Status

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "MSISDN": "0777777588",
    "ServiceID": 1001,
    "ICCID": "sample_ICCID",
    "IMSI": "sample_IMSI",
    "Subscriber IMSI": 1,
    "Status": "Active",
    "ProfileLst : array of Profiles": "sample_ProfileLst : array of Profiles",
    "Profile": "sample_Profile"
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

### GET — Returns the Subscriber Registration Status

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Status?auth:user=api_user&auth:pwd=api_password"
```
