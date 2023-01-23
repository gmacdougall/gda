require 'mkmf'

# :stopdoc:

ENV['PKG_CONFIG_PATH'] ||= '/usr/local/lib/pkgconfig'

dir_config 'libgda'

def asplode missing
  abort <<-MSG
#{missing} is missing. Try 'brew install libgda' if you are on OSX and have homebrew installed.
You can also check https://github.com/GNOME/libgda for more info on how to install
the dependency.
MSG
end

pkg_config 'libgda-6.0'
find_header('libgda/sql-parser/gda-sql-parser.h') || asplode("libgda")

create_makefile 'gda'


# :startdoc:
