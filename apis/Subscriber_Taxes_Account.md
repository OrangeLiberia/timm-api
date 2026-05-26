# Subscriber/Taxes/Account

This method will allows to obtain the details of a subscriber on Taxes system.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to get the Tax information |

## Endpoint URL

```
TIMM/v1/Subscriber/Taxes/Account
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Taxes/Account` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Taxes/Account` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BILLID` | `String` | ✅ Required | Unique BillId tax account number that the taxes is being payed |
| `CURRENCY` | `EnumString` | ✅ Required | Currency code used to query the tax bill: USD, LRD |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing Taxes account information |
| `resultset.ExecTxt` | `String` | Execution text returned by Taxes system |
| `resultset.TIN` | `String` | Tax identification number |
| `resultset.NAME` | `String` | Subscriber name |
| `resultset.BILLNUMBER` | `String` | Bill number |
| `resultset.AMOUNT_TO_PAY` | `String` | Amount to pay |
| `resultset.CURRENCY` | `String` | Currency code |
| `resultset.RATE_EXCHANGE` | `String` | Rate exchange |
| `resultset.DETAILBILL` | `Array` | List of bill details |
| `resultset.DETAILBILL[].TAXCODE` | `String` | Tax code |
| `resultset.DETAILBILL[].DESC` | `String` | Tax description |
| `resultset.DETAILBILL[].AMOUNT` | `String` | Amount |
| `resultset.DETAILBILL[].AMOUNT_CH` | `String` | Charged amount |

## Responses

### POST — Allows for a Subscriber to get the Tax information

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ExecTxt": " Bill found",
    "TIN": " ",
    "NAME": "LAMINE Y KROMAH  ",
    "BILLNUMBER": "1003559",
    "AMOUNT_TO_PAY": "40",
    "CURRENCY": "USD",
    "RATE_EXCHANGE": "182.900000",
    "DETAILBILL": [
      {
        "TAXCODE": "079",
        "DESC": "MFA- ECOWAS PASSPORT FEE MFA - ECOWAS PASSPORT FEE",
        "AMOUNT": "40",
        "AMOUNT_CH": "7316"
      }
    ]
  }
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": " Bill not found"
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

### POST — Allows for a Subscriber to get the Tax information

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Taxes/Account" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "BILLID": "1003559",
    "CURRENCY": "USD"
  }
}'
```
