# FlyTxt/Inbound/Offers

This method is called to obtain the inbound offers existing on the FlyTxt platform.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the inbound offers |

## Endpoint URL

```
INT/v1/Flytxt/Inbound/Offers
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.12:11000/INT/v1/Flytxt/Inbound/Offers` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/INT/v1/Flytxt/Inbound/Offers` |

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx`. Or, if pseudonymization is enabled for the connection, encrypted `X-MSISDN` header can be passed in directly. |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing inbound offers |
| `resultset.Offers` | `Array` | List of inbound offers returned by FlyTxt |
| `resultset.Offers[].Category` | `String` | Offer category |
| `resultset.Offers[].Id` | `String` | Offer ID |
| `resultset.Offers[].Message` | `String` | Offer message |
| `resultset.Offers[].OfferType` | `String` | Offer type |
| `resultset.Offers[].Order` | `String` | Display order |
| `resultset.Offers[].Price` | `String` | Offer price |
| `resultset.Offers[].ProductID` | `String` | Bundle Mapped ID |
| `resultset.Offers[].ProductID2` | `String` | Bundle ID |
| `resultset.Offers[].ProductPrice` | `String` | Product price |
| `resultset.Offers[].ShortMessage` | `String` | Short offer message |
| `resultset.internal_code` | `String` | Internal execution code returned by FlyTxt |
| `resultset.internal_msg` | `String` | Internal execution message returned by FlyTxt |

## Responses

### GET — Returns the inbound offers

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Offers": [
      {
        "Category": "Recharge offer",
        "Id": "2473",
        "Message": "Get 16,000MB data valid 30days for $15.",
        "OfferType": "recharge",
        "Order": "1",
        "Price": "0.5",
        "ProductID": "10331-146",
        "ProductID2": "BTL-DATA3000-16000M-30d",
        "ProductPrice": "15",
        "ShortMessage": "$15-16000MB-30Days"
      },
      {
        "Category": "Recharge offer",
        "Id": "2455",
        "Message": "Get 300mins On-net + 1000SMS valid 30days for $5.",
        "OfferType": "recharge",
        "Order": "2",
        "Price": "0.1",
        "ProductID": "10308-70",
        "ProductID2": "BLT-VOICE-300VONN-1000S-30d",
        "ProductPrice": "5",
        "ShortMessage": " $5-300mins-30Days"
      },
      {
        "Category": "Recharge offer",
        "Id": "2466",
        "Message": "Get 350mins on-net + 28mins off-net and 400MB Data valid 30Days for $5.",
        "OfferType": "recharge",
        "Order": "3",
        "Price": "0.1",
        "ProductID": "10409-36",
        "ProductID2": "BLT-MIX-350VONN-28VOFF-1000S-400M-30d",
        "ProductPrice": "5",
        "ShortMessage": "$5 378mins+400MB 30days"
      },
      {
        "Category": "Recharge offer",
        "Id": "2470",
        "Message": "Get 34,000MB data valid 30days for $30.",
        "OfferType": "recharge",
        "Order": "4",
        "Price": "0.5",
        "ProductID": "10331-151",
        "ProductID2": "BTL-DATA6000-34000M-30d",
        "ProductPrice": "30",
        "ShortMessage": "$30-34000MB-30Days"
      },
      {
        "Category": "Recharge offer",
        "Id": "2472",
        "Message": "Get 300mins On-net + 1000SMS valid 30days for $5.",
        "OfferType": "recharge",
        "Order": "5",
        "Price": "0.1",
        "ProductID": "10308-70",
        "ProductID2": "BLT-VOICE-300VONN-1000S-30d",
        "ProductPrice": "5",
        "ShortMessage": " $5-300mins-30Days"
      },
      {
        "Category": "Recharge offer",
        "Id": "2325",
        "Message": "Get 90mins on-net + 8mins off-net and 200MB Data valid 5Days for 250LD.",
        "OfferType": "recharge",
        "Order": "6",
        "Price": "0.1",
        "ProductID": "10409-14",
        "ProductID2": "BLT-MIX-90VONN-8VOFF-300S-200M-5d",
        "ProductPrice": "1.25",
        "ShortMessage": "250LD 98mins+200MB 5days"
      }
    ],
    "internal_code": "200",
    "internal_msg": "Success"
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
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Returns the inbound offers

```bash
curl -k -X GET \
  "http://192.168.19.12:11000/INT/v1/Flytxt/Inbound/Offers?auth:user=api_user&auth:pwd=api_password&param:msisdn=0777777588"
```
