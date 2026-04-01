# PRV/Package/Notification

This method can be called from one of the NE’s when a new Package is added to a Subscriber. The API will validate the eligibility of subscriber and will activate and provision any required NE.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Notifies the system of an event regarding a package of a Subscriber. |

## Endpoint URL

```
TIMM/v1/PRV/Service/Package/Notification
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/PRV/Service/Package/Notification` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/Package/Notification` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to activate. The package 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `PackageID` | `String` | ✅ Required | Package ID |
| `NotificationType` | `String` | ✅ Required | Enumeration of the following strings: {Expired} |
| `NotificationData` | `String` | ✅ Required |  |
| `ReferenceID` | `String` | ✅ Required | Caller Specific Reference ID |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ActionID` | `String` | Output Reference to the action within the provisioning ID |

## Mock Responses

### POST — Notifies the system of an event regarding a package of a Subscriber.

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
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### POST — Notifies the system of an event regarding a package of a Subscriber.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/Package/Notification" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PackageID": "ID-001234",
    "NotificationType": "<NotificationType>",
    "NotificationData": "<NotificationData>",
    "ReferenceID": "REF-001234"
  }
}'
```
