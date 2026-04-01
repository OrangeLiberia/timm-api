# Agent/Balance/IN

This method will allow’ s to see the agent telecom wallet or get the subscriber’s Balance.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add Amount to a Subscriber Telecom Wallet ( aka Recharge ) |
| `GET` | Get Current Amount on a Subscriber Telecom Wallet |
| `DELETE` | Remove Amount to a Subscriber Telecom Wallet ( aka Charge ) |

## Endpoint URL

```
TIMM/v2/Subscriber/Balance/IN
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v2/Subscriber/Balance/IN` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Wallet` | `EnumString` | ✅ Required | Identification of Wallet being charged: - |
| `Currency` | `EnumString` | ✅ Required | Main, Bonus, Extra Identification of Wallet being charged: - USD, LD |
| `Amount` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `Comment` | `String` | ✅ Required | String that identifies the reason of charge |
| `ExternalID` | `String` | ✅ Required | Reference’s to unique id of the caller transaction (optional) |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `msisdn` | `String` | Output Sender id used |
| `Internal_code` | `String` | Output wallets Object[] Output Recipients object array JSON Object Array Wallets |
| `Balance` | `String` | Output Amount in the wallet |
| `BalanceExp` | `String` | Output Expiration date for the Balance |
| `CumulativeBalance` | `String` | Output Cumulative Amount in the wallet |
| `CurrencyName` | `String` | Output Currency Symbol Name |
| `CurrencySymbol` | `String` | Output Currency Symbol: USD, LRD |
| `Message` | `String` | Output Customer facing message of the wallet information |
| `CurrencyID` | `String` | Output Internal ID of the Currency |
| `WalletID` | `String` | Output Internal ID for the Wallet |
| `WalletName` | `String` | Output Type of Wallet: Main, Bonus, Extra |

## Mock Responses

### POST — Add Amount to a Subscriber Telecom Wallet ( aka Recharge )

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "msisdn": "0777777588",
    "Internal_code": "CODE001",
    "Balance": "250.00",
    "BalanceExp": "250.00",
    "CumulativeBalance": "250.00",
    "CurrencyName": "LRD",
    "CurrencySymbol": "LRD",
    "Message": "sample_Message",
    "CurrencyID": "LRD",
    "WalletID": "sample_WalletID",
    "WalletName": "sample_WalletName"
  }
}
```

### GET — Get Current Amount on a Subscriber Telecom Wallet

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "msisdn": "0777777588",
    "Internal_code": "CODE001",
    "Balance": "250.00",
    "BalanceExp": "250.00",
    "CumulativeBalance": "250.00",
    "CurrencyName": "LRD",
    "CurrencySymbol": "LRD",
    "Message": "sample_Message",
    "CurrencyID": "LRD",
    "WalletID": "sample_WalletID",
    "WalletName": "sample_WalletName"
  }
}
```

### DELETE — Remove Amount to a Subscriber Telecom Wallet ( aka Charge )

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "msisdn": "0777777588",
    "Internal_code": "CODE001",
    "Balance": "250.00",
    "BalanceExp": "250.00",
    "CumulativeBalance": "250.00",
    "CurrencyName": "LRD",
    "CurrencySymbol": "LRD",
    "Message": "sample_Message",
    "CurrencyID": "LRD",
    "WalletID": "sample_WalletID",
    "WalletName": "sample_WalletName"
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

### POST — Add Amount to a Subscriber Telecom Wallet ( aka Recharge )

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Wallet": "<Wallet>",
    "Currency": "LRD",
    "Amount": 100.0,
    "Comment": "<Comment>",
    "ExternalID": "ID-001234"
  }
}'
```

### GET — Get Current Amount on a Subscriber Telecom Wallet

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Wallet=<Wallet>&param:Currency=LRD&param:Amount=100.0&param:Comment=<Comment>&param:ExternalID=ID-001234"
```

### DELETE — Remove Amount to a Subscriber Telecom Wallet ( aka Charge )

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v2/Subscriber/Balance/IN?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Wallet=<Wallet>&param:Currency=LRD&param:Amount=100.0&param:Comment=<Comment>&param:ExternalID=ID-001234"
```
