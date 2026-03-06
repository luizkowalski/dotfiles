#!/usr/bin/env python3

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / "files" / "mcp" / "servers.json"
OPENCODE = ROOT / "files" / "opencode" / "config.json"
CURSOR = ROOT / "files" / "cursor" / "mcp.json"


def main() -> None:
    source = json.loads(SOURCE.read_text())
    shared = source["shared"]
    cursor_only = source.get("cursor", {})

    opencode = {
        "mcp": {
            name: {"type": "local", "command": [server["command"], *server["args"]]}
            for name, server in shared.items()
        },
        "plugin": ["@0xsero/open-queue"],
        "$schema": "https://opencode.ai/config.json",
    }

    cursor = {"mcpServers": {**shared, **cursor_only}}

    OPENCODE.write_text(json.dumps(opencode, indent=2) + "\n")
    CURSOR.write_text(json.dumps(cursor, indent=2) + "\n")


if __name__ == "__main__":
    main()
