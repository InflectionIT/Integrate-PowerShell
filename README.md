# PowerShell-Integrate

> Sample PowerShell scripts to invoke Integrate rules

This repository contains examples of invoking Integrate rules via PowerShell

**NOTE:** Due to the fact that Integrate uses a self-signed certificate, these scripts only work with PowerShell 6 and higher

---

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Using](#using)
- [FAQ](#faq)
- [Support](#support)
- [License](#license)

---

## Overview

Integrate provides a "RESTful" API that allows external systems to interact with Integrate, including executing rules, checking on rule execution status, and getting rule outputs. This repository includes a sample Integrate rule and two sample scripts demonstrate how to invoke this functionality via PowerShell

---

## Installation

1. Download and unzip the files from the repository
2. Import the rule template into Integrate
3. Edit the `config.json` file to use your Integrate servername and a valid Authentication Token
4. Edit `InvokeIntegrationMenu.ps1`. Update line 1 to include the correct rule ID for the imported rule
5. Edit `InvokeIntegrationParams.ps1`. Update line 3 to include the correct rule ID for the imported rule

---

## Using

#### InvokeIntegrateMenu.ps1

This script prompts users to enter values associated with the rule.

```javascript
//From a command line, Windows Terminal, or PowerShell ISE
pwsh InvokeIntegrateMenu.ps1
```

#### InvokeIntegateParams.ps1

This script allows the user to pass in rule inputs as parameters to the script

```javascript
//From a command line, Windows Terminal, or PowerShell ISE
pwsh InvokeIntegrateParams.ps1 -firstName "John" -lastName "Doe" -email "john.doe@test.com"
```

---

## FAQ

- **Where do I get more information about RESTful API development?**
  - You can find Intapp's [RESTful API Development Guide](https://support.intapp.com/s/contentdocument/0692J0000063OL8QAM) on the Intapp Customer Community
- **How do I get an Authentication Token?**
  1. Log in to the Integrate console as an administrator user.
  2. Navigate to the Users screen.
  3. Right-click any user except the admin user and select the `Manage Auth Tokens` menu item.
     **Note:** Authentication tokens cannot be generated for the admin user.
  4. Click the `Generate New Token` button. A new token will be generated.
  5. Select the newly generated token and right-click it.
  6. In the menu that appears, select the Copy value option to copy the token into your clipboard.
- **How do I find the rule ID?**
  1. Open the rule editor in Integrate
  2. Along the top of the rule editor window, it will display `Rule Editor - 'Rule Name' (id={id})`
  3. The integer after `id=` is the rule ID
- **How do I adjust this for other rules?**
  - The main issue is adjusting the input parameters to match your rule's inputs.

---

## Support

Reach out to me at one of the following places!

- Website at <a href="https://inflectionit.com" target="_blank">inflectionit.com</a>
- Email at <a href="mailto://contact@inflectionit.com">contact@inflectionit.com</a>

---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
