# CRM/Subscriber/Calls/Last

This method is used to obtain the last network events of a subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the status of the Subscriber Eligibility |

## Endpoint URL

```
TIMM/v1/CRM/Calls/Last
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Calls/Last` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Calls/Last` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to set to Default access. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `NEvents` | `int` | ⬜ Optional | Number of events to return. Returns the last 10 events by default |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ServedMSISDN` | `String` | Served MSISDN |
| `EvntType` | `String` | Event Type (MOC – Mobile Terminated Call, MTC – Mobile Terminated Call) |
| `OtherMSISDN` | `String` | Called or Caller MSISDN dependent on the EvntType |
| `Duration` | `String` | Duration of the call in seconds |
| `StartDateTime` | `String` | Start of event |

## Mock Responses

### GET — Gets the status of the Subscriber Eligibility

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ServedMSISDN": "0777777588",
    "EvntType": "Standard",
    "OtherMSISDN": "0777777588",
    "Duration": "sample_Duration",
    "StartDateTime": "2024-11-07T10:30:00"
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

### GET — Gets the status of the Subscriber Eligibility

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Calls/Last?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:NEvents=1"
```
