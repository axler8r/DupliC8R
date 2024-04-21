# Test
Instructions for running the tests.

## Test Components
The test components are self explanatory. The only test artifact that is of
special interest is `test/start-localinstall`. The test components are as
follows:
+ `test/Dockerfile` - The Dockerfile for the test image.
+ `test/new-testimage` - Build the test image.
+ `test/remove-testimage` - Remove the test image.
+ `test/start-localtestcontainer` - Start the test container for 'local'
    testing. This script sets up a test environment where intall components are
    mounted into the test container to make sure that the install script works
    as expected. It sets up the container so that the `duplic8r` repository is
    mounted into the container at `/home/duplic8r/.duplic8r`, and the `install`
    script is mounted into the container at `/home/duplic8r/install`. The
    `test-localinstall` script is also mounted into the container at
    `/home/duplic8r/test-localinstall`. Executing the `test-localinstall` script
    will run the `install` script in the container. It is called _local_ because
    the `duplic8r` repository is NOT cloned from the origin but is mounted from
    the host. This is useful for testing the `install` script in a controlled
    environment. For more information see the
    [Detailed Installation Instructions](../INSTALL.md).
+ `test/start-remotetestcontainer` - Start the test container for 'remote'
    testing. No special setup is performed for this test container. For more
    information see the [Installation Instructions](../README.md).
+ `test/stop-testcontainer` - Stop the test container.
+ `test/test-localinstall` - Perform a controlled test of the `install` script.
