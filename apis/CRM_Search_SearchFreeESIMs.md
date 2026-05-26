# CRM/Search/SearchFreeESIMs

This method can be called to search for available eSIMS.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the available eSIMs |

## Endpoint URL

```
TIMM/v1/CRM/Search/SearchFreeESIMs
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Search/SearchFreeESIMs` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/SearchFreeESIMs` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Token` | `String` | ⬜ Optional | Returned by the method Authenticate/API/Token |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Textual description of the error |
| `resultset` | `Array` | List of available eSIMs |
| `resultset[].ServiceID` | `Number` | Unique Service ID |
| `resultset[].ICCID` | `String` | Unique eSIM Card number of 19 or 20 digits |
| `resultset[].PhoneNumber` | `String` | Phone number |

## Responses

### GET — Returns the available eSIMs

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "ServiceID": 1,
      "ICCID": "892310702000045415",
      "PhoneNumber": "231777777777"
    },
    {
      "ServiceID": 2,
      "ICCID": "892310702000045416",
      "PhoneNumber": "231777777778"
    }
  ]
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": "eSIMs Not Found"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1000` | System Exception / Body Parse Failed |
| `-1001` | API does not exist |
| `-1002` | Authorization failed |
| `-1003` | API Call is missing a parameter |
| `-1004` | eSIMs Not Found |
| `-1005` | Internal API error |

## cURL Examples

### GET — Returns the available eSIMs

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/SearchFreeESIMs?auth:user=api_user&auth:pwd=api_password"
```
