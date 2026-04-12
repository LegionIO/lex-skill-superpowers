# Systematic Debugging

Diagnose before fixing. Form a hypothesis, test it, fix the root cause.

## Process

1. Reproduce the failure with a minimal test case
2. Read the error — don't guess
3. Form one hypothesis about root cause
4. Add a probe (log, assertion, failing test) to verify
5. Fix the confirmed root cause, not symptoms
6. Verify the fix and add a regression test
7. Commit

Never fix without reproducing. Never ship a fix without a test.
