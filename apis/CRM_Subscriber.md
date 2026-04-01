# CRM/Subscriber

This method can be called to get the registration data of the subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the Subscriber Registration Status |

## Endpoint URL

```
TIMM/v1/CRM/Subscriber
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Subscriber` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber` |

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
| `IMSI` | `String` | Subscriber IMSI |
| `FullName` | `String` | Subscribers full name |
| `IDCard` | `String` | Identity Card Number IDCardType Enum Identity Card Type |
| `IDCardTypeID` | `Integer` | Identity Card Type ID |
| `Email` | `String` | e-Mail |
| `OtherContact` | `String` | Other Contact |
| `BirthDate` | `String` | Birth date of the subscriber (YYYY-MM-DD HH:mm:ss) Gender Enum Subscriber gender (Male, Female, Not Aplicable) |
| `GenderID` | `Integer` | Gender ID |
| `Address` | `String` | Subscriber Address |
| `Country` | `String` | Subscriber Country |
| `SimType` | `String` | Subscriber SIM Type ( 2G, 4G, 5G) |
| `ProfileID` | `Integer` | Subscriber Profile ID |
| `ProfileName` | `String` | Subscriber Profile Name |
| `PrePaid` | `Integer` | 1 – PrePaid , 0 - PostPaid ValidationGSM Int GSM validation value -1-N/A; 100-Valid; 101-No ID; 103-No Photo; 104-No ID and Photo; 105-No Name; 106-ID not Clear; 107-Photo not Clear; 108-Invalid ID; 109-Names does not Match; 110-No Information |
| `RegistrationGSMTxt` | `String` | Textual description of the ValidationGSM ValidationOM Int OrangeMoney validation value -1-N/A; 200-Valid; 201-No ID; 202-No Photo; 203-Unreadable ID; 204Invalid ID; 205-Conflict of identity (Form/ID); 206-No Contract; 207Unreadable Contract; 208-Unsigned Contract; 209-Contract information does not match; 210-No Orange Money |
| `RegistrationOMTxt` | `String` | Textual description of the ValidationOM |
| `FinalValidTxt` | `String` | Final evaluation of the registration |
| `OMLevel` | `String` | KYC Orange Money Level ( Level_1, Level_2, Level_3) |
| `OMLevelTxt` | `String` | Textual description of the OMLevel |
| `PrePaid` | `Integer` | 1 – PrePaid , 0 - PostPaid |
| `Status` | `String` | Status of the subscriber (Active, Blocked, HotLine and Canceled) JSON Object |
| `array of IMG` | `Object` | Enum Type of Image: Face, Doc, Contract |
| `ImgID` | `Integer` | Image ID Format Enum Format of Image: JPG, PNGImg |

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
    "FullName": "John Doe",
    "IDCard": "sample_IDCard",
    "IDCardTypeID": "Standard",
    "Email": "john.doe@example.com",
    "OtherContact": "sample_OtherContact",
    "BirthDate": "2024-11-07T10:30:00",
    "GenderID": 1,
    "Address": "sample_Address",
    "Country": 1,
    "SimType": "Standard",
    "ProfileID": 1,
    "ProfileName": "sample_ProfileName",
    "PrePaid": 1,
    "RegistrationGSMTxt": "sample_RegistrationGSMTxt",
    "RegistrationOMTxt": "sample_RegistrationOMTxt",
    "FinalValidTxt": "sample_FinalValidTxt",
    "OMLevel": "sample_OMLevel",
    "OMLevelTxt": "sample_OMLevelTxt",
    "Status": "Active",
    "array of IMG": "sample_array of IMG",
    "ImgID": 1
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
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber?auth:user=api_user&auth:pwd=api_password"
```
