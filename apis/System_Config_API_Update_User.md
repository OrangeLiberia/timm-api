# System/Config/API/Update/User

Updates only supplied fields for the user identified by `param.username` in the current environment. Username is a lookup value and cannot be changed. Credentials are not exposed as an update parameter.

**Endpoint:** `POST /TIMM/v1/System/Config/API/Update/User`. This follows the supplied action-style route convention. Configuration SQL, tests, and request examples are supplied; no live deployment or HTTP validation has been performed.

## Action definition

| Setting | Value |
|---|---|
| HTTP verb | `POST` |
| Full route | `/TIMM/v1/System/Config/API/Update/User` |
| Action database | `TIMM_API` |
| Procedure | `Config.UpdateUser` |
| Required caller parameter | `username` |
| Optional parameters | All other procedure parameters, explicitly listed in `ActionAttributes.json` |
| Return mapping | `ReturnAttributes.json` |
| Authentication | `api-auth` and `timm-auth`, matching the supplied permission route script |

Do not copy creation-time `Override`, `Session`, or `Default` values into this action: they could inject fields the caller omitted. In particular, do not inject the authenticated operator's username into the target user's `username` parameter.

## Request parameters

All parameters belong inside the JSON `param` object. The `auth` object identifies the caller; `param.username` identifies the user to update.

| Parameter | SQL type | Required | Meaning |
|---|---|---|---|
| `username` | varchar(128) | Yes | Existing username in the environment selected by the procedure |
| `domain` | varchar(64) | No | User domain; omission preserves the existing domain |
| `Name` | varchar(64) | No | Display name |
| `Description` | varchar(200) | No | Description |
| `UserType` | int | No | Must exist in `dbo.tcomAPIUserType` |
| `ExecAttributes` | xml | No | Nonempty JSON string array of resource keys, or an explicit XML string as described below |
| `Creator` | varchar(128) | No | Stored creator value; editable because it is part of the creation input contract |
| `InternalBusinessOwner` | varchar(128) | No | Internal owner name |
| `InternalBusinessOwnerPhone` | varchar(32) | No | Internal owner phone |
| `InternalBusinessOwnerEmail` | varchar(254) | No | Internal owner email |
| `PartnerName` | varchar(128) | No | Partner name |
| `PartnerPhone` | varchar(32) | No | Partner phone |
| `PartnerEmail` | varchar(254) | No | Partner email |

Omitted optional parameters reach SQL defaults and preserve existing values. Explicit SQL `NULL` also preserves values. The current server's JSON flattening skips JSON `null`; verify that behavior on the deployed build. Prefer omission in portable requests. Empty or whitespace-only text fields are rejected rather than used to clear mandatory creation data.

The current procedure selects `TEST` only when `@@SERVERNAME` is `eris-test\ERISTST`; all other server names select `PROD`, matching the supplied CreateUser procedure. `domain` does not select the environment.

## Request examples

Change one field:

```json
{"param":{"username":"test-update-user","Name":"Updated display name"}}
```

Change contact details:

```json
{"param":{"username":"test-update-user","PartnerName":"Example partner","PartnerEmail":"partner@example.invalid"}}
```

Replace the complete resource selection:

```json
{"param":{"username":"test-update-user","ExecAttributes":["TEST-RESOURCE-A","TEST-RESOURCE-B"]}}
```

Clear every assigned resource:

```json
{"param":{"username":"test-update-user","ExecAttributes":"<ExecAttributes />"}}
```

Do not use `[]` to clear resources. In the reviewed request binder, an empty array has no value entries and can behave as omission. Nonempty arrays are converted into `/PARAM/@EXECATTRIBUTES` XML. An explicit XML string is passed directly to the XML procedure parameter.

## Processing rules

- A username-only call succeeds without changing stored values; it still executes an SQL update and can fire database triggers.
- The procedure never updates `UserName`, `UserID`, `CreatedDate`, or `APIUsersPasswords`.
- `credential` is not a procedure parameter. The current binder ignores request fields that do not match procedure parameters; do not send it as part of normal requests.
- Omitted `ExecAttributes` preserves both the resource selection and existing `ExecutionAttributes`.
- Supplied resources replace the entire selection, rather than adding to it. Resources already assigned to this user are retained; free, unassigned resources can be acquired. Resources belonging to another user cannot be taken.
- Removed resources are released. The selected resource `Override` properties are merged using the creation procedure's format.
- Empty, duplicate, overlength, unavailable, conflicting, or oversized resource selections fail. All changes in that call roll back.
- Updating contact information requires exactly one existing `APIUsersInformation` row. The procedure does not create a missing information row.

## Response fields

| Field | Meaning |
|---|---|
| `exec_code` | `200` on success; negative on failure |
| `exec_msg` | Status description |
| `resultset.User.ID` | Internal API user ID |
| `resultset.User.UserID` | Existing logical user ID |
| `resultset.User.Domain` | Domain after the update |
| `resultset.User.Username` | Unchanged username |

Expected success shape, following the existing Create/User serialization; not yet observed on the new route:

