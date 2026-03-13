# SIMREG/Subscriber/Register/Upgrade

This method allows an Orange Liberia subscriber registration to be upgraded.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes the registration upgrade process for a subscriber |


## Endpoint URL

```
/TIMM/v1/SIMREG/Subscriber/Register/Upgrade
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/SIMREG/Subscriber/Register/Upgrade` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Subscriber/Register/Upgrade` |

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
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to register. Phone number can have a size of either 10 or 12 digits. API is restricted to the following ranges: 07xxxxxxx Or 2317xxxxxxxx. |
| `RegType` | `String` | ✅ Required | Registration type: OM |
| `KINName` | `String` | ✅ Required | Next of Kin Name |
| `KINPhone` | `String` | ✅ Required | Next of Kin Phone |
| `KINEmail` | `String` | ⬜ Optional | Next of Kin eMail |
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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

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
    "Documents": {"Type":"Contract", "Format":"PNG", "IMG":"*image encoded*" },
    "Reg": {
        "MSISDN": "0777777588",
        "RegType": "OM",
        "KINName": "John Doe",
        "KINPhone": "<KINPhone>",
        "KINEmail": "<KINEmail>",
        "RegDate": "2024-11-07",
        "LAT": "<LAT>",
        "LNG": "<LNG>",
        "CellID": "ID-001234",
        "AppVersion": "<AppVersion>"
}}}'
```

