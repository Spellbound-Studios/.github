# Security

## Supported versions

Security fixes are made on this repository's `main` branch, the branch every repository of the organisation calls the shared workflows from.

## Reporting a vulnerability

Report a vulnerability in the organisation settings repository privately, through GitHub's private vulnerability reporting on this repository: open the Security tab and choose "Report a vulnerability". Only the studio's maintainers can read the report. Never report a vulnerability in a public issue, a pull request or a public chat, because that tells everyone before a fix exists.

Say which version or branch you found it on, the Unity version and the operating system you used, what someone could do with the vulnerability, and the steps that show it, with a small project if one helps. A suggested fix is welcome but not needed.

## What happens next

The studio acknowledges your report within 7 days and gives you a fix or a decision within 90 days. A fix lands on `main` through a pull request, and every repository that calls the shared workflows picks it up on its next run.
