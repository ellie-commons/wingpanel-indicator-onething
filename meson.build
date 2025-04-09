project(
    'onething',
    'vala', 'c',
    version: '1.0.0'
)

gnome = import('gnome')
i18n = import('i18n')
gettext_name = meson.project_name() + '-indicator'

prefix = get_option('prefix')
libdir = prefix / get_option('libdir')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(gettext_name), language:'c')
add_project_arguments('-DG_LOG_DOMAIN="io.github.ellie_commons.wingpanel-indicator-onething"', language:'c')



wingpanel_dep = dependency('wingpanel')
wingpanel_indicatorsdir = wingpanel_dep.get_variable('indicatorsdir', pkgconfig_define: ['libdir', libdir])

config_data = configuration_data()
config_data.set_quoted('LOCALEDIR', prefix / get_option('localedir'))
config_data.set_quoted('GETTEXT_PACKAGE', meson.project_name() + '-indicator')
config_data.set_quoted('DATADIR', prefix / get_option('datadir') / meson.project_name())
config_file = configure_file(
    input: 'src/Config.vala.in',
    output: '@BASENAME@',
    configuration: config_data
)

shared_module(
    meson.project_name(),
    configure_file(input: 'src/Config.vala.in', output: '@BASENAME@', configuration: config_data),
    'src/Indicator.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('granite'),
        dependency('gtk+-3.0'),
        dependency('wingpanel'),
    ],
    install: true,
    install_dir : dependency('wingpanel').get_variable('indicatorsdir')
)

subdir('data')
subdir('po')

gnome.post_install(glib_compile_schemas: true)