# Subscriber/Bundle/Activate

This method activates a configured bundle for a subscriber or another recipient without charging an Orange Money wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Activate a subscriber bundle and, optionally, a bonus bundle |

## Endpoint URL

```text
/TIMM/v1/Subscriber/Bundle/Activate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://api.example.invalid/TIMM/v1/Subscriber/Bundle/Activate` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Activate` |

Replace the production example host with the configured production base URL.

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via the configured HTTP Basic Authentication mechanism. The authenticated user must have permission for this method.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

Send parameters inside the JSON `param` object. The names below follow `SubscriberActivateBundle.GetRequiredParameters`; preserve the spelling `RECIPENTMSISDN`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | Required | Subscriber phone number, validated as an Orange MSISDN. Also the activation recipient when `RECIPENTMSISDN` is omitted |
| `CURRENCY` | `EnumString` | Required | Currency used to resolve the bundle mapping. Accepted values are `USD`, `LRD`, and alias `LD`. This endpoint does not charge a currency wallet |
| `BUNDLEID` | `String` | Required | Main bundle identifier. Must resolve through the configured currency-specific bundle mapping |
| `INSPID` | `String` | Required | IN service-provider identifier used by the activation backend |
| `RECIPENTMSISDN` | `String` | Optional | Recipient phone number, validated as an Orange MSISDN. Defaults to `MSISDN` when omitted or empty, subject to request validation |
| `BUNDLEVALIDITY` | `String` | Optional | Declared validity option. The reviewed helper does not consume this top-level field; it does not establish a validity override |
| `BUNDLEALLOWANCE` | `Object` | Optional | IN allowance details. The reviewed helper reads nested `VALIDITY` and configured wallet allowance keys. Wallet identifiers and units depend on backend configuration; a flat value is not an allowance override |
| `BUNDLENOTIFICATION` | `String` | Optional | Main bundle notification setting passed to the IN backend. Defaults to `"1"` when omitted or empty |
| `BUNDLEFLAVOREDID` | `String` | Optional | Flavored bundle identifier used by the IN activation backend |
| `BONUSBUNDLEID` | `String` | Optional | Bonus bundle identifier. When provided, it must resolve through the currency-specific bundle mapping |
| `BONUSBUNDLEVALIDITY` | `String` | Optional | Declared bonus validity option. The reviewed bonus helper does not consume it |
| `BONUSBUNDLEALLOWANCE` | `String` | Optional | Declared bonus allowance option. The reviewed bonus helper does not consume it |
| `BONUSBUNDLENOTIFICATION` | `String` | Optional | Bonus notification setting passed to the IN backend. Defaults to `"1"` when omitted or empty |

## Processing Rules

- This is the activation-only counterpart of `/TIMM/v1/Subscriber/Bundle/OM/Pay`. It does not debit an Orange Money wallet or perform payment rollback.
- `MSISDN` identifies the subscriber; `RECIPENTMSISDN`, when supplied, selects the bundle recipient.
- `CURRENCY` remains required because bundle mapping is currency-specific. Both main and supplied bonus bundle mappings are resolved before main activation.
- The main bundle activates first. The optional bonus bundle is attempted after successful main activation. Backend selection follows the configured system type.
- The IN activation calls use a charge value of `"0"`. A server-generated request reference is used internally; it is not returned as an Orange Money transaction ID.
- If the main activation fails, the method returns an error. If the main succeeds but an attempted bonus activation fails, it returns success with warning and includes the bonus failure detail. The main activation is not rolled back.
- The accepted parameter list does not include `PIN`, `WALLET`, `ExternalID`, `BundleZone`, payment amount, or an Orange Money transaction reference.
- Validity and allowance controls depend on the reviewed helper behavior described above. Being declared optional does not guarantee that a field changes backend activation.

## Response Fields

> Result type: **Single Object**, when bonus details are returned

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` for success, `100` for success with warning, or an error code |
| `exec_msg` | `String` | Activation execution message |
| `resultset.BONUSBUNDLE` | `String` | Conditional. `SUCCESS` when an attempted bonus succeeds, or backend failure detail when it fails |

When no bonus result is added, the reviewed action returns only `exec_code` and `exec_msg`. It does not return payment amount, wallet balance, transaction ID, or an activation status object.

## Responses

These examples follow the reviewed action and reply builder; they are not captured live responses.

### POST — Main bundle activation

**Success Response (`exec_code: 200`):**

```json
{"exec_code": 200, "exec_msg": "Success"}
```

### POST — Main and bonus bundle activation

**Success Response:**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {"BONUSBUNDLE": "SUCCESS"}
}
```

**Success With Warning Response:**

```json
{
  "exec_code": 100,
  "exec_msg": "Success with Warning: Bonus Bundle Failure",
  "resultset": {"BONUSBUNDLE": "Example backend bonus activation failure"}
}
```

**Main Bundle Mapping Error:**

```json
{"exec_code": -1004, "exec_msg": "API Call execution failed: Bundle Not Found"}
```

**Bonus Bundle Mapping Error:**

```json
{"exec_code": -1004, "exec_msg": "API Call execution failed: Bonus Bundle Not Found"}
```

A bonus mapping error occurs before main activation; it differs from a bonus activation warning after main success.

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Activation succeeded |
| `100` | Main activation succeeded; attempted bonus activation failed |
| `-1003` | Required request parameter is missing |
| `-1004` | Activation failed, or the main/bonus bundle mapping was not found |
| `-1015` | Invalid request parameter in the reviewed action framework |
| `-1016` | Missing configuration in the reviewed action framework |
| `-2000` | Backend execution error with returned backend detail |

Inspect `exec_code` independently of HTTP status. Backend error text can vary with the failure.

## cURL Examples

### POST — Activate a bundle for the subscriber

```bash
curl -X POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Activate' \
  -H 'Content-Type: application/json' \
  -d '{
  "auth": {"user": "api_user", "pwd": "api_password"},
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "LRD",
    "BUNDLEID": "<configured_bundle_id>",
    "INSPID": "<configured_service_provider_id>"
  }
}'
```

### POST — Activate main and bonus bundles for another recipient

```bash
curl -X POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Activate' \
  -H 'Content-Type: application/json' \
  -d '{
  "auth": {"user": "api_user", "pwd": "api_password"},
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "USD",
    "BUNDLEID": "<configured_bundle_id>",
    "INSPID": "<configured_service_provider_id>",
    "RECIPENTMSISDN": "0777777599",
    "BUNDLENOTIFICATION": "1",
    "BONUSBUNDLEID": "<configured_bonus_bundle_id>",
    "BONUSBUNDLENOTIFICATION": "1"
  }
}'
```
