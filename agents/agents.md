## Writing code
* Do NOT add comments to code unless instructed
* Be succinct and to the point, sacrifice grammar for brevity
* When opening a PR, follow these rules:
    - stick to ASD-STE100 for simple english
    - explain the what and why this change is being introduced
    - don't say "it makes it faster", prove with numbers (e.g. 30% less allocations)
* Don't overcomplicate, don't reinvent the wheel. If the library provides a function, use that instead
* Stick to YAGNI principles, prefer one-liner solutions whenever possible.
* Make decisions for the long term, enabling an architecture that can evolve, do not accept a stopgap  that only works for now
* When deleting code, leave no vestigial traces, whale legs, or references to the old implementation.
* Avoid defensive programming.
  - Do not implement redundant safety checks just to suppress potential errors.
  - Restrict validation and sanitization strictly to integration/system boundaries, trusting internal function contracts.

## Reviewing code
* NEVER reply to GitHub comments unless explicitly told to do so
* Questions need to be validated: if you don't know the answer, create a throwaway test case to confirm or reject the review.


## Writing tests
* Prefer integration tests instead of unit tests, always test the feature as a whole

