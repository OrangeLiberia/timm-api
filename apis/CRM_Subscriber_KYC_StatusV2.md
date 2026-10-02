# KYC Status

Updates the KYC validation status for a subscriber/agent transaction in TIMM.

## Endpoint

```text
POST http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/Status
```

## Authentication

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `auth:user` | String | Yes | TIMM API authentication username |
| `auth:pwd` | String | Yes | TIMM API authentication password |

> **Security:** Do not commit the actual `auth:pwd` value to GitHub. Use your environment/configuration secret instead.

## Parameters

| Parameter | Type | Required | Description |
|---|---|---:|---|
| `ID` | Integer | Yes | KYC record/transaction ID |
| `TimmUserID` | Integer | Yes | TIMM user ID performing the operation |
| `MSISDN` | String | Yes | Subscriber mobile number |
| `AgentMSISDN` | String | Yes | Agent mobile number |
| `ValidationGSM` | Integer | Yes | GSM validation status |
| `ValidationOM` | Integer | Yes | Orange Money validation status |
| `OMLevel` | Integer | Yes | Orange Money validation level |

## cURL

```bash
curl -k -X POST \\
  "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/Status?auth:user=KYCMobileValidation&auth:pwd=<PASSWORD>&param:ID=33333&param:TimmUserID=18105&param:MSISDN=0777777588&param:AgentMSISDN=0777000000&param:ValidationGSM=100&param:ValidationOM=100&param:OMLevel=1"
```

### Example Request

```text
param:ID=33333
param:TimmUserID=18105
param:MSISDN=0777777588
param:AgentMSISDN=0777000000
param:ValidationGSM=100
param:ValidationOM=100
param:OMLevel=1
```

## Request Parameters

### ID

Identifies the KYC record that is being updated.

```text
param:ID=33333
```

### TimmUserID

Identifies the TIMM user performing the KYC status update.

```text
param:TimmUserID=18105
```

### MSISDN

The subscriber mobile number associated with the KYC record.

```text
param:MSISDN=0777777588
```

### AgentMSISDN

The mobile number of the agent performing or submitting the validation.

```text
param:AgentMSISDN=0777000000
```

### ValidationGSM

Defines the GSM validation status.

```text
param:ValidationGSM=100
```

### ValidationOM

Defines the Orange Money validation status.

```text
param:ValidationOM=100
```

### OMLevel

Defines the Orange Money validation level.

```text
param:OMLevel=1
```

## Complete Request Example

```text
POST /TIMM/v1/CRM/Subscriber/KYC/Status

auth:user=KYCMobileValidation
auth:pwd=<PASSWORD>

param:ID=33333
param:TimmUserID=18105
param:MSISDN=0777777588
param:AgentMSISDN=0777000000
param:ValidationGSM=100
param:ValidationOM=100
param:OMLevel=1
```

## Response

The exact response depends on the TIMM API implementation and the result of the KYC status update.

### Example

```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

> The response above is an example format. Replace it with the actual response returned by the API if additional fields are returned.

## Response Fields

| Field | Type | Description |
|---|---|---|
| `exec_code` | Integer | Execution result code |
| `exec_msg` | String | Execution result message |

## HTTP Method

```text
POST
```

## SSL / Certificate Validation

The example cURL uses:

```text
-k
```

This disables TLS certificate verification in cURL.

For production environments, certificate validation should be enabled whenever a valid trusted certificate is available.

## Notes

- `ID` should correspond to an existing KYC record.
- `TimmUserID` identifies the TIMM user executing the operation.
- `MSISDN` identifies the subscriber.
- `AgentMSISDN` identifies the agent.
- `ValidationGSM` contains the GSM validation status.
- `ValidationOM` contains the Orange Money validation status.
- `OMLevel` contains the Orange Money validation level.
- Authentication credentials should not be stored directly in source code or committed to GitHub.

## Endpoint Summary

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/TIMM/v1/CRM/Subscriber/KYC/Status` | Updates the KYC validation status |
