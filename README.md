# puppet-scala
A puppet module to install scala from tarball.

## Usage

Install and enviroment configuration:

    class { 'scala': }

Install a certain version and set instalation directory:

    class{ 'scala':
        packageURL => "http://downloads.typesafe.com/scala/2.11.4/scala-2.11.4.tgz",
        destination => "/usr/lib/scala",
    }

