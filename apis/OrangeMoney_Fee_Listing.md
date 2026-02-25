# OrangeMoney/Fee/Listing

This method returns the fee list item list of the available fees with their description and range information.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the information regarding Payment details |

## Endpoint URL

```
/TIMM/v1/OM/Fee/Item/Listing
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Fee/Item/Listing` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Item/Listing` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Gets the information regarding Payment details

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "id": "1",
      "name": "Sample Item",
      "description": "Sample description"
    }
  ]
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

### GET — Gets the information regarding Payment details

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Fee/Item/Listing?auth:user=api_user&auth:pwd=api_password"
```
