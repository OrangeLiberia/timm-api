# Subscriber/Details/OM

This method provides the Subscriber details, including it’s Orange Money Balance and last transactions.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the details for a Subscriber and current eValue and transactions for his Orange |

## Endpoint URL

```
TIMM/v1/Subscriber/Details/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Details/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Details/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being queried: USD, LD |
| `Wallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty Default: Main |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `Balance` | `String` | Amount in the wallet requested |
| `Barred` | `String` | Is wallet barred ( YES / NO ) |
| `FrBalance` | `String` | Frozen amount in the wallet request |
| `IdNo` | `String` | Subscriber identification number |
| `UserID` | `String` | User Id |
| `SuspendStatus` | `String` | Suspend status ( YES / NO ) |
| `Internal_colde` | `String` | Internal code |
| `Mapping_code` | `String` | Internal mapping code JSON Object Wallets |
| `Grade` | `String` |  |
| `Wallet grade` | `String` | Wallet name |
| `Id` | `String` | Wallet Id JSON Object Array Transactions[] |
| `TXNID` | `String` | Transaction Id |
| `Amount` | `String` | Amount of the transaction |
| `Service` | `String` | Transaction service |
| `Status` | `String` | Transaction status ( TS – Transaction Success, TF – Transaction Failed ) |
| `Mode` | `String` |  |
| `From` | `String` | From / To |

## Mock Responses

### GET — Gets the details for a Subscriber and current eValue and transactions for his Orange

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "Balance": "250.00",
    "Barred": "sample_Barred",
    "FrBalance": "250.00",
    "IdNo": "sample_IdNo",
    "UserID": "sample_UserID",
    "SuspendStatus": "Active",
    "Internal_colde": "sample_Internal_colde",
    "Mapping_code": "CODE001",
    "Grade": "sample_Grade",
    "Wallet grade": "sample_Wallet grade",
    "Id": "sample_Id",
    "TXNID": "sample_TXNID",
    "Amount": 100.0,
    "Service": "sample_Service",
    "Status": "Active",
    "Mode": "sample_Mode",
    "From": "sample_From"
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

### GET — Gets the details for a Subscriber and current eValue and transactions for his Orange

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Details/OM?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Currency=LRD&param:Wallet=<Wallet>"
```
