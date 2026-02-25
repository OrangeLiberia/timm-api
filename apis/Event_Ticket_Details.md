# Event/Ticket/Details

This method is called to vote on a current Polls/Anwser or to get the previous casted vote

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Retrives user votes for a specific Poll |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/Details
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/Details` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Details` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `TicketNumber` | `String` | ✅ Required | Ticket Number exec_code integer |

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

### GET — Retrives user votes for a specific Poll

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

### GET — Retrives user votes for a specific Poll

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Details?auth:user=api_user&auth:pwd=api_password&param:TicketNumber=<TicketNumber>"
```
