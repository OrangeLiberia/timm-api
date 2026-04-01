# SIMREG/Subscriber/Register/Self

This method allows the self registration of a subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes the registration process for a subscriber |

## Endpoint URL

```
/TIMM/v1/SIMREG/Subscriber/Register/Self
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/SIMREG/Subscriber/Register/Self` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Subscriber/Register/Self` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to register. Phone number can have a size of either 10 or 12 digits. Registration of  the following ranges: 07xxxxxxx Or 2317xxxxxxxx is not allowed. |
| `RegType` | `String` | ✅ Required | Registration type: OM |
| `FName` | `String` | ✅ Required | First Name |
| `LName` | `String` | ✅ Required | Last Name |
| `BDay` | `String` | ⬜ Optional with Default | Birth Date in the format YYYY-MM-DD, if not provided it will default to *2000-01-01* |
| `BPlace` | `String` | ⬜ Optional with Default | Birth Place, if not provided it will default to *Monrovia* |
| `GenderID` | `Integer` | ⬜ Optional with Default | Gender ID specified in /TIMM/v1/CRM/Types/Gender, if not provided it will default to *Not Aplicable* |
| `IDCard` | `String` | ⬜ Optional | ID Card Identification, if not provided it will default to *MSISDN* |
| `IDCardType` | `Integer` | ⬜ Optional | Document ID specified in /TIMM/v1/CRM/Types/Document/ID, if not provided it will default to *Employer ID* |
| `RegDate` | `String` | ⬜ Optional | Registration Date in format YYYY-MM-DD HH:mm:SS |
| `LAT` | `String` | ⬜ Optional | GPS Latitude |
| `LNG` | `String` | ⬜ Optional | GPS Longitude |
| `CellID` | `String` | ⬜ Optional | Cell ID |
| `AppVersion` | `String` | ✅ Required | Version of the App, should be in format: AppMonikor:Version |


## Mock Responses

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
    "MSISDN": "0887777588",
    "FName": "John Doe",
    "LName": "John Doe",
    "BDay": "<BDay>",
    "BPlace": "<BPlace>",
    "GenderID": "1",
    "IDCard": "ID-001234",
    "IDCardType": "ID-001234",
    "LAT": "<LAT>",
    "LNG": "<LNG>",
    "CellID": "ID-001234",
    "AppVersion": "<AppVersion>"
  }
}'
```
