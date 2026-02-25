# Merchant/Bundle/IN

This method will allow to get information regarding the list of Bundles available to be sold my a Merchant and or App.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the Bundle Information |

## Endpoint URL

```
TIMM/v1/Merchant/Bundle/IN
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Bundle/IN` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/IN` |

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

## Mock Responses

### GET — Gets the Bundle Information

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "BundleId": "sample_BundleId",
    "Bundle Identification": "sample_Bundle Identification"
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

### GET — Gets the Bundle Information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Bundle/IN?auth:user=api_user&auth:pwd=api_password"
```
