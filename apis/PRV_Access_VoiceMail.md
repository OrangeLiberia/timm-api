# PRV/Access/VoiceMail

This method can be called to delete or add a network feature of VoiceMail to a subscriber. As well as remove from an existing subscriber the same feature. It will only return a successful code if subscriber exists.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Adds or Sets the VoiceMail on a Subscriber |
| `DELETE` | Block/Remove the VoiceMail on a Subscriber |

## Endpoint URL

```
TIMM/v1/PRV/Service/Access/VoiceMail
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/PRV/Service/Access/VoiceMail` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/Access/VoiceMail` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ActionID` | `String` | Output Reference to the action within the provisioning ID |

## Mock Responses

### POST — Adds or Sets the VoiceMail on a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ActionID": "ACT-20241107-001234"
  }
}
```

### DELETE — Block/Remove the VoiceMail on a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ActionID": "ACT-20241107-001234"
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

### POST — Adds or Sets the VoiceMail on a Subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/Access/VoiceMail" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588"
  }
}'
```

### DELETE — Block/Remove the VoiceMail on a Subscriber

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/Access/VoiceMail?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
