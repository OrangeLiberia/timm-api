# Subscriber/LEC/Tokens

This method allows the agent to see their previous purchased tokens.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | List all the subscribers favorite LEC meters. |

## Endpoint URL

```
/TIMM/v1/Subscriber/LEC/Tokens
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/LEC/Tokens` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/LEC/Tokens` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the tokens. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |

## Mock Responses

### GET — List all the subscribers favorite LEC meters.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
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

### GET — List all the subscribers favorite LEC meters.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/LEC/Tokens?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
