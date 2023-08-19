# Declaring an IDE with evalModules {#declaring-an-ide-with-evalmodules}

2023-08-19

## What you'll learn

* 



## Why

```toml
[interpreter]
command = [
    "prybar-nodejs",
    "-q",
    "--ps1",
    "\u0001\u001b[33m\u0002\u0001\u001b[00m\u0002 ",
    "-i"
]

[env]
XDG_CONFIG_HOME = "$REPL_HOME/.config"
PATH = "$REPL_HOME/.config/npm/node_global/bin:$REPL_HOME/node_modules/.bin"
npm_config_prefix = "$REPL_HOME/.config/npm/node_global"

[packager]
language = "nodejs"
  [packager.features]
  packageSearch = true
  guessImports = true
  enabledForHosting = false

[languages]
[languages.javascript]
pattern = "**/{*.js,*.jsx,*.ts,*.tsx,*.json}"
[languages.javascript.languageServer]
start = "typescript-language-server --stdio"
```


## What is evalModules

## Module system basics

## Benefits of the module system

* Easy to define types
* Composability
* Easy to track dependencies
* Build into various artifacts:
  * Docker container layers
  * Disk images
  * VM tests

## The future at Replit

```toml
entrypoint = "index.js"
modules = ["nodejs-18:v3-20230608-f4cd419"]
hidden = [".config", "package-lock.json"]
[nix]
channel = "stable-23_05"
[deployment]
run = ["sh", "-c", "node index.js"]
```

```json
{
  "debuggers": {
    "nodeDAP": {
      "compile": null,
      "extensions": [],
      "fileParam": true,
      "filePattern": "",
      "files": [],
      "initializeMessage": {
        "arguments": {
          "adapterID": "dap-node",
          "clientID": "replit",
          "clientName": "replit.com",
          "columnsStartAt1": true,
          "linesStartAt1": true,
          "locale": "en-us",
          "pathFormat": "path",
          "supportsInvalidatedEvent": true,
          "supportsProgressReporting": true,
          "supportsRunInTerminalRequest": true,
          "supportsVariablePaging": true,
          "supportsVariableType": true
        },
        "command": "initialize",
        "type": "request"
      },
      "integratedAdapter": {
        "dapTcpAddress": null
      },
      "language": "javascript",
      "launchMessage": {
        "arguments": {
          "args": [],
          "console": "externalTerminal",
          "cwd": ".",
          "environment": [],
          "pauseForSourceMap": false,
          "program": "./$file",
          "request": "launch",
          "sourceMaps": true,
          "stopOnEntry": false,
          "type": "pwa-node"
        },
        "command": "launch",
        "type": "request"
      },
      "name": "Node DAP",
      "start": {
        "args": [
          "dap-node"
        ],
        "env": {}
      },
      "transport": "localhost:0"
    }
  },
  "description": "",
  "env": {
    "PATH": "$REPL_HOME/.config/npm/node_global/bin:$REPL_HOME/node_modules/.bin:/nix/store/vmd368fmaklyyj232fvnrawqffd4zwq4-nodejs-20.3.1/bin",
    "XDG_CONFIG_HOME": "$REPL_HOME/.config",
    "npm_config_prefix": "$REPL_HOME/.config/npm/node_global"
  },
  "formatters": {},
  "id": "nodejs-20",
  "initializers": {},
  "languageServers": {
    "typescript-language-server": {
      "configuration": null,
      "extensions": [
        ".js",
        ".jsx",
        ".ts",
        ".tsx",
        ".json"
      ],
      "filePattern": "",
      "files": [],
      "initializationOptions": null,
      "language": "javascript",
      "name": "TypeScript Language Server",
      "start": "/nix/store/gx32fpn4758z67wa4hqc4wcd7mqrvl9z-typescript-language-server-3.3.2/bin/typescript-language-server --stdio"
    }
  },
  "name": "Node.js 20 Tools",
  "packagers": {
    "upmNodejs": {
      "afterInstall": null,
      "env": {},
      "features": {
        "enabledForHosting": false,
        "guessImports": true,
        "packageSearch": true
      },
      "ignoredPackages": [],
      "ignoredPaths": [],
      "language": "nodejs",
      "name": "UPM for Node.js"
    }
  },
  "runners": {
    "nodeJS": {
      "compile": null,
      "extensions": [],
      "fileParam": true,
      "filePattern": "",
      "files": [],
      "interpreter": false,
      "language": "javascript",
      "name": "Node.js",
      "productionOverride": null,
      "prompt": "",
      "start": "/nix/store/vmd368fmaklyyj232fvnrawqffd4zwq4-nodejs-20.3.1/bin/node $file"
    },
    "nodeJS-prybar": {
      "compile": null,
      "extensions": [],
      "fileParam": false,
      "filePattern": "",
      "files": [],
      "interpreter": true,
      "language": "javascript",
      "name": "Prybar for Node.js",
      "optionalFileParam": true,
      "productionOverride": null,
      "prompt": "",
      "start": "/nix/store/wfrn5szb5rr6f3y695jl2il3msp0033a-run-prybar/bin/run-prybar $file"
    }
  }
}
```
