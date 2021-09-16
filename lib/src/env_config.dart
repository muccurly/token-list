//TODO: change default values to dummy values before release
class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment(
    'EXAMPLE_APP_NAME',
    defaultValue: 'Jurta',
  );

  static const APP_SUFFIX = String.fromEnvironment('EXAMPLE_APP_SUFFIX');

  static const API_URL_DM = String.fromEnvironment(
    'EXAMPLE_API_URL_DM',
    defaultValue: 'https://dm-dev.jurta.kz',
  );

  static const API_URL_VM = String.fromEnvironment(
    'EXAMPLE_API_URL_VM',
    defaultValue: 'https://vm-dev.jurta.kz',
  );

  static const API_URL_GM = String.fromEnvironment(
    'EXAMPLE_API_URL_GM',
    defaultValue: 'https://gm-dev.jurta.kz',
  );

  static const API_URL_UM = String.fromEnvironment(
    'EXAMPLE_API_URL_UM',
    defaultValue: 'https://um-dev.jurta.kz',
  );

  static const API_URL_FM = String.fromEnvironment(
    'EXAMPLE_API_URL_FM',
    defaultValue: 'https://fm-dev.jurta.kz',
  );

  static const API_VERSION = String.fromEnvironment(
    'EXAMPLE_API_VERSION',
    defaultValue: 'open-api',
  );
}
