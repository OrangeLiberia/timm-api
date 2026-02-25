# CRM/Search/Service/ClientID

This method can be called to search for a service using the client identifier.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the subscriber gender types |

## Endpoint URL

```
TIMM/v1/CRM/Search/Service/ClientID
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Search/Service/ClientID` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/Service/ClientID` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ServiceID` | `Number` | Service identifier |
| `ClientName` | `String` | Subscriber name |
| `IDCardType` | `String` | Subscriber’s ID card type |
| `IDCardNumber` | `String` | Subscriber’s ID card number |
| `PhoneNumber` | `String` | Phone number |
| `Status` | `String` | Status of the service |

## Mock Responses

### GET — Returns the subscriber gender types

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ServiceID": 1001,
    "ClientName": "John Doe",
    "IDCardType": "Standard",
    "IDCardNumber": "sample_IDCardNumber",
    "PhoneNumber": "0777777588",
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

### GET — Returns the subscriber gender types

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/Service/ClientID?auth:user=api_user&auth:pwd=api_password"
```
