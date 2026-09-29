# Subscriber/Bundle/List/Promotional

This method will allow get information of the promotional Bundles available to be purchase.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get Promotional Bundles Available to be purchased by a Subscriber |

## Endpoint URL

```
TIMM/v1/Subscriber/Bundle/List/Promotional
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/List/Promotional` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/List/Promotional` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ⬜ Optional | Phone Number on whose account you want to add the Bundle. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. If provided personalized offers will be included else only generic offers are returned |
| `SegmentType` | `String` | ⬜ Optional | Customer segment used to filter promotional bundles. If empty, all applicable promotional bundles are returned |

## Response Fields

> Result type: **Object Array**

| Field | Type | Description |
|-------|------|-------------|
| `Activation` | `Object Array` | List of business zones and currencies where the Bundle can be purchased |
| `Allowances` | `Object Array` | List of allowances included in the Bundle |
| `BundleID` | `String` | Bundle Identification that should be activated. Bundle list |
| `CustomerSegment` | `String` | Customer Segment |
| `Description` | `String` | Bundle Description |
| `OfferDescription` | `String` | Description of the Offer |
| `Pricing` | `Object Array` | List of prices available for the Bundle |
| `Sequence` | `String` | Unique numeric value that represents the recommended sequence of presentation of the Bundles |
| `Terms` | `String` | Terms associated with the promotional Bundle |

### Activation Fields

| Field | Type | Description |
|-------|------|-------------|
| `Currency` | `String` | Currency USD/LRD |
| `Zone` | `String` | Business zone where the Bundle can be purchased - IN, OM |

### Allowances Fields

| Field | Type | Description |
|-------|------|-------------|
| `DataType` | `EnumString` | Data Type of the Value |
| `Type` | `EnumString` | Type of Allowance |
| `Value` | `String` | Allowance value |

### Pricing Fields

| Field | Type | Description |
|-------|------|-------------|
| `ActivationZone` | `String` | Business zone where the price applies for the Bundle: - IN, OM |
| `Amount` | `String` | Purchase Amount |
| `Currency` | `String` | Currency USD/LRD |

## Responses

### GET — Get Promotional Bundles Available to be purchased by a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "Activation": [
        {
          "Currency": "USD",
          "Zone": "IN"
        },
        {
          "Currency": "LRD",
          "Zone": "OM"
        },
        {
          "Currency": "USD",
          "Zone": "OM"
        }
      ],
      "Allowances": [
        {
          "DataType": "Day",
          "Type": "VALIDITY",
          "Value": "1"
        },
        {
          "DataType": "MByte",
          "Type": "DATA",
          "Value": "1700"
        }
      ],
      "BundleID": "PKG-2GB1Day",
      "CustomerSegment": "Both",
      "Description": "$1/190LD 1,70GB 1 day",
      "OfferDescription": "$1/190LRD Data with 1700 MB valid for 1 day",
      "Pricing": [
        {
          "ActivationZone": "IN",
          "Amount": "190",
          "Currency": "LRD"
        },
        {
          "ActivationZone": "IN",
          "Amount": "1",
          "Currency": "USD"
        },
        {
          "ActivationZone": "OM",
          "Amount": "190",
          "Currency": "LRD"
        },
        {
          "ActivationZone": "OM",
          "Amount": "1",
          "Currency": "USD"
        }
      ],
      "Sequence": "40100000",
      "Terms": ""
    }
  ]
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

### GET — Get Promotional Bundles Available to be purchased by a Subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/List/Promotional" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "SegmentType": ""
  }
}'
```
