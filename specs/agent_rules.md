# Project Chimera - Agent Rules Specification

## Purpose
This document specifies how AI agents should generate behavioral rules files for Project Chimera. This is NOT the rules file itself, but the specification an AI agent would read to create comprehensive rules.

## Rule Generation Principles

### 1. Project Context Injection
**Every rules file MUST include:**
- Project name and purpose: "Project Chimera - Autonomous AI Influencer Factory"
- Core philosophy: "Spec-Driven Development (SDD)"
- Architecture pattern: "Hierarchical agent swarm with FastRender orchestration"
- Success metrics: "Content engagement, safety compliance, system reliability"

### 2. Prime Directives (Non-Negotiable)
**These directives MUST be enforced:**
1. "NEVER generate implementation code without first consulting and understanding the relevant specification document"
2. "ALWAYS validate generated code against technical specifications and acceptance criteria"
3. "PRIORITIZE security and safety in all code generation decisions"
4. "MAINTAIN traceability between requirements, specifications, and implementation"

### 3. Specification Referencing Patterns

#### A. Mandatory Spec Checks
```markdown
Before coding ANY feature:
1. Check specs/functional.md for user stories
2. Check specs/technical.md for API contracts
3. Check specs/security.md for constraints
4. Check acceptance criteria in functional.md
B. Spec Validation Rules
If spec is ambiguous → Request clarification from human

If spec conflicts with existing code → Flag conflict for resolution

If spec is missing required details → Generate spec draft for review

4. Ambiguity Handling Protocol
Levels of Ambiguity:
Level 1: Minor ambiguity (e.g., naming conventions)

Action: Make reasonable assumption, document assumption

Level 2: Medium ambiguity (e.g., missing validation rules)

Action: Propose solution, request confirmation

Level 3: Major ambiguity (e.g., conflicting requirements)

Action: Escalate to human immediately, pause work

Escalation Template:
text
URGENT: Ambiguity Detected
Spec: [spec_file.md]
Section: [section_name]
Issue: [clear description]
Impact: [what cannot be implemented]
Proposed Resolution: [your suggestion]
Request: [human action needed]
5. Code Generation Constraints
A. Security Constraints
NEVER hardcode API keys or secrets

ALWAYS validate user inputs

MUST implement proper error handling

MUST follow security.md guidelines

B. Architecture Constraints
Use dependency injection pattern

Implement proper logging (structured JSON)

Follow established naming conventions

Maintain backward compatibility where specified

C. Testing Requirements
Write tests BEFORE implementation (TDD)

Cover happy paths AND edge cases

Mock external dependencies

Achieve minimum 80% code coverage

6. Forbidden Actions
Agents MUST NOT:

Modify specification files without explicit human approval

Bypass security controls or validation

Implement features not in specifications

Remove or disable tests

Introduce new dependencies without security review

Commit code that fails CI/CD pipeline

Access production data without authorization

7. Quality Assurance Rules
Code Review Criteria:
Spec compliance verified

Security requirements met

Tests written and passing

Documentation updated

Performance benchmarks met

No linting errors

CI/CD pipeline passes

Documentation Requirements:
Every function: docstring with params, returns, examples

Every module: module-level docstring

Every API endpoint: OpenAPI/Swagger documentation

Complex logic: inline comments explaining "why"

8. MCP Integration Rules
Tool Usage Protocol:
Always use MCP servers for external operations

Validate tool responses before processing

Implement retry logic with exponential backoff

Log all tool interactions for audit trail

Required MCP Servers:
Database connector (PostgreSQL/Weaviate)

File system operations

Git operations

External API connectors (social media, LLMs)

9. Error Handling & Recovery
Error Classification:
Recoverable: Network timeouts, rate limits

Action: Retry with backoff, log warning

Non-recoverable: Authentication failures, invalid data

Action: Abort operation, raise exception

Security: Unauthorized access, injection attempts

Action: Block immediately, alert security

Recovery Procedures:
Log error with context (timestamp, operation, user)

Attempt automatic recovery if safe

If automatic recovery fails → human escalation

Update error knowledge base for future prevention

10. Performance Optimization Rules
Optimization Priorities:
Safety and correctness

System reliability

Response time

Resource efficiency

Development velocity

Performance Thresholds:
API response: < 200ms p95

Database queries: < 50ms p99

Memory usage: < 80% of allocated

CPU usage: < 70% sustained

11. Human-in-the-Loop Integration
When to Request Human Input:
Content approval/rejection

Ambiguity resolution (Level 3)

Security policy exceptions

Production deployment approval

Major architectural decisions

Human Communication Protocol:
Be concise but complete

Provide context and impact

Suggest options with recommendations

Respect human response time expectations

12. Continuous Improvement Rules
Feedback Integration:
Analyze test failures for patterns

Review performance metrics weekly

Incorporate human feedback into rules

Update rules based on incident learnings

Knowledge Base Maintenance:
Document common pitfalls and solutions

Update patterns based on successful implementations

Share learnings across agent instances

Rule File Generation Template
Agents should generate rules files using this structure:

markdown
# Project Chimera Agent Rules

## Context
[Generated from section 1]

## Prime Directives
[Generated from section 2]

## Spec Referencing
[Generated from section 3]

## Ambiguity Handling
[Generated from section 4]

## Code Generation
[Generated from section 5]

## Quality Assurance
[Generated from section 7]

## Error Handling
[Generated from section 9]

## Performance
[Generated from section 10]

## Human Collaboration
[Generated from section 11]
Validation Criteria
A successful rules file MUST:

Cover all sections above

Be specific to Project Chimera context

Include concrete examples where helpful

Be actionable by AI agents

Align with overall system architecture