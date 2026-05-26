# Subscriber/BlinkSky/OM/Pay

This method will allow a subscriber to buy a BlinkSky product using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay for BlinkSky |

## Endpoint URL

```
TIMM/v1/Subscriber/BlinkSky/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/BlinkSky/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/BlinkSky/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted aka cashedout. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly |
| `PayerPIN` | `String` | ✅ Required | Payer's PIN |
| `CARDCODE` | `String` | ✅ Required | BlinkSky catalog product code |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet currency being charged: USD, LRD |
| `WALLET` | `EnumString` | ✅ Required | Defines in what Wallet the action should take place: Main, Commission or Loyalty. Default: Main |
| `Amount` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `RECIPENTMSISDN` | `String` | ✅ Required | Recipient Phone Number on whose account the BlinkSky product should be associated with and will receive the SMS. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing BlinkSky payment information |
| `resultset.ExecTxt` | `String` | Execution text returned by BlinkSky system |
| `resultset.STATUS` | `String` | Status |
| `resultset.BALANCE` | `String` | Balance |
| `resultset.KEY` | `String` | Product key |
| `resultset.DISCOUNT` | `String` | Discount |
| `resultset.LIST` | `String` | Item list |
| `resultset.PARAM` | `String` | Parameter |
| `resultset.SESSIONID` | `String` | Session ID |
| `resultset.REFERENCE` | `String` | Reference |
| `resultset.TEXT` | `String` | Text message |
| `resultset.VALUE` | `String` | Value |
| `resultset.OMTRXID` | `String` | Orange Money transaction ID |

## Responses

### POST — Allows for a Subscriber to Pay for BlinkSky

**Response (`resultset.ExecTxt: Success`):**
```json
{
  "exec_code": -2000,
  "exec_msg": "Execution Error",
  "resultset": {
    "ExecTxt": "Success",
    "STATUS": "OK",
    "BALANCE": "100",
    "KEY": "Amazon",
    "DISCOUNT": "10",
    "LIST": "item1,item2",
    "PARAM": "p1",
    "SESSIONID": "12345",
    "REFERENCE": "ref-001",
    "TEXT": "You have purchased a Amazon gift Card",
    "VALUE": "42",
    "OMTRXID": "MP260525.1016.B22162"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -2000,
  "exec_msg": "Execution Error",
  "resultset": {
    "ExecTxt": "Not Enough Balance"
  }
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

### POST — Allows for a Subscriber to Pay for BlinkSky

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/BlinkSky/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0760790119",
    "PayerPIN": "<PayerPIN>",
    "CARDCODE": "62",
    "CURRENCY": "USD",
    "WALLET": "MAIN",
    "Amount": "25.00",
    "RECIPENTMSISDN": "0760790229"
  }
}'
```
