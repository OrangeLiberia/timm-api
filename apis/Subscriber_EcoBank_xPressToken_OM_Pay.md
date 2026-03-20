# Subscriber/EcoBank/xPressToken/OM/Pay

This method allows a Subscriber to make a payment using an EcoBank xPressToken through their Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to make a payment using an EcoBank xPressToken through the OM wallet |

## Endpoint URL

```
TIMM/v1/Subscriber/EcoBank/xPressToken/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/EcoBank/xPressToken/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/EcoBank/xPressToken/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Amount` | `String` | ✅ Required | Amount to be charged for the xPressToken payment |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `Wallet` | `EnumString` | ⬜ Optional | Defines in what Wallet the action should take place: Main, Comission or Loyalty Default: Main |
| `PAYERPIN` | `String` | ✅ Required | Payer's PIN. Payer's PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform, and encoded into Base64. |
| `RecipientMSISDN` | `String` | ⬜ Optional | Recipient Phone Number on whose account the token should be applied. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx |
| `Comment` | `String` | ⬜ Optional | Comment or note associated with the transaction |
| `ExternalID` | `String` | ⬜ Optional | Reference's to unique id of the caller transaction |


### POST — Allows for a Subscriber to make a payment using an EcoBank xPressToken through the OM wallet

**Success Response — Pending (`exec_code: 100`):**
```json
{
  "exec_code": 100,
  "exec_msg": "Success With Warn",
  "resultset": {
    "TXNID": "MP260319.1744.A00069",
    "TXNTYPE": "XPRESSTOKEN",
    "TOKENSTATUS": "Transaction accepted",
    "TOKEN":"<<empty>>"
  }
}
```

**Success Response — Completed (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TXNID": "MP260319.1744.A00069",
    "TXNTYPE": "XPRESSTOKEN",
    "TOKENSTATUS": "Transaction Completed",
    "TOKEN":"Token Data"
  }
}
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `TXNID` | `String` | Orange Money Transaction|
| `TXNTYPE` | `String` | Transaction Type (to be used on /TIMM/v1/OM/Transaction/Status to get future status ) |
| `TOKENSTATUS` | `EnumString` | Status of Token: Transaction failed; Transaction accepted; Transaction Completed; ... |
| `TOKEN` | `String` | xPress Token  |



**Error Response:**
```json
{
  "exec_code": -2000,
  "exec_msg": "General Error",
  "resultset": {
    "TXNID": "MP260319.1744.A00069",
    "TXNTYPE": "XPRESSTOKEN",
    "CORRITXID": "TC260319.1745.A00085",
    "CORRATXID": "TC260319.1745.A00085"
  }
}
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `TXNID` | `String` | Orange Money Transaction|
| `TXNTYPE` | `String` | Transaction Type (to be used on /TIMM/v1/OM/Transaction/Status to get future status ) |
| `CORRITXID` | `String` | Orange Money Transaction Correction Init  |
| `CORRATXID` | `String` | Orange Money Transaction Correction Commit |


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

### POST — Allows for a Subscriber to make a payment using an EcoBank xPressToken through the OM wallet

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/EcoBank/xPressToken/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0778888501",
    "Amount": "10",
    "Currency": "USD",
    "Wallet": "Main",
    "PAYERPIN": "1853",
    "RecipientMSISDN": "0778888501",
    "Comment": "Token",
    "ExternalID": "ID-001234"
  }
}'
```
