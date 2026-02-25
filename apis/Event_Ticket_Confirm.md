# Event/Ticket/Confirm

This method is called to use (aka burn) a specific quantity of tickets for a subscriber. Normally called when the subscriber is performing the entry into a event.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Confirms the usage of set of tickets |
| `GET` | Returns the available tickets for a specific subscriber |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/Confirm
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/Confirm` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Confirm` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `TicketNumber` | `String` | ✅ Required | Ticket Number |
| `Qty` | `String` | ⬜ Optional | Quantity of Tickets to use. If not specified the total quantity of entries associated with that ticket will be used/burned |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `TicketCount` | `Integer` | Quantity of tickets used/burned Event/MyTicket This method returns current valid/available tickets for a subscriber Action definition: GET Returns the available tickets for a specific subscriber JSON Objects Required auth (Authentication) param (defined on section request bellow) URL /TIMM/v1/Event/MyTicket GET Request definition: JSON Object auth JSON Object param |
| `MSISDN` | `String` | Mandatory Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. exec_code integer Output >= 0 Positive values indicate that method completed with success but encountered some warnings IDs. GET Reply definition: -200: Not Found -210: Invalid MSISDN Other negative values: Represent unexpected errors. |
| `exec_msg` | `String` | Output Textual description of the error or success |

## Mock Responses

### POST — Confirms the usage of set of tickets

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "TicketCount": 1,
    "MSISDN": "0777777588",
    "exec_msg": "sample_exec_msg"
  }
}
```

### GET — Returns the available tickets for a specific subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "TicketCount": 1,
    "MSISDN": "0777777588",
    "exec_msg": "sample_exec_msg"
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

### POST — Confirms the usage of set of tickets

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Confirm" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "TicketNumber": "<TicketNumber>",
    "Qty": "<Qty>"
  }
}'
```

### GET — Returns the available tickets for a specific subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/Confirm?auth:user=api_user&auth:pwd=api_password&param:TicketNumber=<TicketNumber>&param:Qty=<Qty>"
```
