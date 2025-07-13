# Test
Instructions for running tests with the Ansible-based `duplic8r` setup.

> [!IMPORTANT]
> **Migration Notice**: The testing framework has been updated to work with the
> new Ansible-based installation. The legacy shell script testing components are
> deprecated.


## Quick Start
The fastest way to test the Ansible-based setup:
```bash
# Interactive menu
cd test && ./quick-test.sh

# Or run specific tests
cd test && ./quick-test.sh full      # Complete test sequence
cd test && ./quick-test.sh dev       # Test development branch
cd test && ./quick-test.sh shell     # Interactive container shell
```


## Test Components
The test framework includes the following components for testing the
Ansible-based installation:

+ `test/Dockerfile` - The Dockerfile for the test image
+ `test/build-dotfile` - Build the test Docker image
+ `test/start-dotfile` - Start test container for Ansible testing
+ `test/stop-dotfile` - Stop the test container
+ `test/mount-dotfile` - Mount local repository for testing
+ `test/remove-dotfile` - Remove test artifacts
+ `test/full-test.sh` - Comprehensive Ansible testing script
+ `test/quick-test.sh` - Interactive test menu and quick test runner
+ `test/README.md` - Detailed testing documentation

### Ansible Testing Workflow
The test environment sets up a container where:
- The `duplic8r` repository is mounted into the container at `/workspace/duplic8r`
- Ansible playbooks can be tested in a controlled environment
- Both local development and remote repository testing are supported

For local testing (recommended for development):
```bash
cd test
./build-dotfile        # Build test image
./start-dotfile        # Start container with mounted repository
# Container will have the current repository mounted for testing
```

For remote testing (tests actual deployment):
```bash
cd test
./full-test.sh run     # Run complete test suite
```


## Legacy Test Components (Deprecated)
> [!WARNING]
> The following components were part of the legacy shell script testing and are
> **deprecated**:

<details>
<summary>Legacy test components (click to expand)</summary>
+ `test/start-localtestcontainer` - Legacy local testing setup
+ `test/start-remotetestcontainer` - Legacy remote testing setup  
+ `test/test-localinstall` - Legacy install script testing

These components tested the deprecated shell-based `install` script and should
not be used for new testing.
</details>


## More Information
For detailed testing instructions and examples, see the [test README](../test/README.md).
