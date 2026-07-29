#!/bin/bash

# Install OpenCode globally in every new codespace
curl -fsSL https://opencode.ai/install | bash

# Install Freebuf globally in every new codespace
npm install -g freebuff

# Create the global configuration directory for OpenCode
mkdir -p ~/.config/opencode

# Inject the AgentRouter / OpenRouter configuration into the global config
cat << 'EOF' > ~/.config/opencode/opencode.json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "anthropic": {
      "options": {
        "baseURL": "https://agentrouter.ai"
      }
    },
    "openai": {
      "options": {
        "baseURL": "https://agentrouter.ai/v1"
      }
    }
  }
}
EOF

# Create the credentials file so you don't get prompted to log in
mkdir -p ~/.local/share/opencode
cat << 'EOF' > ~/.local/share/opencode/auth.json
{
  "anthropic": "sk-h5XxOfCn6Uqt4Mb4OIuUXBUvTyKu80cENmeNytHM1avgDMGc",
  "openai": "sk-h5XxOfCn6Uqt4Mb4OIuUXBUvTyKu80cENmeNytHM1avgDMGc"
}
EOF
