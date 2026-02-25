# Event/Ticket/OM/Pay

This method is called to buy a specific quantity of tickets for a subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows the purchasing of a Ticket with Orange Money |

## Endpoint URL

```
/TIMM/v1/Event/Ticket/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Ticket/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `PIN` | `String` | ✅ Required | Subscriber PIN |
| `EventID` | `String` | ✅ Required | Unique Event Ticket ID |
| `Currency` | `String` | ✅ Required | Currency: - Qty |
| `USD, LD` | `Integer` | ✅ Required | Quantity of Tickets exec_code integer |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `OMTrxID` | `String` | Orange Money Transaction ID |
| `TicketNumber` | `String` | Ticket Number |
| `ActionID` | `String` | Internal ID |
| `TotalAmount` | `String` | Total Amount |

## Mock Responses

### POST — Allows the purchasing of a Ticket with Orange Money

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "OMTrxID": "sample_OMTrxID",
    "TicketNumber": "sample_TicketNumber",
    "ActionID": "ACT-20241107-001234",
    "TotalAmount": 100.0
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

### POST — Allows the purchasing of a Ticket with Orange Money

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Ticket/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PIN": "<PIN>",
    "EventID": "ID-001234",
    "Currency": "LRD",
    "USD, LD": 1
  }
}'
```
