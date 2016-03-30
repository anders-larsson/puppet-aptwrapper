#
class aptwrapper(
  $sources              = {},
  $sources_hiera_merge  = false,
  $keys                 = {},
  $keys_hiera_merge     = false,
  $ppas                 = {},
  $ppas_hiera_merge     = false,
  $pins                 = {},
  $pins_hiera_merge     = false,
  $settings             = {},
  $settings_hiera_merge = false,
) {

  if is_string($sources_hiera_merge) {
    $_sources_hiera_merge = str2bool($sources_hiera_merge)
  } else {
    $_sources_hiera_merge = $sources_hiera_merge
  }
  if is_string($keys_hiera_merge) {
    $_keys_hiera_merge = str2bool($keys_hiera_merge)
  } else {
    $_keys_hiera_merge = $keys_hiera_merge
  }
  if is_string($settings_hiera_merge) {
    $_settings_hiera_merge = str2bool($settings_hiera_merge)
  } else {
    $_settings_hiera_merge = $settings_hiera_merge
  }
  if is_string($ppas_hiera_merge) {
    $_ppas_hiera_merge = str2bool($ppas_hiera_merge)
  } else {
    $_ppas_hiera_merge = $ppas_hiera_merge
  }
  if is_string($pins_hiera_merge) {
    $_pins_hiera_merge = str2bool($pins_hiera_merge)
  } else {
    $_pins_hiera_merge = $pins_hiera_merge
  }

  validate_bool($_sources_hiera_merge)
  validate_bool($_keys_hiera_merge)
  validate_bool($_settings_hiera_merge)
  validate_bool($_ppas_hiera_merge)
  validate_bool($_pins_hiera_merge)

  # manage sources if present
  if $sources {
    if $_sources_hiera_merge {
      $_sources = hiera_hash(aptwrapper::sources)
    } else {
      $_sources = $sources
    }
    validate_hash($_sources)
    create_resources('apt::source', $_sources)
  }
  # manage keys if present
  if $keys {
    if $_keys_hiera_merge {
      $_keys = hiera_hash(aptwrapper::keys)
    } else {
      $_keys = $keys
    }
    validate_hash($_keys)
    create_resources('apt::key', $_keys)
  }
  # manage ppas if present
  if $ppas {
    if $_ppas_hiera_merge {
      $_ppas = hiera_hash(aptwrapper::ppas)
    } else {
      $_ppas = $ppas
    }
    validate_hash($_ppas)
    create_resources('apt::ppa', $_ppas)
  }
  # manage settings if present
  if $settings {
    if $_settings_hiera_merge {
      $_settings = hiera_hash(aptwrapper::settings)
    } else {
      $_settings = $settings
    }
    validate_hash($_settings)
    create_resources('apt::setting', $_settings)
  }

  # manage pins if present
  if $pins {
    if $_pins_hiera_merge {
      $_pins = hiera_hash(aptwrapper::pins)
    } else {
      $_pins = $pins
    }
    validate_hash($_pins)
    create_resources('apt::pin', $_pins)
  }
}
