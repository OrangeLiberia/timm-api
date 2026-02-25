# CRM/Types/Country

This method can be called to get the countries.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the country |

## Endpoint URL

```
TIMM/v1/CRM/Types/Country
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Types/Country` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/Country` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `CountryID` | `String` | Country ID |
| `CCode` | `String` | Country Code |
| `ISO3166` | `String` |  |
| `ISO 3166 alpha 3 designation` | `String` | Country Name |

## Mock Responses

### GET — Returns the country

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "CountryID": 1,
    "CCode": "CODE001",
    "ISO3166": "sample_ISO3166",
    "ISO 3166 alpha 3 designation": "sample_ISO 3166 alpha 3 designation"
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

### GET — Returns the country

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/Country?auth:user=api_user&auth:pwd=api_password"
```
