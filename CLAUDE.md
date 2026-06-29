# CLAUDE.md

Brand Guardian System Guide

## Project Overview
An enterprise-grade, multi-agent AI pipeline for automated video and ad compliance auditing.
- **Tech Stack :** Python 3.12, FastAPI, LangGraph, Azure OpenAI, Azure AI Search, Azure Video indexer, PostgreSQL, Redis.

This file provides guidance to Claude Code when working with the Brand Guardian AI compliance auditing system.

Common Development Commands

- Server: uv run uvicorn backend.app.main:app --reload
- Test Suite: uv run pytest (or uv run pytest tests/test_agents.py for specific tests)
- Linting: uv run ruff check .
- Auto-fix Linting: uv run ruff check . --fix
- Celery Worker: uv run celery -A backend.app.core.celery_app worker --loglevel=info

Code Architecture Overview

The system follows a modular fastAPI architecture with three core components:
1. Workflow Engine (backend/src/graph/workflow.py)
  - Implements LangGraph-based multi-agent workflow
  - Core pipeline: YouTube URL → Azure Video Indexer → Compliance Rules → GPT-40 Evaluation
  - Key nodes: Indexer (transcript/OCR), Auditor (policy checking), Report Generator

2. API Layer (backend/src/api)
  - REST endpoints for initiating audits
  - Telemetry tracking via backend/src/api/telemetry.py

3. Service Abstractions (backend/src/services)
  - video_indexer.py handles Azure Video Indexer integration
  - Data storage in backend/data (PDF specs, influencer guides)

Key Dependencies

- Azure services: Azure Video Indexer, Azure AI Search, Azure OpenAI (GPT-40)
- Tech stack: Python 3.12, FastAPI, LangGraph, Pydantic, Azure SDKs
- No database: All state managed in-memory via the LangGraph workflow

Workflow Highlights

1. Ingests YouTube URL and extracts transcript/OCR via Azure Video Indexer
2. Retrieves relevant policies from Azure AI Search
3. Uses Azure OpenAI to analyze content against policies
4. Generates structured compliance report with explanations

This architecture emphasizes separation between ingestion (Azure), processing (LangGraph), and reporting (API), aligned with the specs.md workflow definition.

