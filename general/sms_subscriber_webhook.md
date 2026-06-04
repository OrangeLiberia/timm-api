# SMS Subscriber Webhook

This notification will call an API to use this URL to redirect a call to an internal API.

## Action Definition

| Field | Description |
|-------|-------------|
| `Verb` | POST method will be used |
| `JSON Objects Provided` | No JSON objects are provided |
| `URL` | [Partner Provided URL] |

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | MSISDN |
| `CLI` | `String` | ✅ Required | Short code that is causing the notification to be initiated |
| `Message` | `String` | ✅ Required | Message associated with Notification (SMS or USSD Menu Selected) |
| `Channel` | `String` | ✅ Required | Source of the Notification: SMS, USSD |

## Responses

### POST — SMS Subscriber Webhook

The POST request must return HTTP `200 OK` to be considered a success.

If the request is successful and the HTTP Body is not empty, then the contents of the Body is forwarded to the subscriber.

## cURL Examples

### SMS Notification

SMS with text `Subscribe` received on short code `1111` from MSISDN `231777777588`:

```bash
curl -X POST "http://[Partner URL]?msisdn=$231777777588$&cli=$1111&message=Subscribe$&channel=sms"
```

### USSD Notification

USSD menu `Unsubscribe` selected on short code `1444` from MSISDN `231777777588`:

```bash
curl -X POST "http://[Partner URL]?msisdn=$231777777588$&cli=$1444&message=Unsubscribe$&channel=ussd"
```
