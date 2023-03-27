env:
	rm -rf .venv && python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip &&  pip install -e .\[test]

test:
	pytest tests/unit

job:
    dbx deploy --workflows=daiwt-STAGING-telco-churn-sample-integration-test-Paris -e staging --from-assets
	dbx launch daiwt-STAGING-telco-churn-sample-integration-test-Paris -e staging  --trace

clean:
	rm -rf *.egg-info && rm -rf .pytest_cache

format:
	black .

lint:
	prospector --with-tool mypy --profile prospector.yaml && black --check lendingclub_scoring