# pin.pp
# pin a release in apt, useful for unstable repositories

define apt::pin(
	$packages = '*',
	$priority = 0
) {

	include apt
	
	file { "${name}.pref":
		name => "${apt::root}/preferences.d/${name}",
		ensure => file,
		owner => root,
		group => root,
		mode => 644,
		content => "# ${name}\nPackage: ${packages}\nPin: release a=${name}\nPin-Priority: ${priority}",
	}

}
