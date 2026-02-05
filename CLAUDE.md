# Project Chimera - Claude Instructions

## Project Overview
Building a scalable factory for autonomous AI influencers with economic agency.

## Core Architecture
- FastRender Swarm: Planner → Worker → Judge with OCC
- MCP Integration: All external tools via Model Context Protocol
- Agentic Commerce: Coinbase AgentKit for financial autonomy
- Polyglot Persistence: PostgreSQL + Weaviate + Redis + Blockchain

## Development Rules
1. **SPEC-DRIVEN**: Always check specs/ directory before coding
2. **TDD**: Write failing tests first in tests/
3. **MCP**: All external integrations via MCP servers
4. **TRACEABILITY**: Tenx MCP telemetry must remain active
5. **GIT HYGIENE**: Atomic commits with architectural explanations

## Critical Path
1. Complete specifications (specs/ directory)
2. Implement failing tests (tests/ directory)
3. Build skills framework (skills/ directory)
4. Set up CI/CD pipeline (.github/workflows/)

## MCP Status
- Tenx telemetry: Active and connected
- Configuration: .vscode/mcp.json and .cursor/mcp.json
- Tools discovered: 3 Tenx analytics tools

## Ask Before Implementing
- Have you checked the relevant spec?
- Have you written a failing test?
- Does this use MCP for external tools?
- Is Tenx MCP connected and logging?