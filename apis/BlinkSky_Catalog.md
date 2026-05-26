# BlinkSky/Catalog

This method will allows to obtain the list of products available on BlinkSky catalog.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a caller to get BlinkSky Catalog information |

## Endpoint URL

```
INT/v1/BlinkSky/Catalog
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/INT/v1/BlinkSky/Catalog` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/v1/BlinkSky/Catalog` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

No parameters are required for this endpoint.

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing BlinkSky catalog information |
| `resultset.ExecTxt` | `String` | Execution text returned by BlinkSky system |
| `resultset.DATA` | `Array` | List of catalog items |
| `resultset.DATA[].ITEMS` | `String` | Item list |
| `resultset.DATA[].MIN_RANGE` | `String` | Minimum range |
| `resultset.DATA[].MAX_RANGE` | `String` | Maximum range |
| `resultset.DATA[].FEE` | `String` | Fee |
| `resultset.DATA[].DISCOUNT` | `String` | Discount |
| `resultset.DATA[].FXRATE` | `String` | FX rate |
| `resultset.DATA[].IS_VARIABLE` | `String` | Variable amount indicator |
| `resultset.DATA[].NAME` | `String` | Product name |
| `resultset.DATA[].CODE` | `String` | Product code |
| `resultset.DATA[].CURRENCY` | `String` | Currency code of the catalog item |
| `resultset.DATA[].DESC` | `String` | Product description |
| `resultset.DATA[].DISCLOSURES` | `String` | Disclosure text |
| `resultset.DATA[].LOGO` | `String` | Product logo URL |
| `resultset.DATA[].VALUE` | `String` | Allowed values |

## Responses

### GET — Allows for a caller to get BlinkSky Catalog information

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ExecTxt": "Success",
    "DATA": [
      {
        "ITEMS": "",
        "MIN_RANGE": "5",
        "MAX_RANGE": "1000",
        "FEE": "0.99",
        "DISCOUNT": "0.020000",
        "FXRATE": "0",
        "IS_VARIABLE": "TRUE",
        "NAME": "Amazon",
        "CODE": "62",
        "CURRENCY": "USD",
        "DESC": "Amazon.com Gift Cards never expire and can be redeemed towards millions of items at www.Amazon.com, www.MyHabit.com, and certain of its affiliated websites. Amazon.com's huge selection is the place to find and discover almost anything you want to buy online at a great price. Redeem at http://www.amazon.com/redeem. Valid only for U.S. Accounts.",
        "DISCLOSURES": "",
        "LOGO": "https://blinksky.azureedge.net/a5e9d597.jpg",
        "VALUE": "5,10,25,50,100,250,500,1000"
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

### GET — Allows for a caller to get BlinkSky Catalog information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/INT/v1/BlinkSky/Catalog?auth:user=api_user&auth:pwd=api_password"
```