```json
{"exec_code":200,"exec_msg":"Success","resultset":{"User":{"ID":"123","UserID":"456","Domain":"api-auth","Username":"test-update-user"}}}
```

On failure, check `exec_code` and `exec_msg`. The procedure returns two columns for some failures and a third, null `User` column for others; do not require `resultset.User` to be present on every failure.

## Error codes

| Code | Meaning |
|---|---|
| `-1003` | Required username absent at the API binding layer |
| `-2100` | Username missing/blank or supplied text field blank |
| `-2101` | Supplied UserType does not exist |
| `-2102` | Resource input invalid, blank, or longer than 32 bytes |
| `-2103` | Duplicate resource key |
| `-2104` | Requested resource unavailable |
| `-2106` | Resource Override contains a non-string value |
| `-2107` | Selected resources contain conflicting Override attributes |
| `-2108` | Combined ExecutionAttributes exceeds 4096 bytes |
| `-2110` | User absent in the current environment |
| `-2111` | Contact update did not match exactly one information row |
| `-2199` | SQL failure; the response includes the SQL error number |

## Tests

The deployment scripts, runner, standalone requests, and detailed instructions are in [sql/update-user-api](../sql/update-user-api/README.md). Run the PowerShell examples from that package directory.

`Test-UpdateUser.ps1` accepts the full endpoint URI; its method defaults to POST. Supply authentication through `Get-Credential`; the runner sends the existing TIMM JSON authentication object and does not write credentials or request bodies to disk.

```powershell
$credential = Get-Credential
.\Test-UpdateUser.ps1 -EndpointUri 'https://api-dev.example.invalid/TIMM/v1/System/Config/API/Update/User' `
    -ApiCredential $credential -TargetUsername 'test-update-user' `
    -MissingUsername 'test-user-confirmed-absent' -UnavailableResourceKey 'TEST-KEY-CONFIRMED-ABSENT'
```

Use an existing dedicated test user, a username verified absent, and a resource key verified absent or owned by another user. The username-only case executes SQL and is not a read-only endpoint call. With these fixtures, the default cases should not change stored values.

Add `-RunWrites` to test a name change and an ignored credential field. Add `-ReplacementResourceKeys 'TEST-RESOURCE-A','TEST-RESOURCE-B'` to test replacement and retention of owned resources. Add `-ClearResources` to test clearing. These HTTP write tests commit and leave the test user changed; use only a disposable test user and resources. The runner stops the overall run with an error if any expected response fails.

Run `Test-UpdateUser.Database.sql` separately after replacing its test username. It verifies preservation of omitted fields, username and credential rows, SQL NULL behavior, resource omission, and resource clearing, then rolls back its changes. Credential values remain inside SQL variables and are never output. This success-path test requires a valid information row. It does not prove HTTP binding, concurrent claim behavior, or the failure paths.

Additional integration cases require prepared fixtures: nonexistent UserType (`-2101`), missing information row (`-2111`), conflicting resource Overrides (`-2107`), non-string Overrides (`-2106`), and combined output longer than 4096 bytes (`-2108`). Confirm before/after database state for each failed request and use two simultaneous callers to verify exclusive resource assignment. Do not treat response-code checks alone as rollback proof.

## Deployment order

1. Run `01-DiscoverRoute.sql` on the target configuration database and inspect the schema and loader output. The deployment script follows the supplied route pattern; target loader definitions remain unverified locally.
2. Deploy the existing `Config.UpdateUser.sql` procedure.
3. Run `Config.ConfigureUpdateUserRoute.sql` with its default `@ApplyChanges = 0`. Inspect the owner, authentication, parameter metadata, route list, and administrator permission. Set `@ApplyChanges = 1` and rerun to persist.
4. The script grants the new method to `WSO2Config` in the current environment, matching the supplied script. Change `@PermissionAdminUsername` before deployment if needed. Existing unrelated permissions remain unchanged.
5. Reload configuration using the supported deployed mechanism. This checkout documents `POST /TIMM/System/ReloadConfiguration` from the server's IPv4 loopback interface; verify that the deployed build includes it. Otherwise follow the established reinitialization procedure.
6. Run the database and HTTP tests against the test environment before production use.

## cURL examples and fixtures

Use your target environment's base URL in place of the reserved example host. The following command prompts for the caller's password:

```bash
curl --request POST --user "<caller-username>" \
  "https://api-dev.example.invalid/TIMM/v1/System/Config/API/Update/User" \
  --header "Content-Type: application/json" \
  --data-binary @requests/name-only.json
```

The package contains 14 separate JSON request bodies plus expected codes in `test-cases.json`. In the documentation repository, the corresponding templates are named `curl-tests/templates/system-config-api-update-user-*.json.tpl` and `*.curl-config.tpl`. Generate them with the existing payload builder, replace the example host and fixture values, then run:

```bash
curl --config curl-tests/generated/system-config-api-update-user-name-only.curl-config
```

These examples use Basic Authentication, already documented by the existing Create/User page. The PowerShell runner uses the existing JSON `auth` object instead. No example contains live authentication credentials.