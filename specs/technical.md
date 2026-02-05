# Technical Specifications

## API Contracts

### 1. Trend Data Structure
```json
{
  "trend_id": "uuid-v4",
  "topic": "string",
  "platform": "twitter|instagram|tiktok",
  "growth_rate": "float",
  "volume": "integer",
  "sentiment": "positive|neutral|negative",
  "relevance_score": "float (0.0-1.0)",
  "timestamp": "iso-8601",
  "sample_content": ["string"]
}
2. Content Generation Request

{
  "request_id": "uuid-v4",
  "agent_id": "string",
  "content_type": "image|video|text|caption",
  "prompt": "string",
  "style_references": ["string"],
  "character_constraints": {
    "consistency_id": "string",
    "voice_profile": "string"
  },
  "platform_constraints": {
    "max_length": "integer",
    "hashtags": ["string"],
    "disclosure_required": "boolean"
  }
}
3. Task Queue Schema

{
  "task_id": "uuid-v4",
  "task_type": "research|generate|engage|commerce",
  "priority": "high|medium|low",
  "payload": "object",
  "assigned_to": "agent-id",
  "status": "pending|processing|completed|failed",
  "created_at": "iso-8601",
  "updated_at": "iso-8601"
}
Database Schema (PostgreSQL)
Tables:
sql
-- Videos table
CREATE TABLE videos (
    id UUID PRIMARY KEY,
    agent_id VARCHAR(255),
    platform VARCHAR(50),
    title TEXT,
    description TEXT,
    tags JSONB,
    media_urls JSONB,
    engagement_metrics JSONB,
    created_at TIMESTAMPTZ,
    published_at TIMESTAMPTZ,
    confidence_score FLOAT,
    status VARCHAR(20)
);

-- Agent financials
CREATE TABLE agent_financials (
    agent_id VARCHAR(255) PRIMARY KEY,
    wallet_address VARCHAR(255) UNIQUE,
    balance_usdc DECIMAL(18, 6),
    daily_spent DECIMAL(18, 6),
    total_earned DECIMAL(18, 6),
    last_reset TIMESTAMPTZ
);

-- Task history
CREATE TABLE task_history (
    task_id UUID PRIMARY KEY,
    agent_id VARCHAR(255),
    task_type VARCHAR(50),
    status VARCHAR(20),
    input_payload JSONB,
    output_payload JSONB,
    error_message TEXT,
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ
);
MCP Tool Definitions
Twitter Post Tool:

{
  "name": "post_to_twitter",
  "description": "Publish content to Twitter/X",
  "inputSchema": {
    "type": "object",
    "properties": {
      "text": {"type": "string", "maxLength": 280},
      "media_urls": {"type": "array", "items": {"type": "string"}},
      "reply_to": {"type": "string"}
    },
    "required": ["text"]
  }
}
Wallet Balance Tool:
{
  "name": "get_wallet_balance",
  "description": "Check agent wallet balance",
  "inputSchema": {
    "type": "object",
    "properties": {
      "agent_id": {"type": "string"},
      "currency": {"type": "string", "enum": ["USDC", "ETH"]}
    },
    "required": ["agent_id"]
  }
}