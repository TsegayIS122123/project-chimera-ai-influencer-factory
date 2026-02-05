Agent Skills Framework
Overview
Skills are reusable capabilities that Chimera agents can execute. Each skill follows a strict input/output contract pattern.

Skill Structure
text
skills/
├── skill_trend_research.py     # Market trend analysis
├── skill_generate_content.py   # Multimodal content creation
├── skill_manage_engagement.py  # Social interaction management
├── skill_execute_transaction.py # Economic transactions
└── skill_validate_content.py   # Quality and safety checks
Contract Pattern
All skills must implement:

Input Schema: Pydantic model defining required parameters

Output Schema: Pydantic model defining return structure

execute() function: Main implementation with error handling

Validation: Input validation before execution

Logging: Structured logging for telemetry

Example Skill Contract
skill_trend_research.py
python
from pydantic import BaseModel, Field
from typing import List, Optional
from datetime import datetime

class TrendResearchInput(BaseModel):
    platforms: List[str] = Field(..., description="Platforms to research")
    keywords: List[str] = Field(..., description="Search keywords")
    time_range_hours: int = Field(24, description="Time range for analysis")
    min_confidence: float = Field(0.7, description="Minimum confidence threshold")

class TrendResearchOutput(BaseModel):
    success: bool
    trends: List[dict]
    analysis_summary: str
    confidence_score: float
    error_message: Optional[str]
    timestamp: datetime

def execute_trend_research(input_data: TrendResearchInput) -> TrendResearchOutput:
    """Research trends across specified platforms"""
    # Implementation uses MCP tools for data collection
    pass
Skill Dependencies
Skills depend on MCP tools for external operations:

Social media APIs via MCP servers

AI models via MCP inference servers

Databases via MCP connectors

Blockchain via AgentKit MCP

Testing
Each skill must have corresponding tests in tests/test_skills_*.py that validate the contract before implementation.