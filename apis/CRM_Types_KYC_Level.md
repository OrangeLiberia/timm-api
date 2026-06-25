# CRM/Types/KYC/Level

This method can be called to get the available KYC levels.

The returned values are used as reference values for `/TIMM/v1/CRM/Subscriber/KYC/Status` and the KYC level fields returned by `/TIMM/v1/CRM/Subscriber`.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the KYC levels |

## Endpoint URL

```
TIMM/v1/CRM/Types/KYC/Level
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/Level` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/KYC/Level` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Array` | List of KYC levels |
| `resultset[].ID` | `String` | KYC level ID |
| `resultset[].Name` | `String` | KYC level name |

## Responses

### GET — Returns the KYC levels

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "ID": "-1",
      "Name": "N/A"
    },
    {
      "ID": "1",
      "Name": "Level 1"
    },
    {
      "ID": "2",
      "Name": "Level 2"
    },
    {
      "ID": "3",
      "Name": "Level 3"
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
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Returns the KYC levels

```bash
curl -k -X GET \
  "https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/Level?auth:user=api_user&auth:pwd=api_password"
```
