/// Union of Tables for Top 10 last Sign-ins from an OAuth App
union isfuzzy=true
    SigninLogs,
    AADNonInteractiveUserSignInLogs,
    AADServicePrincipalSignInLogs,
    AADManagedIdentitySignInLogs
| where TimeGenerated >= ago(90d)
| where AppId == "4d125b49-cada-4882-87e9-e9dc0223fc08"
| top 10 by TimeGenerated
| project TimeGenerated, UserDisplayName, UserPrincipalName,ServicePrincipalName, AppDisplayName, ResultType
