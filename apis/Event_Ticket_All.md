# Event/Ticket/All

This method retrieves all events tickets configured in the system, including the previous events vote

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Retrives all events tickets |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/All
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/All` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/All` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `EventID` | `Integer` |  |
| `Unique Event Ticket ID` | `String` | Event Name |
| `EventUniqueID` | `Integer` |  |
| `Unique Name for the Event` | `String` | Ticket Type EvntDate Date Event Date, Format: YYYY-MM-DD EvnTime Time Event Time, Format: HH:MM:SS |
| `GroupA` | `String` | Optional Level 1 Grouping for the Event |
| `GroupB` | `String` | Optional Level 2 Grouping for the Event |
| `GroupC` | `String` | Optional Level 3 Grouping for the Event |
| `Location` | `String` | Location of the Event |

## Mock Responses

### GET — Retrives all events tickets

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "EventID": 1,
    "Unique Event Ticket ID": "sample_Unique Event Ticket ID",
    "EventUniqueID": 1,
    "Unique Name for the Event": "sample_Unique Name for the Event",
    "GroupA": "sample_GroupA",
    "GroupB": "sample_GroupB",
    "GroupC": "sample_GroupC",
    "Location": "sample_Location"
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

### GET — Retrives all events tickets

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/All?auth:user=api_user&auth:pwd=api_password"
```
