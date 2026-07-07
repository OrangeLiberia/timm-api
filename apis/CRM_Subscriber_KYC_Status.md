# CRM/Subscriber/KYC/Status

This method can be called to set or get the KYC registration status of the subscriber. It will only return a successful code if subscriber exists.

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
| `MSISDN` | `String` | ✅ Required | Phone Number whose KYC registration status should be updated. Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx` |
| `AgentMSISDN` | `String` | Optional | Agent MSISDN associated with the KYC validation. If not provided, the value is sent as `NULL` |
| `ValidationGSM` | `Integer` | ✅ Required | GSM validation value. See API `/TIMM/v1/CRM/Types/KYC/GSM` for reference |
| `ValidationOM` | `Integer` | ✅ Required | Orange Money validation value. See API `/TIMM/v1/CRM/Types/KYC/OM` for reference |
| `OMLevel` | `Integer` | Optional | Orange Money KYC level. See API `/TIMM/v1/CRM/Types/KYC/Level` for reference. Default: `1` |

### GET Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number whose KYC registration status should be returned. Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx` |


## GET Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | MSISDN |
| `FullName` | `String` | Subscribers full name Status Enum Status of the subscriber 1-Active; 4-HotLine (Simbox); 6-HotLine ( Only Receives ); 7-Auto-Blocked; 8-Blocked; 9-Cancelled |
| `StatusTxt` | `String` | Textual description of the status of the subscriber |
| `RegistrationGSMTxt` | `String` | Textual description of the GSM validation status. See API `/TIMM/v1/CRM/Types/KYC/GSM` for reference |
| `RegistrationOMTxt` | `String` | Textual description of the Orange Money validation status. See API `/TIMM/v1/CRM/Types/KYC/OM` for reference |
| `OMLevel` | `String` | Orange Money KYC level. See API `/TIMM/v1/CRM/Types/KYC/Level` for reference |
| `OMLevelTxt` | `String` | Textual description of the OMLevel |
| `FinalValidTxt` | `String` | Final evaluation of the registration |

## Responses

### POST — Sets the Subscriber KYC Registration Status

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success"
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
  "exec_code": -1004,
  "exec_msg": "Execution failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
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
    "MSISDN": "0777777588",
    "AgentMSISDN": "0777000000",
    "ValidationGSM": 100,
    "ValidationOM": 200,
    "OMLevel": 1
  }
}'
```

### GET — Returns the Subscriber KYC Registration Status

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber/KYC/Status?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
