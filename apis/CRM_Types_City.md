# CRM/Types/City

This method can be called to get the cities.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the cities |

## Endpoint URL

```
TIMM/v1/CRM/Types/City
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Internal | `http://192.168.19.12:11000/TIMM/v1/CRM/Types/City` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Array of Objects**

| Field | Type | Description |
|-------|------|-------------|
| `CodCity` | `String` | City identification code |
| `DesCity` | `String` | City name / description |

## Mock Responses

### GET — Returns the cities

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {"CodCity": "1", "DesCity": "Undefined"},
    {"CodCity": "2", "DesCity": "Arthington"},
    {"CodCity": "3", "DesCity": "Barclayville"},
    {"CodCity": "4", "DesCity": "Bensonville"},
    {"CodCity": "5", "DesCity": "Bopolu"},
    {"CodCity": "6", "DesCity": "Buchanan"},
    {"CodCity": "7", "DesCity": "Buutuo"},
    {"CodCity": "8", "DesCity": "Careysburg"},
    {"CodCity": "9", "DesCity": "Balandougou"},
    {"CodCity": "10", "DesCity": "Clay-Ashland"},
    {"CodCity": "11", "DesCity": "Edina"},
    {"CodCity": "12", "DesCity": "Fish Town"},
    {"CodCity": "13", "DesCity": "Ganta"},
    {"CodCity": "14", "DesCity": "Gbarnga"},
    {"CodCity": "15", "DesCity": "Greenville"},
    {"CodCity": "16", "DesCity": "Harbel"},
    {"CodCity": "17", "DesCity": "Harper"},
    {"CodCity": "18", "DesCity": "Kakata"},
    {"CodCity": "19", "DesCity": "Monrovia"},
    {"CodCity": "20", "DesCity": "Marshall"},
    {"CodCity": "21", "DesCity": "Paynesville"},
    {"CodCity": "22", "DesCity": "Pleebo"},
    {"CodCity": "23", "DesCity": "River Cess"},
    {"CodCity": "24", "DesCity": "Robertsport"},
    {"CodCity": "25", "DesCity": "Sacleipea"},
    {"CodCity": "26", "DesCity": "Sanniquellie"},
    {"CodCity": "27", "DesCity": "Tubmanburg"},
    {"CodCity": "28", "DesCity": "Tuzon"},
    {"CodCity": "29", "DesCity": "Virginia"},
    {"CodCity": "30", "DesCity": "Voinjama"},
    {"CodCity": "31", "DesCity": "Yekepa"},
    {"CodCity": "32", "DesCity": "Zorzor"},
    {"CodCity": "33", "DesCity": "Zwedru"}
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
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Returns the cities

```bash
curl -k -X GET \
  "http://192.168.19.12:11000/TIMM/v1/CRM/Types/City?auth:user=api_user&auth:pwd=api_password"
```
