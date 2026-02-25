# CRM/Subscriber/FullName

This method can be called to get the full name and status of the subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the Subscriber Registration Status |

## Endpoint URL

```
TIMM/v2/CRM/Subscriber/Detail/FullName
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v2/CRM/Subscriber/Detail/FullName` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v2/CRM/Subscriber/Detail/FullName` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the subscriber information. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. IncludeFlag Flag |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | MSISDN |
| `FullName` | `String` | Subscribers full name |
| `GSMStatus` | `String` | Status of the subscriber in GSM (Active, Blocked, HotLine and Canceled) |
| `OMStatus` | `String` | Status of the Subscriber in Orange Money ( Active, Suspended, Barred ) |
| `OMGrade` | `String` | Grade of the Subscriber in Orange Money |
| `OMGradeName` | `String` | Grade Name of the Subscriber in Orange Money |

## Mock Responses

### GET — Returns the Subscriber Registration Status

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "MSISDN": "0777777588",
    "FullName": "John Doe",
    "GSMStatus": "Active",
    "OMStatus": "Active",
    "OMGrade": "sample_OMGrade",
    "OMGradeName": "sample_OMGradeName"
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
  "https://APIDEV.Orange.com.lr/TIMM/v2/CRM/Subscriber/Detail/FullName?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
