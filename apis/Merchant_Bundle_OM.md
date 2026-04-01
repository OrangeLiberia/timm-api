# Merchant/Bundle/OM

This method will allow to get information regarding the list of Bundles available to be sold my a Merchant and or App.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the Bundle Information |

## Endpoint URL

```
TIMM/v1/Merchant/Bundle/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Bundle/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `BundleId` | `String` |  |
| `Bundle Identification` | `String` | Bundle Description |
| `OfferDescription` | `String` | Description of the Offer |
| `CustomerSegment` | `String` | Customer Segment: - |
| `BundleZone` | `String` | Logical zone of the Bundle: - |
| `Category` | `String` | B2B / B2C / BOTH Internatiuonal, Data, Voice, VAS, SOS Category of the Bundle: - Mobile, Broadband |
| `GroupA` | `String` | Logical grouping level A |
| `GroupB` | `String` | Logical grouping level B |
| `GroupC` | `String` | Logical grouping level C |
| `GroupD` | `String` | Logical grouping level D |

## Mock Responses

### GET — Gets the Bundle Information

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
    "GroupD": "sample_GroupD"
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

### GET — Gets the Bundle Information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/OM?auth:user=api_user&auth:pwd=api_password"
```
