# CRM/Types/Language

This method can be called to get the available languages.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the languages |

## Endpoint URL

```
TIMM/v1/CRM/Types/Language
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.210:11000/TIMM/v1/CRM/Types/Language` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Types/Language` |

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
| `resultset` | `Array` | List of languages |
| `resultset[].Default` | `String` | `1` if the language is the default language. `0` if it is not the default language |
| `resultset[].Designation` | `String` | Language designation |
| `resultset[].LanguageCode` | `String` | Language code |
| `resultset[].LanguageID` | `String` | Language ID |

## Responses

### GET — Returns the languages

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "Default": "0",
      "Designation": "Portuguese",
      "LanguageCode": "PT",
      "LanguageID": "1"
    },
    {
      "Default": "0",
      "Designation": "French",
      "LanguageCode": "FR",
      "LanguageID": "3"
    },
    {
      "Default": "1",
      "Designation": "English",
      "LanguageCode": "EN",
      "LanguageID": "11"
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

### GET — Returns the languages

Create `auth.json`:

```json
{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  }
}
```

Call the API:

```bash
curl -k -d @auth.json -X GET \
  "http://192.168.19.210:11000/TIMM/v1/CRM/Types/Language"
```
