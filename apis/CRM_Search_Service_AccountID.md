# CRM/Search/Service/AccountID

This method can be called to search for a service using the account identifier.

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

### GET — Returns the subscriber gender types

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/Service/ClientID?auth:user=api_user&auth:pwd=api_password"
```
