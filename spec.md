# Project bRAND gAURDIAN
An AI-powered compliance auditing system that analyzes Youtube advertising policies.
The application accepts a Youtube URL, extracts and OCR using Azure Video Indexer, retrieves relevant compliance policies from Azure AI Search, and uses Azure OpenAI GPT-40 to determine whether the advertisement complies with the provided policies.

## Goals
- Automate advertisement compliance review
- Reduce manual review effort
- Generate explainable compliance reports
- Demonstrate enterprise RAG architecture

## Functional Requirements
Input
- youtube URL

output
- Transcript
- OCR
- Metadata
- Retrieved policies
- Compliance Report
- PASS / FAIL

## Workflow
YouTube URL -> Video Indexer -> Transcript + OCR -> Azure AI Search -> Relevant Policies -> Azure OpenAI -> Compliance Report

## Non functional Requirements
Python 3.12
FastAPI
Azure OpenAI
Azure AI Search
Azure Video Indexer
Simple modular architecture
Pydantic models
No database

## Deliverables
Working API
Unit tests
README
Dockerfile
Requirements
Simple report generation

## Folder Structure Goal
- backend/
    - data/
    - scripts/
    - src/
    - tests/
- main.py