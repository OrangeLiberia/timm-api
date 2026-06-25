# CRM/Types/KYC/GSM

This method can be called to get the available GSM KYC validation statuses.

The returned values are used as reference values for `ValidationGSM` and `RegistrationGSMTxt` fields returned by `/TIMM/v1/CRM/Subscriber/KYC/Status` and `/TIMM/v1/CRM/Subscriber`.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the GSM KYC validation statuses |

## Endpoint URL

```
TIMM/v1/CRM/Types/KYC/GSM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/GSM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/KYC/GSM` |

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
| `resultset` | `Array` | List of GSM KYC validation statuses |
| `resultset[].ID` | `String` | GSM KYC validation status ID |
| `resultset[].Name` | `String` | GSM KYC validation status name |

## Responses

### GET — Returns the GSM KYC validation statuses

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
      "ID": "10",
      "Name": "Auto-Valid"
    },
    {
      "ID": "100",
      "Name": "Valid"
    },
    {
      "ID": "101",
      "Name": "No ID"
    },
    {
      "ID": "103",
      "Name": "No Photo"
    },
    {
      "ID": "104",
      "Name": "No ID and Photo"
    },
    {
      "ID": "105",
      "Name": "No Name"
    },
    {
      "ID": "106",
      "Name": "ID not Clear"
    },
    {
      "ID": "107",
      "Name": "Photo not Clear"
    },
    {
      "ID": "108",
      "Name": "Invalid ID"
    },
    {
      "ID": "109",
      "Name": "Names does not Match"
    },
    {
      "ID": "110",
      "Name": "No Information"
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

### GET — Returns the GSM KYC validation statuses

```bash
curl -k -X GET \
  "https://192.168.19.210:11003/TIMM/v1/CRM/Types/KYC/GSM?auth:user=api_user&auth:pwd=api_password"
```
