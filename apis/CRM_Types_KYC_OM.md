# CRM/Types/KYC/OM

This method can be called to get the available Orange Money KYC validation statuses.

The returned values are used as reference values for `ValidationOM` and `RegistrationOMTxt` fields returned by `/TIMM/v1/CRM/Subscriber/KYC/Status` and `/TIMM/v1/CRM/Subscriber`.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the Orange Money KYC validation statuses |

## Endpoint URL

```
TIMM/v1/CRM/Types/KYC/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/KYC/OM` |

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
| `resultset` | `Array` | List of Orange Money KYC validation statuses |
| `resultset[].ID` | `String` | Orange Money KYC validation status ID |
| `resultset[].Name` | `String` | Orange Money KYC validation status name |

## Responses

### GET — Returns the Orange Money KYC validation statuses

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
      "ID": "20",
      "Name": "Auto-Valid"
    },
    {
      "ID": "200",
      "Name": "Valid"
    },
    {
      "ID": "201",
      "Name": "No ID"
    },
    {
      "ID": "202",
      "Name": "No Photo"
    },
    {
      "ID": "203",
      "Name": "Unreadable ID"
    },
    {
      "ID": "204",
      "Name": "Invalid ID"
    },
    {
      "ID": "205",
      "Name": "Conflict of identity (Form/ID)"
    },
    {
      "ID": "206",
      "Name": "No Contract"
    },
    {
      "ID": "207",
      "Name": "Unreadable Contract"
    },
    {
      "ID": "208",
      "Name": "Unsigned Contract"
    },
    {
      "ID": "209",
      "Name": "Contract information does not match"
    },
    {
      "ID": "210",
      "Name": "No Orange Money"
    },
    {
      "ID": "220",
      "Name": "Self Registration"
    },
    {
      "ID": "221",
      "Name": "Pending Self Registration Validation"
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

### GET — Returns the Orange Money KYC validation statuses

```bash
curl -k -X GET \
  "https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/OM?auth:user=api_user&auth:pwd=api_password"
```
