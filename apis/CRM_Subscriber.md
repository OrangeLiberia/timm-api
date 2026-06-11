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

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx. Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly |

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
| `IDCardType` | `String` | Identity Card Type |
| `IDCardTypeID` | `Integer` | Identity Card Type ID |
| `EMail` | `String` | e-Mail |
| `OtherContact` | `String` | Other Contact |
| `BirthDate` | `String` | Birth date of the subscriber (YYYY-MM-DD HH:mm:ss) Gender Enum Subscriber gender (Male, Female, Not Aplicable) |
| `Gender` | `String` | Subscriber gender |
| `GenderID` | `Integer` | Gender ID |
| `Address` | `String` | Subscriber Address |
| `Country` | `String` | Subscriber Country |
| `SimType` | `String` | Subscriber SIM Type ( 2G, 4G, 5G) |
| `ProfileID` | `Integer` | Subscriber Profile ID |
| `ProfileName` | `String` | Subscriber Profile Name |
| `PrePaid` | `Integer` | 1 – PrePaid , 0 - PostPaid |
| `ValidationGSM` | `Integer` | GSM validation value -1-N/A; 100-Valid; 101-No ID; 103-No Photo; 104-No ID and Photo; 105-No Name; 106-ID not Clear; 107-Photo not Clear; 108-Invalid ID; 109-Names does not Match; 110-No Information |
| `RegistrationGSMTxt` | `String` | Textual description of the ValidationGSM ValidationOM Int OrangeMoney validation value -1-N/A; 200-Valid; 201-No ID; 202-No Photo; 203-Unreadable ID; 204Invalid ID; 205-Conflict of identity (Form/ID); 206-No Contract; 207Unreadable Contract; 208-Unsigned Contract; 209-Contract information does not match; 210-No Orange Money |
| `ValidationOM` | `Integer` | OrangeMoney validation value -1-N/A; 200-Valid; 201-No ID; 202-No Photo; 203-Unreadable ID; 204Invalid ID; 205-Conflict of identity (Form/ID); 206-No Contract; 207Unreadable Contract; 208-Unsigned Contract; 209-Contract information does not match; 210-No Orange Money |
| `RegistrationOMTxt` | `String` | Textual description of the ValidationOM |
| `FinalValidTxt` | `String` | Final evaluation of the registration |
| `OMLevel` | `String` | KYC Orange Money Level ( Level_1, Level_2, Level_3) |
| `OMLevelTxt` | `String` | Textual description of the OMLevel |
| `PrePaid` | `Integer` | 1 – PrePaid , 0 - PostPaid |
| `Status` | `String` | Status of the subscriber (Active, Blocked, HotLine and Canceled) JSON Object |
| `StatusTxt` | `String` | Textual description of the Status |
| `array of IMG` | `Object` | Enum Type of Image: Face, Doc, Contract |
| `ImgID` | `Integer` | Image ID Format Enum Format of Image: JPG, PNGImg |

## Responses

### GET — Returns the Subscriber Registration Status

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Address": "Haile Selassie Avenue,Capital Byepass, Monrovia",
    "BirthDate": "1983-06-24 05:18:00.000",
    "Country": "Liberia",
    "EMail": "orange.lbr@orange.com",
    "FinalValidTxt": "Valid",
    "FullName": "Ian Ogutu",
    "Gender": "Not Aplicable",
    "GenderID": "1",
    "ICCID": "892310701009806538",
    "IDCard": "500002043",
    "IDCardType": "Business TIN",
    "IDCardTypeID": "10",
    "IMSI": "618070100980653",
    "MSISDN": "0778888501",
    "OMLevel": "-1",
    "OMLevelTxt": "N/A",
    "OtherContact": "0",
    "PrePaid": "1",
    "ProfileID": "239",
    "ProfileName": "USD Prepaid with OrangeMoney",
    "RegistrationGSMTxt": "Valid",
    "RegistrationOMTxt": "N/A",
    "ServiceID": "1011122691702",
    "SimType": "4G",
    "Status": "1",
    "StatusTxt": "Active",
    "ValidationGSM": "100",
    "ValidationOM": "-1",
    "document": ""
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

### GET — Returns the Subscriber Registration Status

```bash
curl -k -X GET \
  "http://APIDEV.Orange.com.lr/TIMM/v1/CRM/Subscriber" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "msisdn": "0778888501"
  }
}'
```
