# Subscriber/Billers/OM/Debit

This method will allow a partner to debit a subscriber’s wallet. Funds are deducted without the need of the subscriber’s PIN or confirmation. Amount it debited from the subscriber wallet then the same funds are moved back to the partner wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a loan partner to initiate funds collection from Subscriber without PIN |

## Endpoint URL

```
TIMM/v1/Subscriber/Billers/OM/Debit
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Billers/OM/Debit` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Billers/OM/Debit` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `DEBITAUTHTOKEN` | `String` | ✅ Required | Authorization Token for Debit |
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `CURRENCY` | `String` | ✅ Required | Identification of Wallet being charged: |
| `AMOUNT` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `EXTERNALID` | `String` | ✅ Required | Reference’s to unique id of the caller transaction WALLET |
| `Enum` | `String` | ⬜ Optional | Defines in what Wallet the action should take place: Main, Commission or Loyalty Default: Main USERTYPE |
| `Enum` | `String` | ⬜ Optional | Defines in what user type the action should take place: Subscriber, Channel, Operator or Other Default: Subscriber |
| `RecipentMSISDN` | `String` | ⬜ Optional | Recipient Phone Number on whose account the equal amount will be transferred to. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx RecipentWallet |
| `Enum` | `String` | ⬜ Optional | Defines in what Wallet the action should take place: Main, Commission or Loyalty Default: Main |
| `RecipentSubWallet` | `String` | ⬜ Optional | Each identifier of the Sub Wallet belonging to the Recipient that should be used for this transaction. Sub Wallet list is configured for each user and mapping. (WalletZ1, WalletY2,, WalletX3, … ) |
| `RecipentAmount` | `String` | ⬜ Optional | Amount to be charged to be transferred to the RecipentMSISDN. If not provided, Amount will be used. BlockSMS |
| `Enum` | `String` | ⬜ Optional | PAYEE – Do not send notification to Payee [DEFAULT] - USD, LD PAYER – Do not send SMS notification to Payer BOTH – Do not send SMS |
| `Comment` | `String` | ⬜ Optional | Comment for the action being performed |

## Mock Responses

### POST — Allows for a loan partner to initiate funds collection from Subscriber without PIN

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

### POST — Allows for a loan partner to initiate funds collection from Subscriber without PIN

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Billers/OM/Debit" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "DEBITAUTHTOKEN": "<DEBITAUTHTOKEN>",
    "MSISDN": "0777777588",
    "CURRENCY": "LRD",
    "AMOUNT": 100.0,
    "EXTERNALID": "ID-001234",
    "Enum": "<Enum>",
    "RecipentMSISDN": "0777777588",
    "RecipentSubWallet": "<RecipentSubWallet>",
    "RecipentAmount": 100.0,
    "Comment": "<Comment>"
  }
}'
```
