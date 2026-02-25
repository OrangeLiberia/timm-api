# Subscriber/Bundle/List

This method will allow get information of the Bundles available to be purchase.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Add a Bundle to a Subscriber |

## Endpoint URL

```
TIMM/v1/Subscriber/Bundle/List
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/List` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/List` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ⬜ Optional | Phone Number on whose account you want to add the Bundle. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. If provided personalized offers will be included else only generic offers are returned |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `BundleId` | `String` |  |
| `Bundle Identification` | `String` | Bundle Description |
| `OfferDescription` | `String` | Description of the Offer Sequence Numeric Unique numeric value that represents the recommended sequence of presentation of the Bundles |
| `CustomerSegment` | `String` | Customer Segment: - |
| `BundleZone` | `String` | Logical zone of the Bundle: - |
| `Category` | `String` | B2B / B2C / BOTH Internacional, Data, Voice, VAS, SOS Category of the Bundle: - Mobile, Broadband |
| `GroupA` | `String` | Logical grouping level A |
| `GroupB` | `String` | Logical grouping level B |
| `GroupC` | `String` | Logical grouping level C |
| `GroupD` | `String` | Logical grouping level D Array Object Activation[] |
| `Zone` | `String` | Business zone where the Bundle can be purchased - IN, OM |
| `Currency` | `String` | Currency USD/LRD Array Object Pricing[] |
| `Currency` | `String` | Currency USD/LRD Amount Numeric Purchase Amount |
| `ActivationZone` | `String` | Business zone where the price applies for the Bundle: - IN, OM Fee Numeric Amount of Bundle when purchase on credit ( SOS Bundles) RepayFee Numerinc Repayment Fee of the purchased bundle on credit (SOS Bundles) The Total Cost of the Bundle is: Fee + RepayFee Array Object Allowance[] |
| `DataType` | `EnumString` | Data Type of the Value |
| `-` | `EnumString` | Type of Allowance: - |
| `SubType` | `EnumString` |  |

## Mock Responses

### GET — Add a Bundle to a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "BundleId": "sample_BundleId",
    "Bundle Identification": "sample_Bundle Identification",
    "OfferDescription": "Sample description",
    "CustomerSegment": "sample_CustomerSegment",
    "BundleZone": "sample_BundleZone",
    "Category": "sample_Category",
    "GroupA": "sample_GroupA",
    "GroupB": "sample_GroupB",
    "GroupC": "sample_GroupC",
    "GroupD": "sample_GroupD",
    "Zone": "sample_Zone",
    "Currency": "LRD",
    "ActivationZone": "sample_ActivationZone",
    "DataType": "Standard",
    "-": "sample_-",
    "SubType": "Standard"
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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### GET — Add a Bundle to a Subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/List?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
