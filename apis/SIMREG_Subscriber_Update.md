# SIMREG/Subscriber/Update

This method allows the registration of a subscriber to be updated.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes the registration process for a subscriber |

## Endpoint URL

```
TIMM/v1/SIMREG/Subscriber/Update
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/SIMREG/Subscriber/Update` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/SIMREG/Subscriber/Update` |

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
| `Img` | `String` | ✅ Required | Image encoded Format Enum |
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to register. Phone number can have a size of either 10 or 12 digits. Application might by restricted to the following ranges: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
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
| `AgentMSISDN` | `String` | ✅ Required | Agent MSISDN |
| `AgentIMEI` | `String` | ✅ Required | Agent IMEI |
| `AgentICCID` | `String` | ✅ Required | Agent ICCID |
| `LAT` | `String` | ⬜ Optional | GPS Latitude |
| `LNG` | `String` | ⬜ Optional | GPS Longitude |
| `CellID` | `String` | ⬜ Optional | Cell ID |
| `AppVersion` | `String` | ✅ Required | Version of the App, should be in format: AppMonikor:Version If RegType is OM, the following fields should apply: |
| `KINName` | `String` | ⬜ Optional | Next of Kin Name |
| `KINPhone` | `String` | ⬜ Optional | Next of Kin Phone |
| `KINEmail` | `String` | ⬜ Optional |  |
| `Next of Kin eMail` | `String` | ✅ Required | Agent PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform, and encoded into Base64. AGENTPINENC AgentPIN Agent PIN |

## Mock Responses

### POST — Executes the registration process for a subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "status": "Active",
    "iccid": "892310700000000780"
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

### POST — Executes the registration process for a subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/SIMREG/Subscriber/Update" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "Documents": "<Documents>",
    "Reg": "<Reg>",
    "Img": "<Img>",
    "MSISDN": "0777777588",
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
    "AgentMSISDN": "0777777588",
    "AgentIMEI": "<AgentIMEI>",
    "AgentICCID": "892310700000000780",
    "LAT": "<LAT>",
    "LNG": "<LNG>",
    "CellID": "ID-001234",
    "AppVersion": "<AppVersion>",
    "KINName": "John Doe",
    "KINPhone": "<KINPhone>",
    "KINEmail": "<KINEmail>",
    "Next of Kin eMail": "<Next of Kin eMail>"
  }
}'
```
