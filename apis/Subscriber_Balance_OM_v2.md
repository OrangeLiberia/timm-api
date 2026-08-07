# Subscriber/Balance/OM

This method provides the Subscriber the Orange Money Balance for one or more Wallets.

This document describes the new response version of `/TIMM/v2/Subscriber/Balance/OM`.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get the current eValue for the Subscriber Orange Money wallets |

## Endpoint URL

```
TIMM/v2/Subscriber/Balance/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v2/Subscriber/Balance/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | Required | Phone Number on whose account you want to query the Orange Money Balance. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `CURRENCY` | `EnumString` | Required | Identification of Wallet currency being queried: `USD`, `LRD`, `ALL` |
| `WALLETLST` | `String` | Required | Comma separated list of wallets to be queried, or `ALL` to query all available wallets |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `MSISDN` | `String` | Subscriber MSISDN returned by the platform |
| `Wallets` | `Object Array` | List of Orange Money wallets returned by the Balance query |

### Wallets Fields

| Field | Type | Description |
|-------|------|-------------|
| `Currency` | `String` | Wallet currency |
| `WalletID` | `String` | Internal ID for the Wallet |
| `Wallet` | `String` | Output Type of Wallet: MAIN, BONUS, LOYALTY, BUSINESS, COMMISSION, SUSPENSE |
| `Balance` | `String` | Amount in the wallet requested |
| `FrBalance` | `String` | Frozen amount in the wallet requested |
| `IdNo` | `String` | Subscriber identification number |
| `UserID` | `String` | User Id |
| `Barred` | `String` | Is wallet barred ( YES / NO ) |
| `SuspendStatus` | `String` | Suspend status ( YES / NO ) |
| `internal_code` | `String` | Internal execution code |
| `mapping_code` | `String` | Internal mapping code |
| `internal_msg` | `String` | Internal message returned for the wallet. This field may be omitted |

## Responses

### GET — Get the current eValue for the Subscriber Orange Money wallets

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "MSISDN": "231777777588",
    "Wallets": [
      {
        "Currency": "USD",
        "WalletID": "12",
        "Wallet": "MAIN",
        "Balance": "24.20",
        "FrBalance": "0.00",
        "IdNo": "7588",
        "UserID": "PT170627.1622.022179",
        "Barred": "No",
        "SuspendStatus": "No",
        "internal_code": "200",
        "mapping_code": "200"
      },
      {
        "Currency": "USD",
        "WalletID": "22",
        "Wallet": "LOYALTY",
        "Balance": "310.27",
        "FrBalance": "0.00",
        "IdNo": "7588",
        "UserID": "PT170627.1622.022179",
        "Barred": "No",
        "SuspendStatus": "No",
        "internal_code": "200",
        "mapping_code": "200"
      }
    ]
  }
}
```

**Success With Warning Response (`exec_code: 100`):**
```json
{
  "exec_code": 100,
  "exec_msg": "Success with Warning: 4 of 10 balance enquiries failed",
  "resultset": {
    "MSISDN": "231777777588",
    "Wallets": [
      {
        "Currency": "LRD",
        "WalletID": "12",
        "Wallet": "MAIN",
        "Balance": "3.93",
        "FrBalance": "0.00",
        "IdNo": "7588",
        "UserID": "PT170627.1629.047769",
        "Barred": "No",
        "SuspendStatus": "No",
        "internal_code": "200",
        "mapping_code": "200",
        "internal_msg": "Wallet not found"
      },
      {
        "Currency": "LRD",
        "WalletID": "21",
        "Wallet": "COMMISSION",
        "internal_code": "200"
      }
    ]
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

### GET — All Currencies and Wallets

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/OM" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "ALL",
    "WALLETLST": "ALL"
  }
}'
```

### GET — USD MAIN and LOYALTY Wallets

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/OM" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "USD",
    "WALLETLST": "MAIN,LOYALTY"
  }
}'
```
