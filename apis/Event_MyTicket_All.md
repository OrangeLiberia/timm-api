# Event/MyTicket/All

This method is called to vote on a current Polls/Anwser or to get the previous casted vote

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns all the tickets for a specific subscriber |

## Endpoint URL

```
/TIMM/v1/Event/MyTicket/All
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/MyTicket/All` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/MyTicket/All` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. exec_code integer |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `EventID` | `Integer` |  |
| `Unique Event Ticket ID` | `String` | Event Name |
| `EventUniqueID` | `Integer` |  |
| `Unique Name for the Event` | `String` | Ticket Type EvntDate Date Event Date, Format: YYYY-MM-DD EvnTime Time Event Time, Format: HH:MM:SS |
| `Location` | `String` | Location of the Event |
| `MSISDN` | `String` | Phone number of the Subscriber owner of the ticket(s) |
| `Status` | `Integer` | Status of the Ticket 10 – Available 100 – Used |
| `StatusTxt` | `String` | Status of the Ticket in Textual format - |
| `TicketNumber` | `String` | Available / Used Ticket Number |

## Mock Responses

### GET — Returns all the tickets for a specific subscriber

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
    "Location": "sample_Location",
    "MSISDN": "0777777588",
    "Status": "Active",
    "StatusTxt": "Active",
    "TicketNumber": "sample_TicketNumber"
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

### GET — Returns all the tickets for a specific subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/MyTicket/All?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
