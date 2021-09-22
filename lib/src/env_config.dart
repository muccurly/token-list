//TODO: change default values to dummy values before release
class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment(
    'EXAMPLE_APP_NAME',
    defaultValue: 'Jurta',
  );

  static const APP_SUFFIX = String.fromEnvironment('EXAMPLE_APP_SUFFIX');

  static const API_URL_DM = String.fromEnvironment(
    'EXAMPLE_API_URL_DM',
    defaultValue: 'https://dm.jurta.kz',
  );

  static const API_URL_VM = String.fromEnvironment(
    'EXAMPLE_API_URL_VM',
    defaultValue: 'https://vm.jurta.kz',
  );

  static const API_URL_GM = String.fromEnvironment(
    'EXAMPLE_API_URL_GM',
    defaultValue: 'https://gm.jurta.kz',
  );

  static const API_URL_UM = String.fromEnvironment(
    'EXAMPLE_API_URL_UM',
    defaultValue: 'https://um.jurta.kz',
  );

  static const API_URL_FM = String.fromEnvironment(
    'EXAMPLE_API_URL_FM',
    defaultValue: 'https://fm.jurta.kz',
  );

  static const API_VERSION = String.fromEnvironment(
    'EXAMPLE_API_VERSION',
    defaultValue: 'open-api',
  );
}
