# Event/Ticket/Available

This method retrieves all available event tickets configured in the system that should be presented to the general public. Internally it will balance the quantity of tickets with the time to the event to return a more reasonable dataset.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Retrives all available tickets |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/Available
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/Available` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Available` |

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

### GET — Retrives all available tickets

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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### GET — Retrives all available tickets

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Available?auth:user=api_user&auth:pwd=api_password"
```
