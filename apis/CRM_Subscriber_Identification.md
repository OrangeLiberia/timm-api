# CRM/Subscriber/Identification

This method can be called to get the full name and status of the subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the Subscriber Registration Status |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber/Detail/Identification
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Subscriber/Detail/Identification` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Detail/Identification` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the subscriber information. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | MSISDN |
| `FullName` | `String` | Subscribers full name |
| `Status` | `String` | Status of the subscriber (Active, Blocked, HotLine and Canceled) |
| `DocumentID` | `String` | Identifier Document |
| `TypeDocID` | `String` | Document Type ID See API /TIMM/v1/CRM/Types/Document/ID for reference |
| `TypeDocName` | `String` | Document Type Name |
| `BirthDate` | `String` | BirthDate of Subscriber |
| `BirthPlace` | `String` | Birth Place of Subscriber |

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
    "Status": "Active",
    "DocumentID": "sample_DocumentID",
    "TypeDocID": "Standard",
    "TypeDocName": "Standard",
    "BirthDate": "2024-11-07T10:30:00",
    "BirthPlace": "sample_BirthPlace"
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

### GET — Returns the Subscriber Registration Status

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/Detail/Identification?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
