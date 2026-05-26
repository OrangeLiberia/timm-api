# Subscriber/JungleEnergy/OM/Pay

This method will allow a subscriber to top up a JungleEnergy Meter using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay for JungleEnergy |

## Endpoint URL

```
TIMM/v1/Subscriber/JungleEnergy/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/JungleEnergy/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/JungleEnergy/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `METERID` | `String` | ✅ Required | Unique identifier of the Meter we are topping up |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet currency being charged: USD, LRD |
| `WALLET` | `EnumString` | ✅ Required | Defines in what Wallet the action should take place: Main, Commission or Loyalty. Default: Main |
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `AMOUNT` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `EXTERNALID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |
| `PAYERPIN` | `String` | ✅ Required | Payer’s PIN |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing JungleEnergy payment information |
| `resultset.TXNID` | `String` | Transaction ID |
| `resultset.CURRENCY` | `String` | Currency code returned by JungleEnergy system |
| `resultset.ExecTxt` | `String` | Execution text returned by JungleEnergy system |
| `resultset.METERNUMBER` | `String` | Meter number |
| `resultset.CUSTOMERNAME` | `String` | Customer name |
| `resultset.ORGANIZATION` | `String` | Organization |
| `resultset.COMMUNITY` | `String` | Community |
| `resultset.TOKEN` | `String` | Token |
| `resultset.TARIFF` | `String` | Tariff |
| `resultset.ACTUALVALUE` | `String` | Actual value |
| `resultset.ACTUALUNITS` | `String` | Actual units |
| `resultset.REMAININGCREDIT` | `String` | Remaining credit |
| `resultset.ORIGAMOUNT` | `String` | Original amount |
| `resultset.EXCHANGERATE` | `String` | Exchange rate |
| `resultset.CORRITXID` | `String` | Correlation internal transaction ID |
| `resultset.CORRATXID` | `String` | Correlation account transaction ID |

## Responses

### POST — Allows for a Subscriber to Pay for JungleEnergy

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TXNID": "MP260525.0502.B71531",
    "CURRENCY": "USD",
    "ExecTxt": "Success",
    "METERNUMBER": "600727800784888085",
    "CUSTOMERNAME": "Goanmon K. Wehyee",
    "ORGANIZATION": "Ganta Guinea road",
    "COMMUNITY": "Ganta",
    "TOKEN": "44600993517963042063",
    "TARIFF": "0.248800",
    "ACTUALVALUE": "10",
    "ACTUALUNITS": "40.200000",
    "REMAININGCREDIT": "98888.365300",
    "ORIGAMOUNT": "10",
    "EXCHANGERATE": "1"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -2000,
  "exec_msg": "Error",
  "resultset": {
    "TXNID": "MP260525.1016.B22162",
    "CORRITXID": "TC260525.1016.B14950",
    "CORRATXID": "TC260525.1016.B14950"
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

### POST — Allows for a Subscriber to Pay for JungleEnergy

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/JungleEnergy/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "METERID": "25122502872",
    "CURRENCY": "LRD",
    "WALLET": "MAIN",
    "MSISDN": "0777087333",
    "AMOUNT": "850",
    "EXTERNALID": "0001",
    "PAYERPIN": "<PAYERPIN>"
  }
}'
```
