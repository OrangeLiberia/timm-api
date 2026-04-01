# SIMREG/Subscriber/Register/Update

This method allows the registration of a subscriber to be updated..

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes the registration process for a subscriber |


## Endpoint URL

```
/TIMM/v1/SIMREG/Subscriber/Register/Update
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/SIMREG/Subscriber/Register/Update` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Subscriber/Register/Update` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Documents` | `Object` | ⬜ Optional | Image list |
| `Reg` | `Object` | ✅ Required | Registration information of the subscriber param::Documents Array Enum |

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
|Json Object|   param::Documents Array      |
| `Type` | `String` | ✅ Required | Type of Image: Face, IDCard, IDCardBack, Contract |
| `Img` | `String` | ✅ Required | Image encoded  |
| `Format` | `String` | ✅ Required | Format of Image: JPG, PNG  |
| `Enc` | `String` | ⬜ Optional | Type of encoding used: base64, base85/ascii8, default base64 |

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
|Json Object|   param::Reg Object           |
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to register. Phone number can have a size of either 10 or 12 digits. |
| `RegType` | `String` | ✅ Required | Registration type: OM |
| `FName` | `String` | ⬜ Optional | First Name |
| `LName` | `String` | ⬜ Optional | Last Name |
| `BDay` | `String` | ⬜ Optional | Birth Date in the format YYYY-MM-DD |
| `BPlace` | `String` | ⬜ Optional | Birth Place |
| `GenderID` | `Integer` | ⬜ Optional | Gender ID specified in /TIMM/v1/CRM/Types/Gender |
| `IDCard` | `String` | ⬜ Optional | ID Card Identification |
| `IDCardType` | `Integer` | ⬜ Optional | Document ID specified in /TIMM/v1/CRM/Types/Document/ID |
| `OccupationID` | `Integer` | ⬜ Optional | Occupation ID specified in /TIMM/v1/CRM/Types/Occupation |
| `ADDTypeID` | `Integer` | ⬜ Optional | Address Type ID specified in /TIMM/v1/CRM/Types/Address |
| `ADDCounty` | `Integer` | ⬜ Optional | County ID specified in /TIMM/v1/CRM/Types/County |
| `Address` | `String` | ⬜ Optional | Address |
| `eMail` | `String` | ⬜ Optional | eMail |
| `CountryID` | `Integer` | ⬜ Optional | Country ID specified in /TIMM/v1/CRM/Types/Country |
| `WorkAddress` | `String` | ⬜ Optional | Place of Work |
| `RegDate` | `String` | ⬜ Optional | Registration Date in format YYYY-MM-DD HH:mm:SS |
| `KName` | `String` | ⬜ Optional | Full name of the underage end user of the MSISDN |
| `LAT` | `String` | ⬜ Optional | GPS Latitude |
| `LNG` | `String` | ⬜ Optional | GPS Longitude |
| `CellID` | `String` | ⬜ Optional | Cell ID |
| `AppVersion` | `String` | ⬜ Optional | Version of the App, should be in format: AppMonikor:Version |
| `KINName` | `String` | ⬜ Optional | Next of Kin Name |
| `KINPhone` | `String` | ⬜ Optional | Next of Kin Phone |
| `KINEmail` | `String` | ⬜ Optional | Next of Kin eMail |

## Responses

### POST — Executes the registration process for a subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success"
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

### POST — Executes the registration process for a subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Subscriber/Register/Status" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "Documents": "<Documents>",
    "Reg": {
        "MSISDN": "0777777588",
        "ICCID": "892310700000000780",
        "FName": "John Doe",
        "LName": "John Doe",
        "BDay": "<BDay>",
        "BPlace": "<BPlace>",
        "GenderID": "ID-001234",
        "IDCard": "ID-001234",
        "IDCardType": "ID-001234",
        "OccupationID": "ID-001234",
        "ADDTypeID": "ID-001234",
        "ADDCounty": 1,
        "Address": "<Address>",
        "eMail": "<eMail>",
        "CountryID": "ID-001234",
        "WorkAddress": "<WorkAddress>",
        "RegDate": "2024-11-07",
        "KName": "John Doe",
        "LAT": "<LAT>",
        "LNG": "<LNG>",
        "CellID": "ID-001234",
        "AppVersion": "<AppVersion>",
        "KINName": "John Doe",
        "KINPhone": "<KINPhone>",
        "KINEmail": "<KINEmail>"
  }}
}'
```


