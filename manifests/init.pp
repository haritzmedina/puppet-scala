class scala(
  $packageURL = $scala::params::packageURL,
  $ensure = $scala::params::ensure,
  $destination = $scala::params::destination,
)inherits scala::params{

  # Get install path
  $filenameArray = split($scala::packageURL, '/')
  $basefilename = $filenameArray[-1]
  $basename = regsubst($basefilename, '^(.+)\.(zip|tgz|tar\.\w+)$', '\1')
  $installPath = "${destination}/${basename}"

  # Import classes
  class {'scala::package':}
  class {'scala::config':}

  # Declare anchors
  anchor {'scala::begin': }
  anchor {'scala::end': }

  if ($ensure == "present"){
    Anchor ['scala::begin']
    -> Class['scala::package']
    -> Class['scala::config']
    -> Anchor ['scala::end']
  }
}