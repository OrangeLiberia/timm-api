# CRM/Subscriber/KYC/Status

This method can be called to add, delete or get the status of the registration subscriber. It will only return a successful code if subscriber exists.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Sets the Subscriber KYC Registration Status |
| `GET` | Returns the Subscriber KYC Registration Status |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber/KYC/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Subscriber/KYC/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/KYC/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | MSISDN |
| `FullName` | `String` | Subscribers full name Status Enum Status of the subscriber 1-Active; 4-HotLine (Simbox); 6-HotLine ( Only Receives ); 7-Auto-Blocked; 8-Blocked; 9-Cancelled |
| `StatusTxt` | `String` | Textual description of the status of the subscriber ValidationGSM Int GSM validation value -1-N/A; 100-Valid; 101-No ID; 103-No Photo; 104-No ID and Photo; 105-No Name; 106-ID not Clear; 107-Photo not Clear; 108-Invalid ID; 109-Names does not Match; 110-No Information |
| `RegistrationGSMTxt` | `String` | Textual description of the ValidationGSM ValidationOM Int OrangeMoney validation value -1-N/A; 200-Valid; 201-No ID; 202-No Photo; 203-Unreadable ID; 204Invalid ID; 205-Conflict of identity (Form/ID); 206-No Contract; 207Unreadable Contract; 208-Unsigned Contract; 209-Contract information does not match; 210-No Orange Money |
| `RegistrationOMTxt` | `String` | Textual description of the ValidationOM |
| `OMLevel` | `String` | KYC Orange Money Level (1 – Level 1; 2 – Level 2; 3 – Level 3) |
| `OMLevelTxt` | `String` | Textual description of the OMLevel |
| `FinalValidTxt` | `String` | Final evaluation of the registration |

## Mock Responses

### POST — Sets the Subscriber KYC Registration Status

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "MSISDN": "0777777588",
    "FullName": "John Doe",
    "StatusTxt": "Active",
    "RegistrationGSMTxt": "sample_RegistrationGSMTxt",
    "RegistrationOMTxt": "sample_RegistrationOMTxt",
    "OMLevel": "sample_OMLevel",
    "OMLevelTxt": "sample_OMLevelTxt",
    "FinalValidTxt": "sample_FinalValidTxt"
  }
}
```

### GET — Returns the Subscriber KYC Registration Status

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "MSISDN": "0777777588",
    "FullName": "John Doe",
    "StatusTxt": "Active",
    "RegistrationGSMTxt": "sample_RegistrationGSMTxt",
    "RegistrationOMTxt": "sample_RegistrationOMTxt",
    "OMLevel": "sample_OMLevel",
    "OMLevelTxt": "sample_OMLevelTxt",
    "FinalValidTxt": "sample_FinalValidTxt"
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

### POST — Sets the Subscriber KYC Registration Status

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/KYC/Status" \
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

### GET — Returns the Subscriber KYC Registration Status

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/KYC/Status?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
